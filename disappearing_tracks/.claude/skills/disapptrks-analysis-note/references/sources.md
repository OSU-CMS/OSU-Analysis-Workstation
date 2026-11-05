# AN-24-155: where each section's content comes from

Snapshot as of 2026-11-03 (v5 changelog, Overleaf `47aefba`). This **goes stale**: before
reusing a source, check that a newer output tag doesn't supersede it (memory records
reruns, e.g. `_dedx_puppi_jetid_v1` after the jet ID fix). For anything not listed,
`git -C disappearing_tracks/analysis_note log -- <file>` names the commit that added it,
and the commit message usually says where it came from.

Paths: "LPC checkout" = `/uscms_data/d3/mjoyce/DisTrks/CMSSW_15_0_10/src/DisappTrks_Nano/pocket_coffea/`;
"limits dir" = `disappearing_tracks/limits/lifetime_reweighted_run3/` (local workspace repo).

| AN content | Source | Status / caveat |
| --- | --- | --- |
| Integrated luminosities (2022 CD 7.98, 2022 EFG 26.67, 2023 C 17.96, 2023 D 9.68, 2024 109.95, 2025 110.84, 2026 25.31 fb⁻¹; total 308.39) | Limit inputs (limits dir card builder) | User chose these over other values; plot labels sometimes differ (e.g. 18.08 for 2023 C), so flag any mismatch |
| Background tables (electron, muon, tau, fake, summary) | EOS `/store/group/lpcdisapptrks/disapptrks_output/{<era>,combined}/tables_dedx_puppi_v1/` | Statistical only, **predate the jet ID fix**. Replace with the `_dedx_puppi_jetid_v1` outputs once they're finished |
| Fake-track transfer-factor fits (Figs. + `tables/fakeTrackTransferFactorsRun3.tex`) | Same `dedx_puppi_v1` fake-track outputs | 2024–25 \|d0\| not Gaussian+constant; ζ method under study |
| MET trigger efficiency figures (`Run3_triggers/metTriggerEfficiency_<era>.pdf`) | limits dir `results/met_trigger_scale_factors_v1/met_trigger_v1_<era>.pdf` (`scripts/make_met_trigger_scale_factors.py`) | Pre-jet-ID-fix; plot lumi labels need fixing in the script |
| Lepton P_trigger | limits dir `results/lepton_ptrigger_puppi_v1/` | Tau uses a fixed 0.90 ± 0.006 (user's choice) |
| highPurity / dE/dx justification (Sec. 4.3.4.1: Tables 24–25, Fig. 14) | N_fake and plots from `slides/status_update/talk.tex` and `slides/figures/dedx_*_workingpoint.png` (2025 Z→μμ, September study); signal retention from LPC checkout `analysis_output/2022EFG/signal_acceptance/wino_grid_hp_{only,dedx}/` via `disapptrks summarize-signal-high-purity` | Earlier framework (pre PF-muon MetNoMu, PUPPI, jet ID), labeled as such. Plots are slide-style PNGs with no CMS label; remake both when the study is repeated |
| Missing-hits correction (Table 40 probabilities, Table 41 data/MC ratios, Figs. 31–37) | LPC checkout `analysis_output/missing_hits_corrections/{fit_results_v1,cumulative_fractions_v1}.json`, plots `plots/missing_hits/{uncorrected,corrected}/missing_hits_*_<period>.pdf`; status doc `disappearing_tracks/missing_hits_corrections_status.md` | Pre-jet-ID-fix; 2024–26 plots have no lumi label, and the 2025 uncorrected plot has a label overlapping the legend |
| Missing inner/middle hit systematics (Table 47) | LPC checkout `analysis_output/missing_hits_corrections/hits_systematics_v1.json` | Published Run 2 method (muon CR only) |
| Missing outer hit systematic (text values) | limits dir `missing_outer_systematic_v1.json` (`scripts/compute_missing_outer_systematic.py`) | NLayers6plus ≤ 0.4% (max at 100 GeV, low-statistics points) |
| Signal systematics summary tables (`tables/signalSystematics*.tex`) | Old 2022/2023 values | **Not yet updated.** Redo all rows together when the systematics are finished |
| Expected limits / results section | limits dir `results/hitdrop_allhits_v1/` is the current best set | Not yet put in the AN; must be rerun after the jet ID fix |

Open AN items the user knows about (don't fix unasked):
- the paragraphs in `backgroundEstimation.tex` (~lines 680/686/731) that call the old fake fits "good";
- the electron P_veto "loose ID" wording at `eventSelection.tex` ~line 210, which hasn't been checked against the code;
- six unreferenced Z+τ hit-systematic figures, `Run3_figures/Run3_systematicUncertainties/tauHitsSyst_*_2022`.
