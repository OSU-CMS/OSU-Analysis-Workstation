# Disappearing tracks -- EXO pre-approval tracker

Living status of the EXO PAG pre-approval checklist for the Run 3 disappearing-track
search (AN-24-155). Item IDs and requirements: `.claude/skills/exo-preapproval/
references/exo-checklist.md` (TWiki r28). Maintained with the `exo-preapproval` skill.
A status changes only on evidence. Record it in the Evidence column.

**Last reviewed:** 2026-11-04 (CADI line and EXO-06 confirmed by Matt; other statuses not yet confirmed)

Status values: `unknown` (not yet asked), `not started`, `in progress`,
`drafted`, `submitted` (sent, awaiting reply), `signed off` / `done`, `N/A` (state
why, and say it in the talk).

**CADI line:** EXO-25-006. **PubTalk:** TO FILL. **Subgroup conveners:** TO FILL.
**Publication plan (PAS vs paper):** TO FILL. **Target journal / CCLE:** TO FILL.

## Gates (conveners won't call pre-approval without these)

| ID | Item | Status | Evidence | Next action |
|---|---|---|---|---|
| EXO-07 | Trigger + main-object WP sign-off | unknown | | Depends on EXO-06 questionnaires below |
| EXO-09 | Combine-expert sign-off on example cards | unknown | | Depends on EXO-08 |
| EXO-11 | StatComm questionnaire filled **and published** | unknown | | |

## All items

| ID | Item | Status | Evidence | Next action / notes |
|---|---|---|---|---|
| EXO-01 | AN complete and current on CADI | in progress | AN-24-155 in `analysis_note/` (Overleaf clone) | Systematics are still dissertation placeholders and results/limits not final (see `disapptrks-systematics`, `disapptrks-datacards-limits`). Update via `disapptrks-analysis-note`. |
| EXO-02 | PAS or paper draft on CADI | unknown | | Decide PAS vs paper first |
| EXO-03 | Target journal + CCLE request to PubTalk (cc pubcomm, stated in body) | unknown | | |
| EXO-04 | Letter justification (only if PRL/PLB) | unknown | | Only if a Letter is chosen |
| EXO-05 | PPD-recommended datasets | unknown | | Custom NanoAOD (OSUNano) is made from central parent datasets. Check that the parents and golden JSONs match the PdmV Analysis Summary Table for each era. Data is OSUv2, MC OSUv3 by design. 2024 signal MC is not used (2023D scaled), so be ready to explain both. |
| EXO-06 | Object review questionnaires (one per object, cms-talk post each) | in progress | Matt started the questionnaires 2026-11-04 | See per-object table below |
| EXO-07 | Trigger + WP sign-off | unknown | | Gate |
| EXO-08 | Example combine cards (cms-analysis area per CAT_instruction.pdf) sent to EXO combine expert | unknown | | Cards exist under `limits/` but carry placeholder systematics. Decide which version to send. |
| EXO-09 | Combine-expert sign-off | unknown | | Gate |
| EXO-10 | ML review | likely N/A | DeepSets dropped (not pursued) | Confirm no ML anywhere in the selection/estimates, then state N/A to conveners |
| EXO-11 | StatComm questionnaire filled + published | unknown | | Gate. Remember the "Publish" button in Settings. |
| EXO-12 | NanoAOD survey | unknown | | Relevant: the analysis uses a custom NanoAOD tier |
| EXO-13 | Run 2 data issues addressed, stated in talk | to state | | See "Data issues" below |
| EXO-14 | Blinding policy agreed with conveners | unknown | AN executive summary: "The analysis is still blinded" | Find or record where the policy was agreed (meeting/date). The legacy Run 2 analysis did a ~2% 2017D partial unblinding (AN appendix `initialUnblinding.tex`, commented out). Is a Run 3 partial unblinding planned? |
| EXO-15 | Unblinding after pre-approval talk, green light from conveners | not started | | No result changes between unblinding and discussion |

### Object review (EXO-06/07)

Fill a questionnaire only when the object's usage is final. The open issues listed
here would change answers, so settle or state them first.

| Object | Usage | Questionnaire | cms-talk post | Sign-off | Open issues before filling |
|---|---|---|---|---|---|
| Tracks (isolated / disappearing candidate) | Main signature; highPurity + dE/dx | unknown | | | Missing-hits correction (Run 2 random-drop, general tracks, refit). Track-reco efficiency systematic not yet computed |
| MET / MET-no-mu (PUPPI, rebuilt offline) | Trigger + offline selection | JME form drafted 2026-11-04 (with jets) | | | Stored OSUNano MetNoMu is PF and adds non-PF muons. Analysis rebuilds PUPPI offline: document this. 2023 data MET under-corrected (no JEC in OSUv2 2023C/D) |
| Jets (PUPPI) | Jet requirement, jet-track separation | JME form drafted 2026-11-04 | | | Run 3 jet-ID bug fixed in `MattDev` cfc31f0, all outputs pre-fix until rerun. 2023 data JEC. JME run-based residuals, 2.5<\|eta\|<3 |
| Electrons, muons, taus (vetoes + tag-and-probe) | Lepton vetoes, background control regions | EGM, MUO, TAU forms drafted 2026-11-04 | | | Lepton-veto SFs not yet derived. MUO post needs tag `ObjectReview:MUO` |
| Data tiers (XPOG) | Custom NanoAOD from MiniAOD | XPOG form drafted 2026-11-04 | | | |
| Triggers (MET OR; single-lepton and mu+tau control) | Signal selection, background estimates | unknown | | | Signal trigger SFs (TRIG-03/SIG-05) in progress. HPS27 (2022-23) / PNet26 (2024+) cross trigger |
| Pileup, luminosity | Weights, normalization | unknown | | | 2024-26 projections use 2023D signal reweighted to target-year pileup |

### Data issues (EXO-13) -- what to say in the talk

The analysis is Run 3 only (2022-2026), so the three Run 2 issues don't apply to its
data. Say so explicitly, one line each. The planned Run 2 + Run 3 combination
(STAT-08) uses the published EXO-19-010 inputs, which already handled them. Confirm
that with the conveners. Run 3 analogues already in the AN, worth stating:
- 2022C L1 jet-calibration issue lowering MET-path efficiency (AN `triggers.tex`).
- 2023D BPix issue and HLT-tracking recovery (AN `triggers.tex`).
- 2023C/D data JEC (OSUv2 GT lacks JEC). JME 2.5<|eta|<3 recommendation.

## History

- 2026-11-04: tracker created from TWiki r28. All statuses initial, to be confirmed.
- 2026-11-04: CADI line EXO-25-006 recorded. EXO-06 object questionnaires started (in progress).
- 2026-11-04: JME, EGM, MUO, TAU, XPOG answers drafted (session scratchpad `object_review/`), with `TO CONFIRM` items open. None submitted.
