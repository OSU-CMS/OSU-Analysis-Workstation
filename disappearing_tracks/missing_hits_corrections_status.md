# Missing-hits (hit-drop) corrections — status, 2026-10-22

Tasks SIG-02/03/04 in `ref/DisappTrks_Nano/docs/an_task_inventory.md`. **First-pass fits
exist for all seven periods; nothing has been applied to signal MC yet.** Treat every
number below as preliminary (see [Caveats](#caveats--open-items)).

## What is being done

Run 3 port of the Run 2 / dissertation missing-hits correction: simulation underestimates
missing middle and outer hits on real tracks, so MC hits are randomly dropped with four
probabilities fitted to data in a muon control region:

- **P0** — extra missing middle hit, per strip layer (fit: missing-middle distribution, bins 0–5)
- **P_TOB** — all TOB hits dropped (fit with P_pre-TOB, missing-outer bins 1–6)
- **P_pre-TOB** — extra missing outer hits when TOB is not dropped (bins 1–6)
- **P_post-TOB** — extra missing outer hits when TOB is dropped (bins 6–9)

## Decisions (Matt, 2026-10-15 … 10-16)

- Follow the Run 2 method: random per-track hit drop, legacy fit objective/ranges.
- Use the general track only (no GSF tracks in Nano).
- Control region = legacy `MuonCtrlSelection` (candidate-track selection minus the muon veto,
  MET-triggered JetMET data) and `HitsSystematicsCtrlSelection` (same, no missing inner/middle
  cuts), **including the current highPurity and dE/dx requirements**.
- MC = the Run 2 background mix (W→ℓν, Z→ℓℓ, tt̄, single top, diboson, Z→νν, QCD), with
  pileup reweighting, legacy Run 3 cross sections.
- Data uses OSUv2 custom NanoAOD; all MC uses OSUv3 (by design).
- **2024/2025/2026**: no usable signal MC for those years, so 2023D (Summer23BPix) MC is fitted
  against each year's data and the result is meant to be applied to the 2023D signal used for
  the 2024–26 yields. The 2023D MC is reweighted to the **target year's** pileup profile.
- **2026 pileup**: no official profile exists yet (checked 2026-10-21); the 2025 profile is used
  as a labelled stand-in.

## Results — fitted probabilities (Table 7.34 style)

Statistical uncertainties from Δχ² = 1 (the legacy fit had none). † = 2023D MC reweighted to that
year's pileup; ‡ = 2025 pileup used as a stand-in.

| Probability | 2022 CD | 2022 EFG | 2023 C | 2023 D | 2024 † | 2025 † | 2026 †‡ |
|---|---|---|---|---|---|---|---|
| P0 (×10⁻³) | 3.58 ± 0.16 | 4.63 ± 0.10 | 5.32 ± 0.17 | 4.61 ± 0.34 | 7.13 ± 0.34 | 8.30 ± 0.37 | 8.51 ± 0.39 |
| P_TOB (×10⁻³) | 0.40 ± 0.10 | 0.55 ± 0.06 | 0.80 ± 0.08 | 1.05 ± 0.17 | 2.31 ± 0.10 | 2.76 ± 0.12 | 2.00 ± 0.19 |
| P_pre-TOB (×10⁻³) | 3.3 ± 0.8 | 3.6 ± 0.5 | 2.6 ± 1.1 | 3.4 ± 1.5 | 7.1 ± 2.1 | 10.1 ± 2.4 | 10.2 ± 2.4 |
| P_post-TOB | 0.41 ± 0.12 | 0.58 ± 0.09 | 0.52 ± 0.05 | 0.58 ± 0.13 | 0.54 ± 0.13 | 0.50 ± 0.11 | 0.69 ± 0.18 |

Legacy values for comparison — dissertation Table 7.34 / AN Table 36 (2022 CD, 2022 EFG, 2023 C,
2023 D; AN also has 2024):

| Probability | 2022 CD | 2022 EFG | 2023 C | 2023 D | 2024 (AN) |
|---|---|---|---|---|---|
| P0 (×10⁻³) | 3.39 / 3.20 | 5.34 / 5.06 | 5.10 / 5.10 | 4.83 / 5.65 | 7.62 |
| P_TOB (×10⁻³) | 0.53 / 0.42 | 0.66 / 0.67 | 0.89 / 0.93 | 0.89 / 0.78 | 1.11 |
| P_pre-TOB (×10⁻³) | 2.46 / ~0 | 3.99 / 3.37 | 3.09 / 2.64 | 4.27 / 4.30 | 5.39 |
| P_post-TOB | 0.580 / 0.786 | 0.602 / 0.779 | 0.591 / 0.593 | 0.637 / 0.706 | 0.674 |

Comparison in one line each:
- 2022–2023 agree with the dissertation mostly within ~1σ; exception: 2022 EFG P0 (4.63 vs 5.34,
  ~7σ), consistent with the highPurity selection (below). P_post-TOB comes out ~10–30 % lower.
- P0 and P_TOB rise steadily 2022 → 2025, tracking detector conditions; our 2024 P0 (7.13)
  agrees with the AN's 7.62, while P_TOB and P_pre-TOB come out ~2× the AN's 2024 values.
- The fits converge in every period, and a closure test (pseudo-data from MC with known
  probabilities) recovers the inputs exactly in every period.

## Findings

1. **Uncorrected MC underestimates missing hits in every period**, increasingly so after 2023:
   data/MC (unit-normalized) at 2 missing middle hits 2.4 (2022 CD) → 4.0 (2025); at 3–5 missing
   outer hits up to 10–20× in 2024–25.
2. **Data distributions match the dissertation's** (2022 EFG within a few % in bins 0–2, Fig. 7.22).
   Our 2022 CD yield is ~0.63× the dissertation's Fig. D.1, but ours scales correctly with
   luminosity against 2022 EFG while the dissertation's does not, so the difference appears to be
   on the dissertation side (shape only enters the fit).
3. **highPurity explains the "3 missing middle hits" difference.** With highPurity + dE/dx removed
   (2022 CD cross-check), data at 3 missing middle hits goes 0 → 14 tracks (dissertation ~17);
   bins 0–2 are unchanged in data and MC, so the selection acts equally on both.
4. **The 2023D MC tail is statistics-limited**: W→ℓν and DY have 0–2 effective MC events per bin
   beyond 2 missing outer hits. This limits P_post-TOB precision for 2023 D and 2024–26.
5. **Pileup**: 2024 and 2025 profiles are very similar (means 50.0 / 51.8, sharp peak ~54) and
   both differ from 2023 D (mean 44.8, broad); Summer23BPix MC has a long high-pileup tail
   (27 % above 60 vs 5–8 % in data).
6. **After correction** (Fig. 7.23-style plots): missing middle 0–1 and missing outer 0–1 agree
   within ~4 % / ~9 % in every period (these hold >99 % of tracks). Two residual misfits remain —
   see caveats 1 and 2.

## Cumulative fractions — what the selection actually uses (added 2026-10-22)

Data / MC ratio of the fraction of control-region tracks passing each requirement, before
(unc.) and after (cor.) the correction. Statistical uncertainties on the ratios are ~1–8 %
(see `cumulative_fractions_v1.json` for fractions with errors).

| Period | 0 missing middle unc. / cor. | ≥1 outer unc. / cor. | ≥2 outer unc. / cor. | ≥3 outer unc. / cor. |
|---|---|---|---|---|
| 2022 CD | 0.972 / 1.001 | 1.14 / 1.00 | 1.16 / 1.01 | 1.65 / 1.19 |
| 2022 EFG | 0.966 / 1.003 | 1.16 / 1.02 | 1.48 / 1.22 | 2.43 / 1.50 |
| 2023 C | 0.957 / 0.999 | 1.12 / 1.01 | 2.48 / 1.63 | 3.83 / 1.54 |
| 2023 D | 0.959 / 0.996 | 1.16 / 1.01 | 1.84 / 1.18 | 3.53 / 1.14 |
| 2024 | 0.942 / 0.998 | 1.27 / 0.96 | 2.24 / 1.00 | 4.83 / 0.85 |
| 2025 | 0.931 / 0.996 | 1.32 / 0.92 | 2.47 / 0.99 | 5.47 / 0.84 |
| 2026 | 0.927 / 0.994 | 1.36 / 0.96 | 2.58 / 1.18 | 5.68 / 1.05 |

- **0 missing middle hits** (the search requirement): corrected MC matches data within 0.6 % in
  every period (uncorrected was 3–7 % off) — caveat 1 below does not affect this requirement.
- **≥1 missing outer**: within 1–8 % after correction.
- **≥3 missing outer** (the search requirement): a 1.6–5.7× data excess before correction becomes
  0.84–1.54 after. The residual is significant: under-corrected by ~50 % in 2022 EFG and
  2023 C, over-corrected by ~15 % in 2024–25; closest in 2023 D (1.14) and 2026 (1.05). This
  residual is what the Run 2-style missing-outer-hits systematic (SYST-08) would be built
  from, weighted by each signal point's true missing-outer distribution; it matters only for
  signal tracks with fewer than 3 true missing outer hits (long lifetimes).

**Decision (Matt, 2026-10-22):** keep the four-parameter model and these v1 fits as the
correction; cover the residual with the Run 2 missing-outer-hits systematic (SYST-08) instead
of extending the model.

## Hit systematics (SYST-06/07), published Run 2 method (2026-10-22)

Matt chose the published Run 2 paper's method over the dissertation's: muon control region only
(no Z→ee/ττ `HITS_V2`). Systematic = |eff_data − eff_MC| / eff_data of the fraction with 0 missing
middle (vs hit-drop-corrected MC) or 0 missing inner hits (vs MC; not corrected), one value per
period for all layer bins. Values (±stat), replacing the dissertation's 2.8–5.9 % (middle) and
0–4.2 % (inner) placeholders:

| Period | missing middle | missing inner |
|---|---|---|
| 2022 CD | 0.11 ± 0.14 % | 0.20 ± 0.05 % |
| 2022 EFG | 0.28 ± 0.09 % | 0.18 ± 0.11 % |
| 2023 C | 0.08 ± 0.15 % | 0.25 ± 0.03 % |
| 2023 D | 0.43 ± 0.48 % | 0.02 ± 0.11 % |
| 2024 | 0.17 ± 0.42 % | 0.16 ± 0.10 % |
| 2025 | 0.39 ± 0.44 % | 0.16 ± 0.09 % |
| 2026 | 0.65 ± 0.45 % | 1.20 ± 0.10 % |

Middle is small because P0 is fitted to this very distribution; 2023 D–2026 are MC-statistics
limited (error ≳ value). 2026 inner (1.2 %) reflects the 2026 data's ~2.5× higher missing-inner-hit
rate. LPC: `analysis_output/missing_hits_corrections/hits_systematics_v1.json`
(`scripts/compute_hits_systematics.py`); cards: `limits/lifetime_reweighted_run3/systematics_by_era_hits_20261022.json`
+ `extra_eras_pileup_target_hitdrop.json` (2024–26 get their own values). Missing outer (SYST-08):
see caveat 6 (computed 2026-10-23, Run 2 per-point method).

## Caveats / open items

1. **Model makes 3+ missing-middle-hit tracks that data does not have.** The random drop is
   applied after highPurity, so corrected MC predicts hundreds of tracks at 3 missing middle hits
   where data has 0–14 (data/MC ≤ 0.16); the fit compensates by lowering P0, leaving bin 2 ~25–35 %
   under-predicted. Main source of poor middle-hit χ² (post-correction χ²/bin 37–50 in 2022 EFG and
   2024–26; 5–16 elsewhere). Likely small impact on signal (search requires 0 missing middle hits).
2. **One P_TOB cannot describe both ends of the outer tail.** After correction data is still
   1.5–3× above MC at 3–5 missing outer hits, while MC overshoots 6–9 in 2024–26 (data/MC ≈ 0.4–0.5).
   This is the legacy two-step fit's P_TOB tension (pre-TOB vs post-TOB fit disagree by 2–3× in
   2024–26; legacy uses the pre-TOB value, as we do). Suggests a partial-TOB-loss population the
   four-parameter model cannot represent. In the cumulative fractions (section above) the
   two partly cancel, leaving a ≥3-missing-outer residual of −16 % to +54 % depending on period.
3. **The port is not yet validated against the legacy histograms** (Matt to locate them on the OSU
   T3); validated so far only by closure tests.
4. **MC completeness**: ~0.7 % of chunks were dropped by `skip-bad-files` in the 2023C, 2023D,
   2023D→2024 and 2023D→2025 MC runs (random, does not bias shapes); all other runs 100 %.
5. **2026 pileup is a stand-in** (2025 profile); 2026 data is ~⅓ of 2025 and still growing.
6. **Correction implemented, not yet used for signal yields** (2026-10-22): opt-in
   `DISAPPTRKS_MISSING_HITS_CORRECTION=1` applies the random hit drop to MC tracks (legacy
   algorithm, reproducible seeding, period from the MC year or the pileup target for
   2023D→2024-26), values in `pocket_coffea/data/missing_hits_corrections/hit_drop_probabilities_v1.json`.
   Validated: a full 2023D background-MC run with it on reproduces the fit's analytic corrected
   distributions (cumulative ≥1/≥2/≥3 missing-outer fractions within 0.2–0.9 %). Signal smoke
   test (2023D, cτ = 100 cm): final selection −1.3 % in NLayers6plus, unchanged in NLayers4/5
   (extra missing middle hits; no ≥3-outer gain expected at this lifetime). **Applied to the signal yields and limits
   2026-10-22/23** (hitdrop_v1, `limits/lifetime_reweighted_run3/README.md`): median expected mass limit
   moves −11..+1 GeV vs pileup_v2 (mean −2.7), the new inner/middle systematics by 0..+1 GeV. SYST-08
   (missing outer hits) is now computed too (2026-10-23, Run 2 per-point method: NLayers4/5 ~0,
   NLayers6plus 0–0.38 %, growing with lifetime; 0 GeV effect on the limits). Current best result set:
   `limits/lifetime_reweighted_run3/results/hitdrop_allhits_v1/`.

## Where everything is

LPC checkout (reach it with `ssh mjoyce@cmslpc330.fnal.gov`; the `cmslpc-claude` alias is blocked
by a stale host key): `/uscms_data/d3/mjoyce/DisTrks/CMSSW_15_0_10/src/DisappTrks_Nano/pocket_coffea/`

| What | Path (relative to `pocket_coffea/`) |
|---|---|
| Fit results (values, errors, χ² before/after, closure) | `analysis_output/missing_hits_corrections/fit_results_v1.json` |
| Uncorrected data/MC plots, 7 periods | `plots/missing_hits/uncorrected/missing_hits_uncorrected_<period>.{pdf,png}` |
| highPurity/dE/dx cross-check (2022 CD) | `plots/missing_hits/uncorrected/missing_hits_uncorrected_2022CD_noHPdEdx.{pdf,png}` |
| Post-correction plots, 7 periods | `plots/missing_hits/corrected/missing_hits_corrected_<period>.{pdf,png}` |
| Pileup profiles 2023D/2024/2025 vs MC | `plots/missing_hits/pileup_profiles_2023D_2024_2025.{pdf,png}` |
| Run outputs | `analysis_output/<period>/missing_hits_control/{data_v1,bkgmc_v1,bkgmc_v1_pu2024,bkgmc_v1_pu2025,bkgmc_v1_pu2026,*_noHPdEdx}/` |
| Cumulative fractions (data, uncorrected, corrected MC) | `analysis_output/missing_hits_corrections/cumulative_fractions_v1.json` |
| Fit / plotting / cumulative code | `scripts/fit_missing_hits_corrections.py`, `scripts/plot_missing_hits_data_mc.py`, `scripts/plot_missing_hits_corrected.py`, `scripts/missing_hits_cumulative.py` |
| Pileup reweighting to a target year | `pileup_weights.py`, `scripts/make_target_pileup_weights.py`, `data/pileup/` |
| Background-MC dataset JSONs + builder | `datasets/eos_<period>_BkgMC_OSUv3.json`, `scripts/make_bkg_mc_dataset_jsons.py` |
| Job scripts and logs | `claude_missing_hits/` |

Period labels in file names: `2022CD 2022EFG 2023C 2023D 2024 2025 2026`. All code changes are
uncommitted on `MattDev` in that checkout. Exact job commands: `disapptrks-job-submission`
skill, `references/commands.md` (section `missing_hits_control`).

Legacy references (local): dissertation `ref/DisappTrks_Nano/docs/DissertationFinal.pdf`
(Sec. 7.5.2, Fig. 7.22 p. 212 of the PDF, Table 7.34 p. 213, Fig. D.1 p. 277); AN Table 36 in
`ref/DisappTrks_Nano/docs/Disappearing_Tracks_Run_3_Analysis (4).pdf`; legacy values in
`ref/DisappTrks/StandardAnalysis/python/MissingHitsCorrections_cff.py`; legacy fit scripts in
`ref/DisappTrks/StandardAnalysis/scripts/findMissing{Middle,Outer}HitsCorrection.py`.
