# Cuts, skim, preselection, and categories

## The `Cut` object

A `Cut` bundles a name, a parameter dict, and a plain function into one reusable,
serializable object:

```python
def NjetsNb(events, params, **kwargs):
    mask = (events.njet >= params["njet"]) & (events.nbjet >= params["nbjet"])
    return mask

cut = Cut(name="4j-2b", params={"njet": 4, "nbjet": 2}, function=NjetsNb)
```

Parametrize it with a factory function rather than writing a new `Cut(...)` per call
site:

```python
def getNjetNb_cut(njet, nb):
    return Cut(
        name=f"{njet}jet-{nb}bjet", params={"njet": njet, "nbjet": nb}, function=NjetsNb
    )
```

`pocket_coffea.lib.cut_functions` ships factories for common needs -- check there
before writing a new one: `get_HLTsel`/`get_HLTsel_custom` (trigger selection),
`get_L1sel`/`get_L1sel_custom`, `get_JetVetoMap`, `eventFlags` and `goldenJson`
(standard data-quality cuts), `get_nObj_min`/`get_nObj_eq`/`get_nObj_less` (object
count cuts), `get_nBtagMin`/`get_nBtagEq`, `get_nElectron`, `get_nMuon`,
`get_nPVgood`. `pocket_coffea.parameters.cuts.passthrough` is the always-true cut used
for an inclusive category.

## Skim vs. preselection vs. categories

Three distinct filtering stages, not interchangeable:

1. **Skim** -- runs first, on **raw NanoAOD**, before any object calibration. A list
   of `Cut`s ANDed together; only survivors get processed further. Must stay **loose
   enough to be invariant under every systematic variation applied later** -- e.g. a
   jet-count skim needs margin for JES/JER shifting a jet in or out of acceptance. This
   is the single most common source of a silent bias if violated.
2. **Preselection** -- a list of `Cut`s ANDed together, applied *after* object
   calibration/cleaning (`apply_object_preselection`, `count_objects`). Meant to drop
   most events not needed for any analysis category, so expensive per-event work
   (MVA evaluation, etc.) only runs on the reduced set.
3. **Categories** -- do not remove events. Each category is a set of `Cut`s combined
   with AND, and the resulting boolean masks are stored for histogram/column filling,
   not applied as a filter.

```python
cfg = Configurator(
    skim=[get_nPVgood(1), eventFlags, goldenJson, get_nObj_min(4, 15.0, "Jet"), get_HLTsel()],
    preselections=[semileptonic_presel_nobtag],
    categories=StandardSelection({
        "baseline": [passthrough],
        "1b": [get_nBtagEq(1, coll="BJetGood")],
        "2b": [get_nBtagEq(2, coll="BJetGood")],
    }),
)
```

## `StandardSelection` vs. `CartesianSelection`

- **`StandardSelection`**: a dict of category-name -> list of `Cut`s, each ANDed.
  Backed by coffea's `PackedSelection`, which **caps out at 64 masks total**.
- **`CartesianSelection`**: a list of `MultiCut` objects, each defining a set of
  mutually-exclusive bins along one axis (e.g. layer bin, before/after some
  requirement, cumulative cut stage); the tool builds the cartesian product of all
  axes automatically, overcoming the 64-mask limit internally. A `StandardSelection`
  can be embedded as `common_cats` for categories outside the cartesian product.

```python
categories = CartesianSelection(
    multicuts=[
        MultiCut(
            name="Njets",
            cuts=[get_nObj_eq(4, 15.0, "JetGood"), get_nObj_eq(5, 15.0, "JetGood"), get_nObj_min(6, 15.0, "JetGood")],
            cuts_names=["4j", "5j", "6j"],
        ),
        MultiCut(
            name="Nbjet",
            cuts=[get_nObj_eq(3, 15.0, "BJetGood"), get_nObj_eq(4, 15.0, "BJetGood"), get_nObj_min(6, coll="BJetGood")],
            cuts_names=["3b", "4b", "6b"],
        ),
    ],
    common_cats=StandardSelection({"inclusive": [passthrough], "4jets_40pt": [get_nObj_min(4, 40.0, "JetGood")]}),
)
```

Use `CartesianSelection` whenever a category set is naturally a product of
independent axes (a before/after axis times a binning axis times a cumulative-stage
axis is a common pattern for validation/systematic studies), not just when forced to
by the 64-mask ceiling -- it also keeps the config more readable than an equivalent
flat `StandardSelection` with one entry per combination.

## Saving a skim to disk

`Configurator(save_skimmed_files=<path or xrootd URL>)` writes one ROOT file per
processed chunk after the skim step and stops -- no categories, weights, or
histograms are computed in that run. Two `workflow_options["skim_mode"]` values:

- `"skim"` (default): saves events passing the raw-NanoAOD skim list, uncorrected.
- `"presel_any_variation"`: additionally dry-runs the full calibration loop across
  every active shape variation, OR-combines the per-variation preselection masks, and
  saves that superset (still uncalibrated) -- lets the skim already encode the
  analysis acceptance for every systematic, at the cost of running the full
  calibration loop once per chunk during the skim itself.

Either way, **the skim is bound to the calibration configuration used to produce
it** -- changing which calibrators are active, a JEC version, or which shape
variations are considered after the fact invalidates the old skim; it must be
re-run. Downstream, a skim's dataset JSON needs `"isSkim": true` in its metadata so
`sum_genweights` is reconstructed correctly (via the per-event
`skimRescaleGenWeight` branch); a skim job's own output also carries pre-skim
authoritative `sum_genweights`/`sum_signOf_genweights` in `metadata`, which
`postprocess()` uses to recover chunks that had zero surviving events (which
otherwise silently under-count normalization). Forgetting `isSkim: true` silently
mis-normalizes MC -- if a skim-derived dataset's yields look off by a
consistent-looking factor, check that flag first.
