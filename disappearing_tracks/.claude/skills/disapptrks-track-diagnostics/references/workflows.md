# Histogram workflows

Replace paths, periods, samples, and scaleout values with the user's current
production values. Confirm all options against the current checkout.

## Z sideband

Use `high_purity_study` to compare candidate-track inputs before and after
`highPurity` and optionally make candidate-linked dE/dx diagnostics.

```bash
DISAPPTRKS_CATEGORY_MODE=high_purity_study \
DISAPPTRKS_ENABLE_HIGH_PURITY_DEDX_HISTOGRAMS=1 \
DISAPPTRKS_HIGH_PURITY_STUDY_LAYERS=NLayers4,NLayers5,NLayers6plus \
DISAPPTRKS_FAKE_TRACK_CONTROL=zmumu \
DISAPPTRKS_OUTPUT_VARIANT=zmumu_high_purity_dedx \
DISAPPTRKS_DATASET_JSON=datasets/INPUT.json \
DISAPPTRKS_DATASET_SAMPLE=DATA_Muon \
DISAPPTRKS_DATASET_YEAR=YEAR \
DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1 \
scripts/run_lpc_dask.sh --scaleout 100 --skip-bad-files
```

Fiducial maps resolve automatically from the group's shared EOS space based on
`DISAPPTRKS_DATASET_YEAR` -- no `DISAPPTRKS_ELECTRON_FIDUCIAL_MAP_JSON`/`_MUON_...`
needed for the common case. Keep `DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1` so a resolution
failure fails loudly rather than silently running with zero hot spots. Set those
env vars explicitly only to override with a specific local file (e.g. testing an
unreleased map).

For the electron channel, use `DISAPPTRKS_FAKE_TRACK_CONTROL=zee`, the EGamma
dataset/sample, and a distinct output variant.

Plot an output with:

```bash
disapptrks plot-high-purity-study PATH/output_all.coffea \
  --control zmumu \
  --sample DATA_Muon \
  --layers NLayers4 NLayers5 NLayers6plus \
  --title-prefix PERIOD \
  --output-dir plots/zmumu_high_purity
```

This produces an input-variable PDF and, when enabled, a dE/dx hit/track PDF
for each requested layer bin.

## Signal

Use `signal_acceptance` with the optional compact signal dE/dx histograms. The
source NanoAOD must contain `IsoTrackDeDxHit`. This is a side product of the
`signal_acceptance` mode -- for that mode's primary purpose (comparing signal
efficiency before/after the `highPurity` requirement via
`summarize-signal-high-purity`), use the `disapptrks-signal-acceptance` skill
instead.

```bash
DISAPPTRKS_CATEGORY_MODE=signal_acceptance \
DISAPPTRKS_ENABLE_SIGNAL_DEDX_HISTOGRAMS=1 \
DISAPPTRKS_OUTPUT_PERIOD=PERIOD \
DISAPPTRKS_OUTPUT_VARIANT=all_signal_dedx \
DISAPPTRKS_DATASET_JSON=datasets/SIGNAL.json \
DISAPPTRKS_DATASET_SAMPLE=SIGNAL_Chargino \
DISAPPTRKS_DATASET_YEAR=YEAR \
DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1 \
scripts/run_lpc_dask.sh --scaleout 100 --skip-bad-files
```

Fiducial maps resolve automatically by era, same as the Z-sideband command above --
no explicit map paths needed unless overriding for a specific local file.

The default signal dE/dx bins are `NLayers4,NLayers5,NLayers6plus`. Override
with `DISAPPTRKS_SIGNAL_DEDX_LAYERS` only when needed.

Make the signal PDFs with:

```bash
disapptrks plot-signal-dedx-study PATH/output_all.coffea \
  --sample SIGNAL_Chargino \
  --layers NLayers4 NLayers5 NLayers6plus \
  --title-prefix "SIGNAL LABEL" \
  --output-dir plots/signal_dedx_study
```

The signal PDFs contain the compact candidate-level summaries, not the full
per-hit diagnostic suite.

## Dataset JSON for grouped signal points

When signal-point directories are immediately below an EOS parent, use the
parent directory name as the marker:

```bash
disapptrks make-dataset-json /store/group/PARENT/dev_v2 \
  --recursive \
  --group-signal-points \
  --signal-marker dev_v2 \
  --sample SIGNAL_Chargino \
  --year 2022_postEE \
  --era EFG \
  --primary-dataset Signal \
  --is-mc \
  --xsec 1.0 \
  --count-events \
  --event-count-workers 12 \
  --nano-version 12 \
  --xrootd root://cmseosmgm01.fnal.gov:1094 \
  -o datasets/eos_signal_OSUv2.json
```

Use `xsec=1.0` for acceptance ratios. Use physical cross sections only when
normalized yields are required. Confirm that the chosen parent contains only
the intended signal-point children before grouping it.
