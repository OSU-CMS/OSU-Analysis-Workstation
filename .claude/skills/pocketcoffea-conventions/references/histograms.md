# Histograms

PocketCoffea histograms are configured, not coded: the `HistManager` builds and fills
them automatically from the `variables` dict in the `Configurator`, following the
interface of the `scikit-hep/hist` library.

## `HistConf` and `Axis`

```python
cfg = Configurator(
    variables={
        "HT": HistConf([Axis(coll="events", field="events", bins=100, start=0, stop=200, label="HT")]),
        "leading_jet_pt_eta": HistConf([
            Axis(coll="JetGood", field="pt", bins=40, start=0, stop=200, pos=0, label="Leading jet $p_T$"),
            Axis(coll="JetGood", field="eta", bins=40, start=-5, stop=5, pos=0, label="Leading jet $\\eta$"),
        ]),
        # All jets together, not just the leading one
        "all_jets_pt": HistConf([
            Axis(coll="JetGood", field="pt", bins=40, start=0, stop=200, pos=None, label="All jets $p_T$"),
        ]),
    },
)
```

- A `HistConf` can hold any number of `Axis` objects (1D, 2D, ...) -- no separate API
  for multi-dimensional histograms. Watch memory for many-axis, many-bin histograms.
- `Axis.coll`/`Axis.field` select the array: `coll="events"` for a global/flat branch,
  otherwise the named collection (`"JetGood"`, `"MET"`, ...).
- `Axis.pos`: which object in the collection to plot. `pos=0` -> leading object only
  (missing entries are None-padded, not dropped). `pos=None` -> the collection is
  flattened first, so *all* objects across all events land in the same histogram (e.g.
  `Axis(coll="Jet", field="pt", pos=None)` plots every jet's pT, not just the
  leading one).
- Other `HistConf` fields worth knowing: `exclude_samples`/`only_samples`,
  `exclude_categories`/`only_categories` to scope a histogram; `variations=False` to
  skip producing systematic-shifted copies; `no_weights=True` to fill unweighted;
  `autofill=False` if filling will be handled manually via `fill_histograms_extra()`.

## Prefer the histogram factories

`pocket_coffea.parameters.histograms` ships factory functions returning dicts of
`HistConf` to unpack into `variables` with `**`, rather than hand-writing common
object histograms:

```python
variables={
    **jet_hists(coll="JetGood", pos=0),
    **ele_hists(coll="ElectronGood", pos=0),
    **muon_hists(coll="MuonGood", pos=0),
    **met_hists(coll="MET"),
    **lepton_hists(coll="LeptonGood", pos=0),
    **sv_hists(coll="SV"),
    **fatjet_hists(coll="FatJetGood"),
    **count_hist(name="nJets", coll="JetGood", bins=10, start=4, stop=14),
    **count_hist(name="nBJets", coll="BJetGood", bins=12, start=2, stop=14),
}
```

Check `pocket_coffea/parameters/histograms.py` for the current full set (also
includes `jet_taggers_hists`, `fatjet_taggers_hists`, `genjet_hists`, `parton_hists`,
`processing_metadata_hists`) before writing a bespoke `HistConf` for a standard CMS
object -- these factories already encode sensible binning/labels and are what most
PocketCoffea-based analyses use for the common physics objects.

## Custom axes for a whole workflow

To add an axis to *every* histogram in a custom processor (e.g. a `era` axis present
only for data chunks), override `define_custom_axes_extra()` or append `Axis` objects
to `self.custom_axes` in the processor constructor, rather than adding the same axis
by hand to every `HistConf` in the config.

## Debugging a missing or empty histogram

- `ValueError`/missing-key errors when filling usually mean the config requested a
  histogram whose underlying field (`coll`/`field`) was never created in that
  processing mode -- check where (or whether) `apply_object_preselection`/
  `count_objects`/`define_common_variables_*` populate it for the active workflow
  branch, not the histogram config itself.
- An unexpectedly empty or all-zero histogram, when the category itself has entries,
  often means an `exclude_categories`/`only_categories`/`exclude_samples`/
  `only_samples` filter on that `HistConf` is scoping it away from the case being
  checked -- check those before assuming an upstream selection bug.
