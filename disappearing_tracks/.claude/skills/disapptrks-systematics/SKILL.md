---
name: disapptrks-systematics
description: Compute, review, or explain the systematic uncertainties of the Run 3 disappearing-track search in DisappTrks_Nano/PocketCoffea -- signal (pileup, ISR, trigger, JES/JER/MET, E_calo, missing inner/middle/outer hits, lepton-veto scale factors, track-reconstruction efficiency, signal MC statistics, lifetime-reweighting method) and background (fake-track fit and sample difference, lepton energy and low-statistics P_offline/P_trigger terms, estimate statistics), plus luminosity, cross section, and how each enters the datacards (lnN values, nuisance names, correlation model, per-lifetime values). Use whenever the task is to derive or update a systematic, replace the dissertation-table placeholders currently in the cards, ask why a systematic is large (e.g. 2023D E_calo), make a systematics summary table, or decide how a systematic depends on chargino mass/lifetime -- even if the user only names one systematic. Do not use this for the background central values themselves (disapptrks-lepton-backgrounds, disapptrks-fake-track-background) or for Combine mechanics (disapptrks-datacards-limits).
---

# DisappTrks Systematics (Run 3)

How to compute every systematic uncertainty for the disappearing-track search in the
Nano/PocketCoffea framework, following the Run 2 methods, and how the results reach the
datacards. Physics central values (background estimates, signal yields) come from the other
`disapptrks-*` skills; this skill is about the uncertainties on them.

## Policy: use the Run 2 methods

The group's instruction (2026-10-15) is to compute every systematic **with the Run 2 (EXO-19-010)
method** unless that method is irrelevant in Run 3 (P_HEM, the 2017 L1 ECAL prefiring weight, the
2017 pixel low-efficiency region). That includes Run 2's granularity: the per-point systematics
(pileup, ISR, JES, JER, the six MET types, trigger data/MC, missing outer hits) are evaluated per
(mass, generated lifetime) and copied to every reweighted lifetime in that decade -- the legacy
`systematic_values__<syst>_<era>_<layer>.txt` files show exactly this. Everything else is one value
per era and layer bin. Do not add systematics Run 2 lacked except as validations, and flag any real
adaptation for explicit sign-off. Where the paper and the 2017/2018 legacy code differ, the code is
what produced the published numbers.

Decided exceptions (Matt, 2026-10-15):
- **Pileup keeps its mass-averaged values** per (era, lifetime, layer) (`pileup_v1`); do not redo it
  at Run 2 granularity.
- **ISR reference sample = MadGraph DY**, because the Run 3 signal is `madgraph-pythia8` (Run 2's
  PYTHIA-only reference matched its PYTHIA-only signal). Everything else follows Run 2: Z->mumu pT
  data/MC ratio, applied vs the generator-level chargino-pair pT, uncertainty from varying the
  correction within its statistical error.

## Where things stand -- read before quoting any number

- **Every systematic in the current cards is a placeholder** taken from the group dissertation
  (`DissertationFinal.pdf` in `ref/DisappTrks_Nano/docs/`: signal Tables 7.44 (2022) / 7.45
  (2023), background Tables 7.35-7.38), stored in
  `limits/<scan>/dissertation_systematics_by_era.json`. Those numbers belong to the dissertation's
  selection (no highPurity, no dE/dx cut) and are averaged over its mass/lifetime grid. Say so
  whenever a number from that file is quoted.
- **Only pileup is computed in Nano so far** (SIG-01 + SYST-03, 2026-10-08/09): opt-in
  `DISAPPTRKS_SIGNAL_PILEUP=1` in `config.py` (`MattDev` `a1fda7d`) adds the `pileup` weight and
  its variation for `SIGNAL_Chargino`; yields, the mass-averaged per-(era, lifetime, layer) values and the
  `pileup_v1` cards are documented in `limits/lifetime_reweighted_run3/README.md`. Those cards use mass-averaged
  values per (era, lifetime, layer) -- kept deliberately (see the decided exceptions above). Otherwise the config still
  activates only `genWeight`, `lumi`, `XS` and `calibrators=[]`; confirm in the live checkout
  (`grep -n "variations=\|calibrators=\|weights=\|SIGNAL_PILEUP" pocket_coffea/config.py`).
  `average_signal_variations.py` + `build_combined_cards.py --lifetime-systematics` are the reusable path
  for the next weight-variation systematic (ISR, trigger).
