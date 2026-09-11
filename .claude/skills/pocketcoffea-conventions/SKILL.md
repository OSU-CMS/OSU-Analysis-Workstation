---
name: pocketcoffea-conventions
description: Write or review PocketCoffea-based CMS analysis code (config.py, workflow.py) using the framework's own recommended patterns -- Cut/StandardSelection/CartesianSelection for cutflows and categories, HistConf/Axis (and the parameters.histograms factory functions) for histograms, WeightsManager/WeightWrapper for scale factors, ColOut for ntuple-style output, and the Calibrators system for object corrections/systematics. Use whenever adding or modifying a cut, category, histogram, weight, or column in a PocketCoffea config or processor, for any analysis that uses PocketCoffea. Do not use this for an analysis's own physics content (selections, formulas) -- only for whether the code uses the framework the way it's designed to be used.
---

# PocketCoffea Conventions

This skill is about *how* to write PocketCoffea code, not what physics selection to
apply. For an analysis's specific cuts, formulas, or category names, use that
analysis's own skills; use this one to check whether new or changed code follows
PocketCoffea's own idioms instead of working around them.

## Establish the current interface

PocketCoffea evolves; treat class/function names and signatures below as illustrative
and confirm against the checkout before proposing a change:

1. Find this analysis's `ref/PocketCoffea` clone (see that analysis's `CLAUDE.md`
   reference-clone table -- not every analysis in this workspace uses PocketCoffea).
2. Read `docs/concepts.md` for the processing model (skim -> calibrators -> object
   preselection -> event preselection -> categories -> weights -> histograms) if
   unfamiliar with it.
3. Read `docs/configuration.md` for the `Configurator` object's actual current fields
   before proposing a config change -- it is the single source of truth for what a
   `Configurator` accepts.
4. Search `pocket_coffea/lib/cut_functions.py` and `pocket_coffea/parameters/cuts.py`
   for existing factory cuts before writing a new one from scratch.
5. Search `pocket_coffea/parameters/histograms.py` for existing histogram factory
   functions before writing a new `HistConf` from scratch.

## Route by task

- Adding, modifying, or debugging a cut, skim, preselection, or category (including
  `StandardSelection` vs. `CartesianSelection`), read
  [references/cuts-and-categories.md](references/cuts-and-categories.md).
- Adding or modifying a histogram, read
  [references/histograms.md](references/histograms.md).
- Adding or modifying a scale factor/weight, or a systematic variation, read
  [references/weights-and-variations.md](references/weights-and-variations.md).
- Adding a `ColOut` (ntuple-style) output, or interpreting the standard `.coffea`
  output structure (`cutflow`, `sumw`, `variables`, `columns`,
  `datasets_metadata`), read
  [references/output-and-columns.md](references/output-and-columns.md).

## Framework invariants to preserve

- **The skim must be loose under every systematic variation applied later.** It runs
  on raw NanoAOD before any object calibration; a jet-count skim, for example, must
  not be so tight that a JES-up-shifted event that should pass the analysis gets
  dropped before JES is even applied. This is the single most common way custom
  processing code silently biases a result.
- **`PackedSelection` (the coffea structure behind `StandardSelection`) tops out at 64
  masks.** If the cartesian product of category axes plus cumulative stages could
  exceed that, use `CartesianSelection`/`MultiCut` instead of trying to cram
  everything into one `StandardSelection` -- don't work around the limit with a
  hand-rolled boolean-combination scheme.
- **A `Cut` is a name + params + function, reused via factory methods, not
  copy-pasted per call site.** If the same cut shape recurs with different
  parameters, write (or reuse) a factory function returning a `Cut`, following
  `pocket_coffea.lib.cut_functions`'s own pattern, rather than inlining a new `Cut(...)`
  at each call site.
- **User-defined modules (custom cuts, custom processor) must be registered with
  `cloudpickle.register_pickle_by_value(...)`** in the config file so Dask/Condor
  workers can unpickle them without needing the exact same import path. A worker-side
  `ImportError` for a local module is almost always a missing registration, not a
  real dependency problem.
- **Weight and histogram configuration lives in the config file, not hardcoded in the
  processor**, following the `common`/`bysample`/`bycategory` decision-tree structure.
  A new scale factor that's genuinely reusable across analyses should be a
  `WeightWrapper` (or the simpler `WeightLambda.wrap_func` for a one-off), not an
  ad hoc column computed by hand in `workflow.py` and never exposed to the weights
  config.
- **Prefer an existing factory (`cut_functions.py`, `parameters/histograms.py`,
  `WeightsManager`'s `common_weights`) over a new one-off implementation** when one
  already covers the need -- these carry conventions (naming, edge handling, variation
  wiring) that a fresh implementation tends to silently drop.

## Completion checks

- For a new or changed cut/category: state whether it changes the skim, the
  preselection, or a category, and confirm the skim-looseness invariant still holds if
  the skim was touched.
- For a new histogram: confirm it uses `HistConf`/`Axis` (or an existing factory
  function) rather than a hand-rolled `hist`/`boost_histogram` object outside the
  `HistManager`.
- For a new weight: state which of `common`/`bysample`/`bycategory` it's scoped to,
  and whether it needs a variation entry to actually produce up/down shapes.
- For a new custom module (cut function, processor, weight): confirm it's registered
  with `cloudpickle.register_pickle_by_value(...)` if it needs to run on Dask/Condor
  workers.
- State whether verification was read-only (checked against `docs/`/source) or
  included an actual local/smoke-test PocketCoffea run.
