No -- that inference doesn't hold, and I'd push back on the premise before it steers the decision.

**Why the dissertation is silent on `highPurity`**

The dissertation you're referencing (M. Carrigan, OSU 2025) has a Chapter 7.5.4,
"Signal Selection Systematics," that enumerates: pileup, missing hits, ISR,
JES/JER, MET, calorimeter energy, the lepton-veto scale factor, trigger
efficiency, and track reconstruction efficiency. `highPurity` isn't in that
list for a simple reason: **the `isHighPurityTrack` requirement was not part
of the disappearing-track selection at the time that dissertation was
written.** You can't have a systematic uncertainty entry for a cut that isn't
in the selection -- there's nothing to assign an uncertainty to. The absence
is a statement about the selection's history, not a judgment that the cut was
considered and rejected as immaterial.

This is confirmed by our own repo's framing of the current work
(`disappearing_tracks/CLAUDE.md`, "Current investigation: adding `highPurity`
to the signal selection"): "We are evaluating whether to add the
`isHighPurityTrack` requirement to the full disappearing-track selection. It
is not part of the selection today." That's an open, live question, not
something the dissertation already settled by omission.

**So "not an established systematic" is the wrong frame**

"Established systematic" implies someone already evaluated `highPurity` and
concluded it doesn't need a systematic treatment. That's not what happened --
it was simply never part of the selection this analysis inherited, so it
never came up. Treating dissertation-silence as evidence against adding the
cut would be circular: the cut is missing from the systematics chapter
*because* it's missing from the selection, and "it's missing from the
selection" is exactly the question you're trying to answer.

**What should actually decide this**

The real tradeoff, per the `disapptrks-signal-acceptance` skill and the
three-skill split in `disappearing_tracks/CLAUDE.md`, is empirical, not
historical:

- Does `highPurity` meaningfully reduce the fake-track background? (sideband
  discrimination study -- `disapptrks-track-diagnostics`'s `high_purity_study`;
  actual yield impact -- `disapptrks-fake-track-background`)
- What does it cost in signal efficiency, per `n_layers` bin? (the
  `signal_acceptance` PocketCoffea mode / `summarize-signal-high-purity`,
  covered by `disapptrks-signal-acceptance`)

If you do decide to add `highPurity` to the selection, the dissertation's
silence tells you something useful but different: it means you'll need to
*author* a new systematics entry for it (following the pattern of the
existing Chapter 7.5.4 entries) rather than being able to point to prior
precedent -- since as far as that dissertation is concerned, this cut and its
associated uncertainty simply didn't exist yet. That's a documentation
consequence of adding the cut, not a reason to avoid adding it.

**Bottom line:** don't read the dissertation's silence as a prior verdict
against `highPurity`. It reflects the selection's state at the time the
dissertation was written, not an assessment of the cut's merit. The
acceptance-cost/background-rejection tradeoff is still open and is what
should actually decide whether to add it.