- **The corrections themselves are not applied either.** Signal yields carry no pileup, ISR,
  trigger, missing-hit or veto-SF weights, so the current nuisances cover corrections that were
  never made. Adding a correction changes the nominal signal yields (SIG-xx) as well as giving its
  uncertainty (SYST-xx); plan them together and rebuild every card afterwards.
- Some background placeholders are older still: the legacy `bkgdConfig_*` files mark the fake and
  electron terms "Still using 2018AB values; NEEDS TO BE UPDATED".
- The per-lifetime machinery below depends on the `DISAPPTRKS_SEARCH_LIFETIME_COLUMNS` block, committed
  on `MattDev` as `a1fda7d` (2026-10-12) -- pull it into `ref/DisappTrks_Nano` if that clone predates it.
- **Full-Run-3 projections** (2024-2026 signal scaled from 2023D) clone 2023D's signal
  systematics except E_calo, which uses the 2018 value (`2023D_ecalo2018` entry; reasoning in
  `limits/combined_run3_ctau100/README.md`). Any new 2023D value changes those periods too.
  **Exception: pileup** (pileup_v2, 2026-10-21): the 2023D MC is reweighted to each projected year's own data
  profile (`DISAPPTRKS_PILEUP_TARGET_YEAR`, 2026 = 2025 stand-in), which changes both the nominal 2024-2026
  yields and their `pileup_<year>_*` lnN -- see `limits/lifetime_reweighted_run3/README.md`. A new weight-type
  systematic for the projected eras should likewise be evaluated on those target-year runs, not cloned from 2023D.
- The task inventory (`ref/DisappTrks_Nano/docs/an_task_inventory.md`, SIG-01..10, SYST-01..15)
  is the checklist these map onto; cite the task ID when reporting progress.

## The five kinds of systematic -- pick the method by kind

Each kind has one way of being computed; most mistakes come from using the wrong one (e.g.
deriving a control-region data/MC difference from signal MC, or applying a single
dissertation average where Run 2 computed a value per lifetime).

| Kind | Systematics | Computed from | Depends on (mass, lifetime)? |
|---|---|---|---|
| **A. Event-weight variation** on signal MC | pileup, ISR, trigger (grand-OR and turn-on) | signal MC yield with weight Up/Down vs nominal | yes -- one value per point and layer bin |
| **B. Object-calibration variation** on signal MC | JES, JER, unclustered MET | signal MC rerun with shifted jets/MET | yes |
| **C. Data/MC efficiency in a control region** | E_calo, missing inner+middle hits, lepton-veto SFs, (missing outer hits) | data vs MC efficiency of one cut on real tracks | E_calo/hits: no (one per era, layer bin); missing outer: **yes**, folded with each signal point's hit distribution |
| **D. External input** | luminosity, track-reconstruction efficiency, wino/higgsino cross section | POG/LUM recommendations, theory table | xsec: mass only |
| **E. Statistical / method** | signal MC statistics, background estimate statistics, lifetime-reweighting method | the yields and closure tests themselves | yes |

Background systematics (fake-track fit and Z->mumu vs Z->ee sample difference, electron/tau
energy, one-sided muon/tau low-statistics P_offline/P_trigger, estimate statistics) are kind C/E
applied to the data-driven estimates; they come out of the background-estimate workflows.

