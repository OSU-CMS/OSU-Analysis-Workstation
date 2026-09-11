# Fake-track background workflow

## Directory convention

`make-standard-fake-track-estimate` expects PocketCoffea outputs arranged as:

```text
analysis_output/<run_period>/fake_tracks/basic/output_*.coffea   # DATA_JetMET or DATA_MET
analysis_output/<run_period>/fake_tracks/zmumu/output_*.coffea   # DATA_Muon
analysis_output/<run_period>/fake_tracks/zee/output_*.coffea     # DATA_EGamma
```

(Override any of these with `--basic-files`/`--zmumu-files`/`--zee-files`, and the base
with `--input-base` if not `analysis_output`.)

## Running the PocketCoffea `fake_tracks` mode

One run per control region, same category mode, different `DISAPPTRKS_FAKE_TRACK_CONTROL`
and dataset:

```bash
# basic / JetMET control
DISAPPTRKS_CATEGORY_MODE=fake_tracks \
DISAPPTRKS_FAKE_TRACK_CONTROL=basic \
DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1 \
DISAPPTRKS_ENABLE_FAKE_SIDEBAND_HISTOGRAMS=0 \
DISAPPTRKS_DATASET_JSON=datasets/eos_<period>_JetMET.json \
DISAPPTRKS_DATASET_SAMPLE=DATA_JetMET \
DISAPPTRKS_DATASET_YEAR=<period> \
python -m pocket_coffea.scripts.runner run \
  --cfg config.py \
  --outputdir analysis_output/<period>/fake_tracks/basic \
  --executor dask@lpc \
  --executor-custom-setup executors_lpc.py \
  --custom-run-options run_options_lpc_dask.yaml \
  --scaleout 60 --queue workday
```

Repeat with `DISAPPTRKS_FAKE_TRACK_CONTROL=zmumu`, `DISAPPTRKS_DATASET_SAMPLE=DATA_Muon`,
and `--outputdir analysis_output/<period>/fake_tracks/zmumu` for the Z->mu mu control;
and `DISAPPTRKS_FAKE_TRACK_CONTROL=zee`, `DISAPPTRKS_DATASET_SAMPLE=DATA_EGamma`,
`--outputdir analysis_output/<period>/fake_tracks/zee` for Z->ee.

Both electron and muon fiducial maps are required for every control region, including
`basic` -- unlike the leg-specific Pveto/tau modes. Both resolve automatically from the
group's shared EOS space by era; set `DISAPPTRKS_FIDUCIAL_MAP_DIR` or the explicit
`DISAPPTRKS_ELECTRON_FIDUCIAL_MAP_JSON`/`DISAPPTRKS_MUON_FIDUCIAL_MAP_JSON` only to
override with a specific local file. Leave `DISAPPTRKS_ENABLE_FAKE_SIDEBAND_HISTOGRAMS`
at its default (`1`, i.e. omit the variable) only if the sideband diagnostic
plots/manifest from this run are wanted; otherwise set it to `0` for production to save
space and time.

## Postprocessing: the standardized estimate

```bash
cd DisappTrks_Nano
disapptrks make-standard-fake-track-estimate \
  --run-period 2022CD \
  --input-base pocket_coffea/analysis_output \
  --output-dir tables/fake_tracks/2022CD \
  --transfer-factor-source fit \
  --fit-plots \
  --sideband-plots
```

