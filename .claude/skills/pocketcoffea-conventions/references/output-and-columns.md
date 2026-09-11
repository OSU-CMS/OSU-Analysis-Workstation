# Columns output and the standard `.coffea` output format

## `ColOut`: ntuple-style array export

Same `common`/`bysample`/`bycategory` structure as weights:

```python
cfg = Configurator(
    columns={
        "common": {"inclusive": [], "bycategory": {}},
        "bysample": {
            "TTToSemiLeptonic": {"inclusive": [ColOut("LeptonGood", ["pt", "eta", "phi"])]},
            "TTToSemiLeptonic__=1b": {"inclusive": [ColOut("JetGood", ["pt", "eta", "phi"])]},
        },
    },
)
```

```python
@dataclass
class ColOut:
    collection: str
    columns: List[str]
    flatten: bool = True       # flatten jagged arrays by default
    store_size: bool = True    # keep the per-event object count so it can be un-flattened later
    fill_none: bool = True
    fill_value: float = -999.0
    pos_start: int = None      # restrict to a range of objects in the collection
    pos_end: int = None
```

By default columns are accumulated across every chunk into one output file -- fine
for modest exports, but can exhaust memory for a large export. For that, set
`dump_columns_as_arrays_per_chunk` in `workflow_options` to a local or XRootD
directory: each chunk is written as its own parquet file (unflattened, full awkward
structure preserved) under `<dir>/<dataset>/<category>/`, instead of accumulating in
memory. Prefer this over a custom hand-rolled per-chunk export when the standard
`columns` accumulation risks running out of memory.

## The standard output schema

Every PocketCoffea run produces a `.coffea` accumulator with this shape (see
`docs/concepts.md#output-format` for the authoritative reference):

- **`cutflow`**: unweighted event counts per category, keyed
  `category -> dataset -> (sub)sample -> N`. This is what `cutflow_count`-style
  helpers in downstream analysis code read.
- **`sumw`**: weighted MC event counts, same key structure as `cutflow` minus the
  unweighted distinction.
- **`sum_genweights`**: total generator-weight sum per dataset, used by
  `postprocess()` to rescale histograms/`sumw` to the correct overall MC
  normalization -- present even for a partial/limited-file run, so a smoke test's
  normalization is still meaningful.
- **`variables`**: histogram name -> (sub)sample -> dataset -> `Hist` object. The
  category and systematic variation are axes *inside* each `Hist`, not separate
  dict levels; the data-taking period is not a separate key either (it's implicit
  in dataset name / `datasets_metadata`).
- **`columns`**: (sub)sample -> dataset -> category -> column name -> accumulated
  array, from the `ColOut` configuration above.
- **`datasets_metadata`**: provenance -- (sub)sample <-> dataset mapping split by
  data-taking period, plus per-dataset info (DAS name, cross-section,
  `sum_genweights`, event count, size). This is the authoritative place to check
  which datasets/subsamples actually contributed to a given output, rather than
  inferring it from file names.

## Configuration preservation

Every output directory also gets three files documenting exactly how it was
produced: `parameters_dump.yaml` (the full parameters set, reloadable), `config.json`
(human-readable dump of the `Configurator`, not directly rerunnable), and
`configurator.pkl` (pickled `Configurator`, directly rerunnable). The pickled
configurator is only valid to rerun against the **same PocketCoffea and analysis-code
version** that produced it -- if reusing an old `configurator.pkl`, check out the
matching commit first rather than assuming it's version-independent. The `.py`
config file itself is deliberately *not* saved (it may be built dynamically); the
dumped `Configurator` is the reliable record, not the source file.
