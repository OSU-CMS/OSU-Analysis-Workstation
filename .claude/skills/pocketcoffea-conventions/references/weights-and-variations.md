# Weights, variations, and calibrators

## Weights: decision-tree configuration, not hardcoded in the processor

Weights are assigned in the config, hierarchically -- `common` (all samples) first,
then `bysample` overrides/adds per sample, each split into `inclusive` (all
categories) and `bycategory` (specific categories):

```python
cfg = Configurator(
    weights_classes=common_weights,  # default if omitted
    weights={
        "common": {
            "inclusive": ["genWeight", "lumi", "XS", "pileup", "sf_ele_reco", "sf_ele_id",
                          "sf_mu_id", "sf_mu_iso", "sf_btag", "sf_jet_puId"],
            "bycategory": {"2jets_20pt": []},
        },
        "bysample": {
            "TTToSemiLeptonic": {"inclusive": [], "bycategory": {"2jets_20pt": []}},
        },
    },
)
```

Requesting a weight name that isn't registered in `weights_classes` is a
configuration-time error, not a silent no-op -- if a weight seems to have no effect,
first confirm it's actually spelled/registered correctly rather than assuming the
underlying scale factor is trivial.

Built-in common weights include `genWeight`, `lumi`, `XS`, `pileup`, `sf_ele_reco`,
`sf_ele_id`, `sf_mu_id`, `sf_mu_iso`, `sf_btag`, `sf_jet_puId` -- check
`pocket_coffea.lib.weights.common` for the current full set before writing a new
weight that duplicates one of these.

### Subsample-specific weights

If `datasets.subsamples` splits a sample (e.g. `TTToSemiLeptonic` into `__=1b`,
`__=2b`, `__>2b`), each subsample's full name (`{sample}__{suffix}`) can carry its own
`weights`/`variations` entries under `bysample`, layered on top of the parent
sample's. Get the suffix exactly right -- it must match the auto-generated
`{original_sample}__{subsample_suffix}` format, not an approximation of it.

### Custom weights

For a reusable scale factor, define a class deriving from `WeightWrapper`:

```python
class CustomTopSF(WeightWrapper):
    name = "top_sf"
    has_variations = True

    def __init__(self, params, metadata):
        super().__init__(params, metadata)
        self.sf_file = params["top_sf"]["json_file"]

    def compute(self, events, size, shape_variation):
        if shape_variation == "nominal":
            sf_data = sf_function.compute(self.sf_file, events)
            return WeightDataMultiVariation(name=self.name, nominal=sf_data["nominal"],
                                             up=[...], down=[...])
        return WeightData(name=self.name, nominal=np.ones(size))

cfg = Configurator(weights_classes=common_weights + [CustomTopSF], ...)
```

For a one-off computation not worth a full class, `WeightLambda.wrap_func(name=...,
function=..., has_variations=...)` wraps a plain function instead -- the function must
return a `WeightData`/`WeightDataMultiVariation`. Prefer this over computing a
weight-like column by hand in `workflow.py` and multiplying it in ad hoc -- doing it
as a registered weight keeps it visible to the `common`/`bysample`/`bycategory`
config and to the variations system.

## Variations: weights vs. shape

- **Weight variations**: if a `WeightWrapper` has up/down variations, just listing its
  name in `variations.weights` (same `common`/`bysample`/`bycategory` structure as
  `weights`) activates exporting the shifted histograms -- no separate implementation
  needed.
- **Shape variations** (JES, JER, lepton-scale, ...): come from the **Calibrators**
  system, not the weights system, and are more expensive -- everything from
  preselection onward is rerun once per active shape variation. Available shape
  variations depend on which calibrators are configured; requesting one that no
  configured calibrator provides is a configuration error, not a silent skip.

```python
variations = {
    "weights": {"common": {"inclusive": ["pileup", "sf_btag"], "bycategory": {}}},
    "shape": {"common": {"inclusive": ["JESTotal", "JER"]}},
}
```

## Calibrators

Object calibration and shape systematics are handled by a configured sequence of
`Calibrator` classes, applied in order once per active variation:

```python
from pocket_coffea.lib.calibrators.common import default_calibrators_sequence
# = [JetsCalibrator, METCalibrator, ElectronsScaleCalibrator]

cfg = Configurator(calibrators=default_calibrators_sequence, ...)
```

- **Order matters.** `METCalibrator` must come after `JetsCalibrator` since it
  propagates the jet corrections into MET -- don't reorder a calibrator sequence
  without checking what each one reads vs. produces.
- Omitting `calibrators` silently falls back to the framework default -- always set it
  explicitly so the actual calibration sequence is visible in the config, not implicit.
- A custom calibrator is just another class appended to the sequence (e.g. `[JetsCalibrator,
  METCalibrator, MyCustomMuonCalibrator]`) -- see the framework's `calibrators.md` doc
  for the implementation interface if writing a new one.

## Registering custom modules for Dask/Condor workers

Any user-defined module referenced by the config (custom cut functions, a custom
processor, custom weights) needs to be registered with `cloudpickle` so it can be
unpickled on a worker without needing an identical import path:

```python
import cloudpickle
cloudpickle.register_pickle_by_value(workflow)
cloudpickle.register_pickle_by_value(custom_cut_functions)
```

A worker-side `ImportError` for a local module during a Dask/Condor run is almost
always a missing registration here, not a genuinely missing dependency -- check this
before assuming the environment itself is broken.
