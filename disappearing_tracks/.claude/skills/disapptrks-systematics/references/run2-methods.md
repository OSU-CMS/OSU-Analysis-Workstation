# Run 2 / early-Run-3 methods, one entry per systematic

Source code: `ref/DisappTrks/SignalSystematics/python/signalSystematics.py` (calculator classes)
and the per-era drivers `ref/DisappTrks/SignalSystematics/test/signalSystematics_<era>.py`
(e.g. `signalSystematics_2022EFG.py`, run as `python signalSystematics_2022EFG.py <SYSTEMATIC> <layer>`
with `SYSTEMATIC` one of `PILEUP MET JEC JER ISR TRIGGER ECALO HITS HITS_V2 MISSING_OUTER_HITS
MUON_VETO_SCALE_FACTOR ELECTRON_VETO_SCALE_FACTOR ...`). Background systematics:
`ref/DisappTrks/BackgroundSystematics/` and the per-era, per-layer
`ref/DisappTrks/LimitSetting/python/bkgdConfig_<era>_<layer>.py`. Physics write-up: dissertation
Ch. 7 (`ref/DisappTrks_Nano/docs/DissertationFinal.pdf`; corrections Sec. 7.5.1-7.5.2, background
systematics Sec. 7.5.3, signal systematics Sec. 7.5.4, tables 7.34-7.47). Published Run 2 (2017-2018)
method: CMS EXO-19-010, arXiv:2004.05153 (`ref/Search for disappearing tracks in proton-proton
collisions at sqrt(s) = 13 TeV.pdf`; corrections Sec. 3, systematics Sec. 6, Tables 2-3) -- compared
with the dissertation and the Run 3 plan in [the last section](#published-run-2-paper-vs-dissertation-vs-run-3-plan).

**Legacy per-point values** are stored in
`ref/DisappTrks/SignalSystematics/data/systematic_values__<systematic>_<era>_<layer>.txt` (one line
per signal point, `down up` kappas). For the dissertation-era Run 3 eras they were computed at the
generated lifetimes and copied down to every lifetime in the decade, and some flip sign between
decades (MC-statistics dominated) -- likely why the dissertation quotes averages. Use them as a
cross-check of any new per-point value.

The Run 2 grid evaluated signal systematics on every mass and on the generated lifetimes
(`lifetimes = ['10','100','1000','10000']`) or on all reweighted lifetimes (`allLifetimes`, 0.2-10000
cm) depending on the systematic -- the tree-based calculators (`...FromTrees`) take `allLifetimes`
because they apply the lifetime weight per event.

Contents: [Weight variations](#a-event-weight-variations-signal-mc) ·
[Object calibrations](#b-object-calibration-variations-signal-mc) ·
[Control regions](#c-datamc-efficiency-in-a-control-region) ·
[External inputs](#d-external-inputs) · [Statistical/method](#e-statistical-and-method) ·
[Background](#background-systematics) ·
[Run 2 paper vs dissertation vs Run 3](#published-run-2-paper-vs-dissertation-vs-run-3-plan)

---

## A. Event-weight variations (signal MC)

Calculator: `WeightSystematicFromTrees`. The nominal yield multiplies, per selected event in the
signal-region `TreeMaker` tree, `lifetimeWeight x isrWeight x grandOrWeight x puScalingFactor`
(x `L1ECALPrefiringWeight` in 2017). `defineWeightToFluctuate('eventvariable_X')` swaps `X` for
`XUp` / `XDown`; `defineFluctuationUp/Down` swaps it for an arbitrary branch. Output per
(mass, lifetime): `relDiffDown = (down - central)/central`, `relDiffUp = (up - central)/central`,
written as the asymmetric `lnN` `1+relDiffDown / 1+relDiffUp`.

| Systematic | Driver | Weight varied | Notes |
|---|---|---|---|
| **Pileup** | `PILEUP` | `eventvariable_puScalingFactor` -> `...Up/Down` | PU profile up/down from the min-bias cross-section variation. An older histogram-based `PileupSystematic` class also exists (`PileupCentral/Up/Down` channels, ratio of `metNoMu` integrals to total). |
| **ISR** | `ISR` | `eventvariable_isrWeight` -> `isrWeightUp/Down` | `isrWeight` is a data/MC reweighting of the recoil pT measured in Z->mumu (`makeZToMuMuISRPlot.py`, `ISRWeightProducer`); Up/Down from its uncertainty. Not the parton-shower PSWeight. |
| **Trigger (efficiency)** | `TRIGGER` | `eventvariable_grandOrWeight` -> `grandOrWeight{Data,MC}{Up,Down}` | loop `for flux in ['Data','MC']`: separate up/down for the data-efficiency and MC-efficiency uncertainties of the MET + track trigger grand-OR. |
| **Trigger turn-on** | separate block, `TriggerTurnOnSystematic` | grand-OR numerator/denominator efficiencies (`GrandOrNumeratorTrk4*`, `GrandOrDenominatorTrk*` channels) | turn-on curve uncertainty propagated to `metNoMu`. |

## B. Object-calibration variations (signal MC)

Separate channels rerun with shifted objects; systematic = relative yield change.

| Systematic | Driver | Channels |
|---|---|---|
| **JES** | `JEC` | central `disTrkSelectionSmearedJets<layer>`; `...JECUp` / `...JECDown` |
| **JER** | `JER` | `disTrkSelectionSmearedJetsUp/Down<layer>` (jet smearing) |
| **MET (unclustered etc.)** | `MET` | `MetSystematic`: `DisTrkNoMetSmearedJets<layer>` with `metNoMu` shifted by each type in `metVaryTypes`, applying the MET cut to `<hist>_<type>Up/Down` |

## C. Data/MC efficiency in a control region

One number per era and layer bin (missing outer hits: per signal point). Efficiencies come from
`getEfficiency(passes, total)` with asymmetric errors.

**E_calo** -- `ECaloSystematic`, driver `ECALO`.
- Control region `ZtoMuMuDisTrkNLayers4NoECaloCut`
  (`BackgroundEstimation/python/ZtoMuMuSelections.py`): Z->mumu events plus an *additional* track
  passing the full disappearing-track selection (`disTrkCuts`, including the lepton vetoes) with the
  E_calo cut removed and at most 4 layers. **The probes are fake (spurious) tracks, not the muons.**
  Data: Muon PD; MC: DY.
- Histogram: Run 2 used the AOD rho-corrected rechit sum within deltaR < 0.5
  (`trackCaloTot_RhoCorr`), i.e. the variable it cut on. The **legacy Run 3** (MiniAOD) measurement
  integrated `trackCaloJetEnergy` -- the raw calo-jet energy with no pileup subtraction -- while the
  Run 3 cut itself is on the pileup-subtracted `caloNewFromCaloJetNoPUDRp4CentralCalo`. So the
  Run 3 placeholder measured a different variable from the one cut on.
- eff = fraction with E_calo < 10 GeV. **Systematic = |eff_data - eff_MC| / eff_data**, one value per
  era, measured on <= 4-layer tracks but applied to all layer bins.
- Dissertation Table 7.41 values: data efficiency flat at ~86-90% in every Run 3 era; DY MC
  ~88-90% in 2022 but ~68-70% in 2023C and 2023D, hence 2023D = (86.1 - 68.3)/86.1 = 20.7%. The
  2023C drop rules out the BPix failure as the cause; the raw-variable choice (pileup mismodeling in
  Summer23 MC) and a single combined 2023 pileup profile are the leading untested hypotheses. Run 2
  values were 0.4-1.0%. The legacy `winoElectroweakLimits.py` used 3.455% for 2022CD where the
  dissertation table has 2.3%.

**Missing inner + middle hits** -- `HitsSystematic`, drivers `HITS` and `HITS_V2` (the dissertation
used the larger; **Run 3 uses `HITS` only, as the published paper did** -- Matt, 2026-10-22).
- `HITS`: control selection `HitsSystematicsCtrlSelection` (well-measured tracks in MET data vs
  the missing-hits MC). 2D histogram `trackNHitsMissingMiddleVsInner`; eff_X = fraction with
  0 missing middle hits, eff_Y = fraction with 0 missing inner hits (and XY = both).
  **Systematic = |eff_data - eff_MC| / eff_data**, separately for middle (X) and inner (Y).
  Evaluated before and after the missing-middle-hit correction
  (`trackNHitsMissingMiddleCorrectedVsInner`); the corrected one is used.
- `HITS_V2`: same quantity on Z->ee/tautau probe tracks
  (`ZtoEETauHitsSystematicSelection<layer>`, EGamma data vs DY MC).

**Missing outer hits** -- `MissingOuterHitsSystematic`, driver `MISSING_OUTER_HITS`. Per signal point.
- Inputs: muon control region (`MuonCtrlSelection`, data and MC) for the probability that a
  real track has accidental missing outer hits; and the signal's distribution of *true* missing
  outer hits before the cut (`DisTrkNoNMissOut<layer>`, histogram
  `trackNHitsMissingOuterCorrected`).
- For each (mass, lifetime): signal fractions eTrue(3+), eTrue(2), eTrue(1), eTrue(0); control
  fractions e(1+), e(2+), e(3+) in data and MC.
  `eff_MC = eTrue3+ + eTrue2*eMC(1+) + eTrue1*eMC(2+) + eTrue0*eMC(3+)`, same for data.
  **Systematic = |eff_MC - eff_data| / eff_MC**, symmetric.
- Strongly lifetime dependent (long-lived charginos rely more on accidental missing hits).

**Lepton-veto scale factors** -- `LeptonVetoScaleFactorSystematic("Muon"|"Electron")`, drivers
`MUON_VETO_SCALE_FACTOR`, `ELECTRON_VETO_SCALE_FACTOR`.
- Relative veto efficiency `eff(veto)/eff(loose veto)` = fraction of tracks with
  deltaR to the closest lepton >= 0.15 (`_vetoDeltaR`), from the tree branch
  `track_deltaRToClosest<flavor>`, in signal (`disTrkSelectionSmearedJetsLooseVetoes<layer>`) and
  in tag-and-probe data (`ZtoEleProbeTrkWithLooseFilter` / `ZtoMuProbeTrkWithLooseFilter`), with the
  POG lepton-ID scale-factor payload (`setPOGPayload`). Small (<0.3% in 2022-2023).

## D. External inputs

- **Luminosity**: 1.4% (2022), 1.3% (2023) in the current cards; per-year LUM POG values and their
  correlated/uncorrelated split for a final result.
- **Track-reconstruction efficiency**: tracking POG recommendation per period (0.7% 2022EFG,
  2.0% 2023D in the dissertation tables).
- **Cross section**: wino/higgsino theory uncertainty, `rel_err` in `wino_xsec.json` (Resummino;
  3% at 100 GeV to 17% at 1200 GeV for wino), one nuisance shared by everything.

## E. Statistical and method

- **Signal MC statistics**: Run 2 `makeDatacards.py` used `1 + sqrt(sum w^2)/sum w` per point and
  bin, including the lifetime weight.
- **Lifetime reweighting**: no dedicated systematic in Run 2 (only the MC statistics of the
  reweighted yields).

## Background systematics

From `bkgdConfig_<era>_<layer>.py` and dissertation tables 7.35-7.38:

| Name | Applies to | Meaning |
|---|---|---|
| `Fake_syst_fit` | fake tracks | uncertainty of the d0-sideband transfer-factor fit; shared across layer bins of an era |
| `Fake_syst_sampleDiff_<layer>` | fake tracks | difference between the Z->mumu and Z->ee control-sample estimates (`fakeTrackSystematic<year>.py`, `FakeTrackSystematic` in `bkgdSystematics.py`) |
| `Elec_energy` | electrons | electron energy-related term of the electron estimate (dissertation Sec. 7.5.3 / Table 7.36 -- read its definition there before re-deriving; not yet checked against code) |
| `Tau_energy` | taus | the analogous tau term (same caveat) |
| `Muon_lowStatPoffline`, `Muon_lowStatPtrigger`, `Tau_lowStat...` | muons, taus | one-sided terms (`one_sided_signed`) where P_offline / P_trigger are statistically limited; the sign printed in the table is applied |
| `*_alpha_<layer>` | each component | the estimate's propagated statistical error. **Do not add these on top of the estimate's own error** -- the current cards carry that error as one `bkgstat` lnN per bin instead. |

Status notes for these background terms:
- The legacy `bkgdConfig_2022EFG_*.py` comments the fake and electron terms as "Still using 2018AB
  values; NEEDS TO BE UPDATED" -- the dissertation tables repeat the same numbers, so they are not
  even Run 3 placeholders.
- `Fake_syst_fit` is the dissertation's transfer-factor fit uncertainty; the Nano fake estimate's own
  zeta fit error is already inside `bkgstat`, so keeping both double counts. Replace, don't add.
- `bkgstat` is one relative error (the bin's total-background error) put on every background column
  of the bin, so small components (e.g. muons with ~70% relative error) are not represented by their
  own uncertainty.
- Components below the card builder's `EPS = 1e-4` (e.g. taus, ~3e-6 events) get no column, so their
  systematics silently drop out.

---

## Published Run 2 paper vs dissertation vs Run 3 plan

Compared 2026-10-14. Paper = EXO-19-010 (2017-2018, 101 fb-1); values are its averages over periods,
masses and lifetimes (Table 3 signal, Table 2 background). Dissertation = Sec. 7.5.

| Systematic | Run 2 paper | Dissertation | Run 3 plan / action |
|---|---|---|---|
| ISR | Correction vs **gen pT of the chargino pair**, from Z->mumu pT data / **PYTHIA-only** Z; factors 1.8-2.0; unc. = stat. error of the correction, **13%** | Data / MadGraph background MC of pTmiss,no-mu in Z->mumu; 6.6-7.1% | Run 3 signal is `madgraph-pythia8` (ME ISR jets included), so the reference must be MadGraph DY, not PYTHIA -- expect a correction far below 2. Apply vs gen chargino-pair pT (Run 2), and check the signal and DY generator setups match first |
| Pileup | ~3% | min-bias xsec +-4.6%; 2.9-6.4% | Done (`pileup_v1`), 0-3% per era/lifetime/layer |
| Trigger | Data/MC stat. (0.4%) + HLT IsoTrk >=5-hit leg: signal nlay>=6 vs 4/5 efficiency weights, **not applied to nominal**, only for the unc. (1.0/0.3%) | Same two terms; SF from **W->lnu MC** vs Muon data | Add the short-track term; needs W->lnu MC |
| JES / JER / MET | 0.6-1.6 / 0.5-1.3 / 0.3-0.4% | MET split into jet res., tau, **photon (1.4-1.7%)**, unclustered ES | Include tau and photon ES in the MET variations |
| Missing inner/middle/outer hits | data/MC eff. in **single-muon events only**: 0.1-4.6 / 2.5-5.2 / <0.3% | Muon CR (nlay>=6, applied to all) **plus Z->mumu+tauh and Z->ee+tauh**; larger of muon vs Z+tauh | **Decided: follow the paper -- muon CR only** (Matt, 2026-10-22). Muon CR inputs exist (`missing_hits_control` mode) |
| Hit-drop corrections | Not in the paper (code had 2015-2018 values) | chi2 "grid search" per era (Table 7.34); the legacy script actually uses Minuit | Port/refit (SIG-02/03) |
| E_calo | Z->mumu, mostly spurious tracks: 0.4-1.0%, on the rho-corrected variable that was cut on | Same definition; legacy Run 3 code filled the raw calo-jet energy | Use the pileup-subtracted variable actually cut on |
| Lepton veto | vs tighter criteria with SFs, in the Pveto sample: <=0.1% | Same | Same |
| Track reco | Tracking POG 2.1 / 2.5% | 0.7% (2022, 2023C), 2.0% (2023D) | Lookup |
| Lumi / xsec | 2.3 / 2.5%; xsec 2-9% (scales + PDF) | 1.4% (2022) | Same approach |
| Signal MC stat., reweighting method | Not listed | Not listed | New in Run 3 |
| e / tau visible energy (10 GeV) | -13..-15% (e), -11..-25% (tau) | Same | Same |
| mu / tau one-sided Poff, Ptrig | 1-11% (+ P_HEM, 2018 only) | Same | Same, no HEM |
| Fakes: Z->ee vs Z->mumu | 0-200% | Same | Same |
| Fakes: zeta fit +-1 sigma | +-43-52% | Same | Same |
| Fakes: sideband projection closure; 9 alternative 0.05 cm sidebands | Tested, no systematic needed | -- | **Repeat as validations** under highPurity + dE/dx |

Statistical model in the paper: control-sample-size uncertainties constrained with **gamma**
distributions, everything else log-normal; all periods uncorrelated except the signal cross section.
The Run 3 cards put `bkgstat` in as `lnN` -- switch it to `gmN` (matters for low-count and zero-sideband
fake-track bins).

MC needed to reproduce the dissertation's set (not DY alone): DY (E_calo, ISR, tauh hit CRs), W->lnu
(trigger SF, muon CR), ttbar and the other backgrounds in the muon CR and the ISR Z->mumu region.