The Run 2 recipe for each one -- class, control region, formula, code location -- is in
[references/run2-methods.md](references/run2-methods.md). Read the entry for the systematic
being worked on before implementing it; the formulas are short but not obvious (e.g. the
missing-outer-hits efficiency is a sum over the signal's true missing-hit multiplicities).

How to implement each kind in PocketCoffea (weights with variations, calibrators, control-region
category modes, column outputs) is in
[references/nano-implementation.md](references/nano-implementation.md).

## Signal systematics at every lifetime, including reweighted ones

The signal grid has 45 lifetimes, most of them reweighted from four generated samples
(`limits/lifetime_reweighted_run3/`; source rule and yields in that README). Kinds A, B and the
missing-outer-hits part of C must be evaluated **per (mass, lifetime, layer bin)**, as Run 2 did,
not taken as one average:

- The `search_region` mode's opt-in `ColOut` (`DISAPPTRKS_SEARCH_LIFETIME_COLUMNS=1`) stores each
  selected event's `weight` and `GenChargino` lifetimes. When weight variations are configured,
  PocketCoffea's columns manager also writes `weight_variation_<name>Up/Down` beside `weight`
  automatically. So the lifetime-reweighting extraction gives the varied yield at any target
  lifetime by multiplying the same lifetime weight into the varied event weight -- the exact
  analogue of Run 2's `WeightSystematicFromTrees`, which read `eventvariable_<w>Up/Down` branches
  next to `lifetimeWeight`.
- Shape variations (kind B) arrive as separate `variation` keys in the column output; the same
  extraction applies per variation.
- Relative uncertainty per point: `(varied - nominal) / nominal`, Up and Down separately, written
  as an asymmetric `lnN` (`down/up` kappas). Keep the sign: Run 2 kept them as two numbers.

Then the card builder needs a per-point input instead of the per-era `signal_percent` block --
see "Feeding the cards" below.

## Workflow for one systematic

1. **Identify the kind** (table above) and read its Run 2 entry in `references/run2-methods.md`.
2. **Check the inputs exist**: control-region data/MC outputs for kind C (DY MC in Nano format is
   a prerequisite for E_calo and hits), correction files for kind A (pileup JSON per era is
   already configured in PocketCoffea's `parameters/pileup.yaml` for all four 2022/2023 eras),
   POG numbers for kind D.
3. **Implement it opt-in** in `config.py` / the workflow -- gated by an env var or category mode
   so existing jobs (and their byte-identical outputs) don't change. Follow
   `pocketcoffea-conventions` for weights/variations/calibrators/columns.
4. **Smoke test** one era with `--limit-files 1 --limit-chunks 1` (via `disapptrks-job-submission`
   and `disapptrks-lpc-execution`), and check the nominal yields are unchanged by the new
   machinery before reading the variation.
5. **Run all four eras**, compute the per-point/per-bin relative uncertainties, and write them to
   a new, dated systematics JSON (don't overwrite the dissertation file -- keep it for comparison).
6. **Compare with the dissertation value** for the same era and layer bin and explain any large
   difference (selection change, Run 3 conditions, statistics) before it goes into cards.
7. **Rebuild cards and rerun limits** only for what changed, and record the provenance (inputs,
   commands, date) in the relevant `limits/<scan>/README.md`.

## Feeding the cards

`limits/<scan>/scripts/build_combined_cards.py` currently reads, per era,
`eras[<era>].signal_percent[<name>][<layer>]` (symmetric %, same for every mass and lifetime) and
`eras[<era>].background` entries (`name`, `component`, `kind` = `symmetric` or
`one_sided_signed`, `percent[<layer>]`), plus `lumi_unc_percent`, and the xsec `rel_err` from
`wino_xsec.json`. Nuisance names: `<name>_<era>_<layer>` (signal and most background),
`Fake_syst_fit_<era>` (shared across layer bins), `lumi_<year>`, `signal_cross_sec`,
`sigstat_<era or mc_source>_<layer>`, `bkgstat_<era>_<layer>`.

To use per-point values, extend the builder rather than flattening them back into an average:
add an optional per-point table (e.g. `signal_points[<era>][<mass>][<ctau>][<name>][<layer>] =
[down, up]`) that overrides `signal_percent` where present, so the dissertation placeholders
remain the fallback for systematics not yet computed. Keep the nuisance names identical, so the
correlation model doesn't change by accident.

**Correlation model in use** (Run 2 convention): `signal_cross_sec` shared by everything;
`lumi_2022` / `lumi_2023` shared within a year; everything else uncorrelated between eras and
layer bins. Physically ISR, pileup, JES and luminosity components are correlated across eras;
making them so is SYST-14 and is a deliberate decision to record, not a default to change
silently.

## Things that are easy to get wrong

- **Dissertation numbers are not this analysis's numbers.** Label them as placeholders on any
  table or slide.
- **ISR here means the Run 2 data/MC recoil reweighting** derived from Z->mumu (SIG-06), not
  PocketCoffea's parton-shower `PSWeight` ISR variation. Both exist; they answer different
  questions. Say which one is meant.
- **The ISR reference sample must match the signal generator.** Run 2's 1.8-2.0 correction
  compared data to a PYTHIA-only Z sample because its signal was PYTHIA-only; the Run 3 signal is
  `madgraph-pythia8` (matrix-element ISR jets), so compare data to MadGraph DY (as the dissertation
  did) and expect a much smaller correction. Apply it vs the generator-level chargino-pair pT, as
  Run 2 did. Details and the full three-way comparison: the last section of
  `references/run2-methods.md`.
- **2023D E_calo is 20.7% in the dissertation** (vs 3.5% in 2022EFG, 0.37% in 2018): data
  efficiency of E_calo < 10 GeV on *fake* probe tracks in Z->mumu is flat (~86-90%) but 2023 DY MC
  drops to ~68-70%. The legacy Run 3 measurement used the raw calo-jet energy, not the
  pileup-subtracted variable the cut uses -- the leading suspect. It is the largest signal
  systematic and drives the 2024-2026 projection choice; re-deriving it is the highest-value item
  (needs DY MC in Nano).
- **Possible double counting in the background**: the dissertation's `Fake_syst_fit` sits on top of
  `bkgstat`, which already contains our own zeta fit error. Replace placeholders, don't stack them.
- **No uncertainty yet covers the new selection itself** (highPurity, max/median dE/dx): its data/MC
  modelling on real tracks needs its own systematic or a demonstration that it is negligible.
- **sqrt(sum w^2) underestimates the signal MC-stat uncertainty** where the effective number of
  events is small (all 0.2-1 cm points; many 200-1000 cm bins) -- see the closure pulls in the
  lifetime-reweighting README. Use a bootstrap or a minimum-n_eff rule there.
- **The lifetime-reweighting method has no systematic in Run 2**, but the Run 3 closure tests
  and the steps at the source switches (100->200 cm, 1000->2000 cm) suggest one is warranted.
  Size it from the closure (e.g. in-decade 1000->500 cm against a generated sample when one
  exists) rather than guessing.
- **Signal MC fluctuations distort the mass-lifetime band** even when every systematic is right
  (e.g. the 1000 cm M700/M800 samples). That is a sample-statistics problem, not a systematic to
  inflate; see the lifetime-reweighting README.
- **Missing inner/middle hits: muon control region only** (Matt, 2026-10-22). The dissertation
  took the larger of `HITS` (muon control region) and `HITS_V2` (Z->ee/tautau probes); the
  published Run 2 paper used the muon control region alone, and that is what Run 3 follows. Do
  not build `HITS_V2` unless asked.

## Completion checks

- State, per systematic, whether the number came from a Nano computation (with inputs and date)
  or is still the dissertation placeholder.
- For kind A/B, confirm the nominal yield with the variation machinery switched on equals the
  previous nominal exactly.
- For kind C, report data and MC efficiencies with their uncertainties, not just the ratio.
- For per-lifetime systematics, report the range over (mass, lifetime) and flag points where the
  variation is dominated by MC statistics; compare with the legacy per-point files
  (`ref/DisappTrks/SignalSystematics/data/systematic_values__*`, see the methods reference).
- Never overwrite `dissertation_systematics_by_era.json` or existing cards; write new, dated
  files and keep the old ones for comparison.
