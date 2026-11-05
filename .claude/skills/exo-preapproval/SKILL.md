---
name: exo-preapproval
description: Work through the CMS EXO PAG pre-approval checklist for an analysis -- AN and PAS/paper draft on the CADI line, target journal and CCLE request, PPD-recommended datasets, per-object POG review questionnaires and trigger/working-point sign-off, example combine cards and combine-expert sign-off, ML review, StatComm questionnaire, NanoAOD survey, the Run 2 data-issue statements (L1 prefiring, 2017 EE noise, HEM), and the EXO blinding/unblinding policy. Use whenever a task mentions pre-approval, preapproval, CADI, PubTalk, CCLE, object review or questionnaire, StatComm, combine-card review, unblinding approval, or "what's left before we can go to pre-approval", and to read or update an analysis's preapproval_checklist.md tracker. Do not use this to produce the physics content itself (cards, systematics, AN text, slides) -- route to the analysis's own skills for that.
---

# EXO PAG Pre-approval

The EXO checklist itself, transcribed with item IDs (`EXO-01`..`EXO-15`), is in
[references/exo-checklist.md](references/exo-checklist.md). Read it before answering
any question about what the checklist requires. It is taken from TWiki revision r28
(2026-03-12). If the user mentions or shares a newer revision, diff it against the
reference and update the reference first.

Each analysis keeps its own living tracker at `<analysis>/preapproval_checklist.md`
(e.g. `disappearing_tracks/preapproval_checklist.md`), with one row per `EXO-xx` item:
status, evidence, and the next action. This skill reads and maintains that file. The
analysis's own skills do the actual work behind each item.

## Ground rules

- **Claude never contacts anyone.** It does not post to PubTalk or cms-talk, email
  conveners/POGs/PubComm, submit or publish a questionnaire, or upload to CADI. It
  drafts the text and the user sends it. Several of these steps can't be undone
  (questionnaire answers go straight to PubTalk and notify the experts), so the user
  decides when.
- **A status changes only on evidence.** Mark an item `signed off` or `done` only when
  the user confirms it, or a document shows it. Record the evidence in the tracker
  (PubTalk message date/title, questionnaire submission date, CADI upload). "We sent
  it" is `submitted`, not `signed off`. Don't infer sign-off from silence.
- **Blinding comes first.** Until the blinding policy is agreed (EXO-14), and until the
  conveners give the green light after the pre-approval talk (EXO-15), don't run,
  open, or summarize anything that reveals observed data in the signal region. That
  includes data datasets in a search-region mode and observed yields in cards or
  tables. If a request would do so, stop and say why. After unblinding, nothing about
  the analysis changes before the unblinded results are declared and discussed.
- **Object questionnaires only once the object is final.** The checklist says to fill
  one only when that object's usage is finalized. Before drafting one, check the
  tracker's open issues for that object and list any that would change the answers.
- **Only the requested edit** to the tracker (standing feedback). Flag anything else
  as a suggestion.

## Common tasks

### "Where are we / what's left?"

1. Read `<analysis>/preapproval_checklist.md` and its "Last reviewed" date.
2. Report the three **gates** first (EXO-07 trigger+WP sign-off, EXO-09 combine
   sign-off, EXO-11 StatComm published). Then the other open items, then N/A items
   whose justification still needs stating in the talk.
3. For each open item, give the next concrete action and who has to do it (user,
   conveners, POG contact, Claude via which skill).
4. Point out stale statuses: anything `unknown`, or not updated in over a month.
   Ask the user rather than guessing.

### Update the tracker

Edit only the rows the user gave news on. Add the evidence and set "Last reviewed" to
today's date (absolute). Keep the history line at the bottom of the file with one
dated line per change.

### Draft a submission (questionnaire answers, PubTalk post, cms-talk note, CCLE request, Letter justification)

- Build answers from the AN, the code, and the analysis's skills. Cite the source for
  each answer (AN section, file:line, commit). Mark any answer you could not confirm
  as `TO CONFIRM` and don't fill it in with a plausible guess.
- Questionnaire wording changes, so ask the user to paste the actual questions (or
  the page) rather than drafting from memory of the form.
- For the CCLE/journal request: address it to PubTalk, and the body must say
  explicitly that cms-pubcomm-coordinators@cern.ch is in cc (EXO-03).
- For PRL/PLB: < 100 words, and the PubTalk post also states the analysis is
  original and timely (EXO-04).
- Save drafts in the scratchpad or where the user asks, not in the tracker. Record
  only "drafted <date>, at <path>" there.

### Pre-approval talk

The talk must explicitly state how every Run 2 data issue (EXO-13) was handled. For a
Run 3-only analysis, say why each doesn't apply, and cover any Run 3 analogues the
analysis has. It should also state the blinding agreement in force and the sign-off
status of each review. Build the talk with the analysis's slides skill (or
`hep-slides`), taking these statements from the tracker.