This runs `estimate-fake-tracks --an-control zmumu` and `--an-control zee` internally
(fixed category names `fake_basic3hits_d0_signal`, `fake_basic3hits_d0_sideband`,
`fake_control_{layer}`; basic-yield category `basic_selection` from the `basic`
control's `DATA_JetMET` output by default), combines them into a Table-34-style LaTeX
table, and (with `--fit-plots`/`--sideband-plots`) writes the transfer-factor fit PDF
and the sideband hit-pattern/dE/dx diagnostic PDFs. For several periods at once, pass
multiple `--run-period` values (only when *not* also passing explicit
`--basic-files`/`--zmumu-files`/`--zee-files`) -- this additionally writes a combined
`table34_combined.tex`.

## Postprocessing: one control region by hand (`estimate-fake-tracks`)

Useful when the standardized layout doesn't apply, or to compare fixed vs. fit
transfer factors directly:

```bash
disapptrks estimate-fake-tracks \
  pocket_coffea/analysis_output/2022CD/fake_tracks/zmumu/output_*.coffea \
  --an-control zmumu \
  --transfer-factor-source fit \
  --run-period 2022CD \
  --sample DATA_Muon \
  --basic-files pocket_coffea/analysis_output/2022CD/fake_tracks/basic/output_*.coffea \
  --basic-sample DATA_JetMET \
  --basic-yield-category basic_selection \
  --output-json tables/fake_tracks/2022CD/zmumu.json \
  --output-tex tables/fake_tracks/2022CD/zmumu.tex \
  --z-control-tex tables/fake_tracks/2022CD/zmumu_control.tex \
  --fit-plot tables/fake_tracks/2022CD/zmumu_fit.pdf
```

Swap `--an-control zee`, `--sample DATA_EGamma`, and the `zee` paths for the electron
control. Drop `--an-control` (and pass `--transfer-signal-category`/
`--transfer-sideband-category`/`--control-category` explicitly if they differ from the
defaults) to use the general `xi = N_signal/N_sideband` method instead.

Combine two per-control JSON outputs into an AN Table-34-style table directly:

```bash
disapptrks make-fake-track-table34 \
  tables/fake_tracks/2022CD/zmumu.json tables/fake_tracks/2022CD/zee.json \
  --run-period 2022CD \
  -o tables/fake_tracks/2022CD/table34.tex
```

## Investigating the sideband: plots and event manifest

With `DISAPPTRKS_ENABLE_FAKE_SIDEBAND_HISTOGRAMS=1` in the PocketCoffea run (the
default), `--sideband-plots`/`--fit-plot` (or calling
`plot_fake_sideband_track_diagnostics`/`plot_dxy_transfer_factor` directly) produce:

- A signed-|d0| transfer-factor fit plot (dissertation Figure-7.15/26-style): the
  Gaussian+constant fit overlaid on the signed and folded d0 distributions.
- Hit-pattern diagnostic PDFs: pixel-barrel/endcap and strip TIB/TID/TOB/TEC layer
  occupancy for `N_sideband` candidates, split by layer bin (4/5/6+).

`write_fake_sideband_event_manifest` (wired into `--sideband-plots`) also writes a CSV
of run/lumi/event and per-candidate track fields
(`src/disapptrks/fake_tracks.py::SIDEBAND_MANIFEST_TRACK_FIELDS` -- kinematics, hit
counts, isolation, calo energy, dE/dx) for every sideband candidate, useful for looking
at individual events by hand rather than only aggregate histograms.

## Common mistakes

- Running `zmumu`/`zee` PocketCoffea jobs without both fiducial maps -- this mode is
  not leg-specific like Pveto/tau modes are.
- Passing `--basic-files` without `--basic-yield-category` (or the reverse) -- the CLI
  raises `SystemExit`.
- Passing `--counts-json` together with `--an-control` -- not supported; `--an-control`
  needs coffea files so it can read the d0 histograms for the fit (or at least the
  cutflow, for `fixed`).
- Requesting `--transfer-factor-source fit` for a period/control with too few sideband
  entries in the `0.10 <= |d0| < 0.50 cm` fit window -- this raises `ValueError`; use
  `fixed` (if the period is in `AN_FIXED_TRANSFER_FACTORS`) instead, or report that the
  fit is not viable rather than forcing it.
- Mixing up `fake_control_{layer}` (target-region control yield, used by the general
  method) with `fake_zmumu_control`/`fake_zee_control` (the Z-control-region yield used
  as the denominator of `P_fake_raw` in the AN method) -- they are different categories
  with similar names; check [references/formulas.md](formulas.md) before assuming which
  one a command needs.
