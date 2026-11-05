# EXO PAG pre-approval checklist (transcribed)

Source: TWiki `CMS/ExoPreapprovalChecklist`
(https://twiki.cern.ch/twiki/bin/view/CMS/ExoPreapprovalChecklist), **revision r28,
2026-03-12 (CarolineCollard)**, captured from a PDF print on 2026-11-04. This is a
faithful restatement, item IDs (`EXO-xx`) are ours, added so the per-analysis trackers
can refer to items. If the live page's revision is newer than r28, re-read it and
update this file before relying on it.

Who the checklist is for: analysis contacts and EXO subgroup conveners, completed
**before** the conveners propose a call for pre-approval.

## Gating items (conveners will not call pre-approval without these)

The page names these explicitly as blocking:

1. **Trigger and main-object working-point sign-off** from object experts (EXO-07).
2. **Combine-expert sign-off** on example combine cards (EXO-09).
3. **StatComm questionnaire filled and published** (EXO-11) -- filled, not signed off.

Everything else is required content of the review but not stated as a hard gate.

## A. Documentation and publication

- **EXO-01 Analysis note.** The AN linked to the CADI line contains complete,
  updated, detailed information about all steps of the analysis.
- **EXO-02 PAS or paper draft.** Before calling pre-approval, a draft of the PAS or
  paper (whichever the publication plan calls for) is uploaded to the CADI line.
- **EXO-03 Target journal and CCLE.** When preparing the paper draft the team should
  already know the target journal and have a designated CCLE (possibly from or close to
  the team) who contributes from the start. CCLE instructions:
  https://twiki.cern.ch/twiki/bin/viewauth/CMS/Internal/CcleList
  - The request to set target journal and CCLE goes to the analysis **PubTalk**, cc
    `cms-pubcomm-coordinators@cern.ch`.
  - The PubTalk email body must **explicitly say** that cms-pubcomm-coordinators was
    cc'd -- PubTalk strips the cc list, so otherwise nobody can tell.
- **EXO-04 Letter justification (PRL/PLB only).** A < 100-word justification of how the
  Letter substantially advances the field / opens a new area / solves a critical
  problem / is of great general interest; sent later as the cover letter to the editor.
  The PubTalk posting must also state that the analysis addresses a sufficiently
  original and timely topic, otherwise it should be a regular article.

## B. Datasets

- **EXO-05 PPD-recommended datasets.** Use the datasets recommended by PPD:
  https://twiki.cern.ch/twiki/bin/viewauth/CMS/PdmVAnalysisSummaryTable

## C. Object review

- **EXO-06 Object questionnaires.** When analysis design/optimisation is complete (at
  the time of opening the CADI line) go through the analysis objects and, **only once
  an object's usage is final**, fill its questionnaire:
  https://cms-analysis-corrections.docs.cern.ch/object_review/
  - This starts the POG contacts' object review.
  - Post a message in **cms-talk** for every questionnaire filled (progress tracking).
  - Answers go automatically to the CADI line's PubTalk; EXO object experts are
    notified and iterate with the team.
  - No MC&I link yet; MC&I contacts will reach out themselves ("no stress").
- **EXO-07 Trigger and WP sign-off (GATE).** Object experts sign off on the working
  points for the main objects and on the trigger choice. Conveners wait for at least
  this before proposing pre-approval.
- Communication with object experts goes through the analysis PubTalk. Sign-off status
  reaches conveners via an internal EXO gitlab area (not visible to analysts).

## D. Statistics and ML

- **EXO-08 Combine cards example.** Provide an example of the combine cards used to
  extract limits, following the instructions on the page (the `CAT_instruction.pdf`
  attachment, 2023-07-17: "Instruction for creating an analysis area in cms-analysis
  and combine card review"), and contact the EXO combine expert (EXO main page ->
  Exotica contacts -> "Combine" statistical tool). Communication via PubTalk.
- **EXO-09 Combine-expert sign-off (GATE).** Conveners wait for it.
- **EXO-10 ML review.** Conducted by the EXO ML contact (applies when the analysis
  uses ML).
- **EXO-11 StatComm questionnaire (GATE: filled + published, sign-off not needed).**
  https://cmsstatisticscommitteequestionnaire.web.cern.ch/content/cms-statistics-committee-questionnaire
  - Log in on the "analysispreservation" site the link redirects to.
  - Must be **published** (Settings tab -> "Publish") to be reviewed and for
    pre-approval to be called.
  - Conveners remind teams to fill it before calling pre-approval.

## E. Surveys

- **EXO-12 NanoAOD survey.** Fill the online NanoAOD survey for the analysis:
  https://drive.google.com/open?id=1GE4UJ41RJ8gSQv1YUEG8r51O20KkXXIqOXoi3aoj1I

## F. Known Run 2 data issues

- **EXO-13** Be aware of the issues below and **state explicitly in the pre-approval
  talk that all of them were addressed.** Significant observed effects should be
  reported in EXO meetings.
  - **EE L1 pre-firing (2016+2017)** -- affects everyone; 2017F worst; fixed in 2018.
    Stage A check: in MC, remove events with jets pT > 100 GeV (photons pT > 50 GeV if
    relevant) at 2.25 < |eta| < 3.0; if the signal-extraction variable changes by
    <~1%, no correction needed. Stage B: event-by-event prefiring weights from the
    maps (L1ECALPrefiringWeightRecipe; precomputed in NanoAOD >= v5). E-group
    cms-l1t-ecal-prefiring@cern.ch.
  - **EE noise in MET (2017)** -- JME recipe: drop jets with 2.65 < |eta| < 3.139 and
    raw pT < 50 GeV from PF MET; valid for 17Nov2017 and 31Mar2018 rereco only; apply
    to data and MC; follow the HN on MET uncertainty propagation.
  - **HEM 15/16 (2018)** -- from run 319077, HCAL eta -3.0 to -1.3, phi -1.57 to -0.87
    off; not in central MC. No recipe: check distributions with objects in the region,
    compare before/after onset, check effect on fake rates and on signal acceptance.
    E-group CMS-HEM-15-16@cern.ch.

## G. EXO blinding policy

- **EXO-14 Blinding policy agreed.** No single EXO-wide requirement; the team proposes
  a policy early, agreed with subgroup and PAG conveners:
  - no blinding -> explain why it is sensible/necessary;
  - blind -> define exactly how it is implemented;
  - partial unblinding of a small part of the signal box -> explain why it is needed.
  - **Do not look at the signal region before the policy is agreed.**
- **EXO-15 Unblinding sequence.**
  1. Subgroup review, then pre-approval with the blinding agreement in force.
  2. After the pre-approval talk and satisfactory answers, EXO conveners give the
     green light to unblind.
  3. Before the green light, conveners check the team is ready to unblind and
     scrutinize promptly -- avoid undue delays.
  4. **No changes to the analysis results before declaring and discussing the
     unblinded results.**
  5. Conveners review unblinded results and pre-approve when satisfied.
  6. The ARC takes over after pre-approval; the team may involve the ARC in unblinding
     (before pre-approval is granted), but the pre-approval decision is the conveners'.
