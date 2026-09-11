# Signal acceptance workflow

## Running the PocketCoffea `signal_acceptance` mode

```bash
DISAPPTRKS_CATEGORY_MODE=signal_acceptance \
DISAPPTRKS_OUTPUT_VARIANT=chargino700_high_purity \
DISAPPTRKS_DATASET_JSON=datasets/local_chargino_700.json \
DISAPPTRKS_DATASET_SAMPLE=SIGNAL_Chargino \
DISAPPTRKS_DATASET_YEAR=2022_postEE \
DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1 \
python -m pocket_coffea.scripts.runner run \
  --cfg config.py \
  --outputdir analysis_output/2022EFG/signal_acceptance/chargino700_high_purity \
  --executor iterative
```

Fiducial maps resolve automatically from the group's shared EOS space
(`root://cmseos.fnal.gov//store/group/lpcdisapptrks/fiducialmaps`) based on
`DISAPPTRKS_DATASET_YEAR`/the dataset's `era` metadata -- `_fiducial_map_era` in
`pocket_coffea/workflow.py` maps `2022_postEE` to the `2022EFG` map used here. No
`DISAPPTRKS_ELECTRON_FIDUCIAL_MAP_JSON`/`_MUON_...` needed unless overriding with a
specific local file; `DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1` still matters so a
resolution failure (EOS unreachable, an era not in the mapping) fails loudly.

Add `DISAPPTRKS_ENABLE_SIGNAL_DEDX_HISTOGRAMS=1` (and optionally
`DISAPPTRKS_SIGNAL_DEDX_LAYERS`) only if the compact per-track dE/dx summaries are also
wanted from this same run -- see `disapptrks-track-diagnostics`'s "Signal" workflow for
that side; it is not part of the efficiency comparison below.

## Summarizing the efficiency comparison

```bash
disapptrks summarize-signal-high-purity \
  analysis_output/2022EFG/signal_acceptance/chargino700_high_purity/output_all.coffea \
  --sample SIGNAL_Chargino \
  --full-cutflow
```

Without `--full-cutflow`, this prints one row per layer bin (`combined`, `4 layers`,
`5 layers`, `>=6 layers`) with the yield without/with `highPurity`, the retained
fraction, and the fraction lost:

```text
category         without HP        with HP     retained         lost
combined         ...               ...          ...%             ...%
4 layers         ...               ...          ...%             ...%
5 layers         ...               ...          ...%             ...%
>=6 layers       ...               ...          ...%             ...%
```

`--layers` restricts which layer bins get the detailed `--full-cutflow` printout
(default: all four).

## The full cumulative cutflow (`--full-cutflow`)

Before the `track_highPurity` stage, the "without"/"with" columns are identical (the
split hasn't happened yet); from `track_highPurity` onward they diverge and stay
diverged for the rest of the sequence. Stages, in order:

| Stage | Meaning |
| --- | --- |
| `initial` | initial events |
| `skim` | MET-trigger skim |
| `presel` | event-quality preselections |
| `event_metNoMu120` | MET-no-muon >= 120 |
| `event_leadingJet110` | leading jet pT > 110 |
| `event_leadingJetEta2p4` | leading jet \|eta\| < 2.4 |
| `event_leadingJetTightLepVeto` | leading jet tight-lepton-veto ID |
| `event_dijetDphi2p5` | dijet max delta-phi < 2.5 |
| `event_jetMetDphi0p5` | leading jet/MET delta-phi >= 0.5 |
| `track_pt55` | track pT > 55 |
| `track_eta2p1` | track \|eta\| < 2.1 |
| `track_noECALCrack` | ECAL crack veto |
| `track_noDTWheelGap` | DT wheel-gap veto |
| `track_noCSCTransition` | CSC transition veto |
| `track_noTOBCrack` | TOB crack veto |
| `track_fiducialECAL` | ECAL/electron/muon fiducial vetoes (fiducial-hot-spot mask starts applying here) |
| `track_pixelHits4` | >= 4 valid pixel hits |
| `track_validHits4` | >= 4 valid hits |
| `track_noMissingInner` | no missing inner hits |
| `track_noMissingMiddle` | no missing middle hits |
| `track_chargedIso0p05` | charged isolation < 0.05 |
| `track_dxy0p02` | \|d0\| < 0.02 |
| `track_dz0p5` | \|dz\| < 0.5 |
| `track_dRJet0p5` | track/jet delta-R > 0.5 |
| `track_layers4plus` | layer-bin requirement |
| `track_highPurity` | **highPurity track ID -- the split point** |
| `track_calo10` | calorimeter energy < 10 |
| `track_missingOuter3` | >= 3 missing outer hits |
| `track_electronVeto` | electron veto |
| `track_muonVeto` | muon veto |
| `track_tauVeto` | tau veto |

`track_layers4plus` is handled specially (both columns still share one category there,
same as before the split) -- confirm against `_summarize_signal_high_purity_command` in
`src/disapptrks/cli.py` if the exact stage list or this special case has since changed.

## Why `CartesianSelection`, not `PackedSelection`

The comparison needs three independent axes -- `high_purity_variant`
(`signal_cutflow_without_high_purity`/`signal_cutflow_with_high_purity`), `layer_bin`
(`NLayers4`/`NLayers5`/`NLayers6plus`/`combinedBins`), and `cutflow_stage` (the ~28
stages above) -- combined with the mode's `StandardSelection` categories. That product
exceeds `PackedSelection`'s 64-mask limit, so `config.py` builds it with PocketCoffea's
`CartesianSelection`/`MultiCut` instead (the same pattern `high_purity_study` uses).
This keeps the standard `cutflow`/`sumw`/`sumw2` outputs, so `cutflow_count` and
`summarize-signal-high-purity` work the same way they would on a simpler category set.
