No — the dissertation's silence on `highPurity` doesn't tell you anything about whether it's worth adding. I'd treat that as an argument from absence, and I think the absence has a mundane explanation that has nothing to do with the merits of the cut.

Here's what I found:

**The dissertation documents an analysis that never had `highPurity` in it.** I pulled the text of `DisappTrks_Nano/docs/DissertationFinal.pdf` (Michael Carrigan, "Searches for Long-Lived Particles with the CMS and milliQan Experiments") and checked both the event-selection section and the systematics chapter. The disappearing-track candidate selection it documents (Sec. 7.3) is:

- p_T > 50 GeV
- track-based isolation < 0.05·p_T
- ≥ 5 silicon tracker hits
- no missing inner or middle tracker hits

There's no `isHighPurityTrack` requirement in that list. Given that, it would actually be surprising if the systematics chapter *did* mention `highPurity` — that chapter (Sec. 7.5–7.6-ish, the long run of "Table 7.3x/7.4x" systematic-uncertainty tables) evaluates a systematic for each selection requirement that's actually applied: the missing inner/middle hits requirement (Table 7.39, via data/MC efficiency ratios in muon and Z+τ_h control regions), the calorimeter energy cut (Table 7.41), jet/tau/photon/unclustered energy scale (Table 7.40), trigger efficiency, the fake-track ζ transfer factor (Table 7.38), etc. Every one of those is tied to a cut that's actually in the selection. A cut that was never applied has nothing for a systematic to be computed on — so its absence from that chapter is just bookkeeping, not a verdict.

**This is also consistent with what your own repo says about where things stand.** `disappearing_tracks/CLAUDE.md` frames this explicitly as an open, current investigation: *"We are evaluating whether to add the `isHighPurityTrack` requirement to the full disappearing-track selection. It is not part of the selection today."* The dissertation is a snapshot of the analysis as it existed when it was written; this `highPurity` question is, by the repo's own description, a later and still-unresolved question. A document can't be silent-as-rejection on a question that postdates it — it's silent because the question hadn't been posed yet in the form you're posing it now.

**So "not established" is the wrong test here.** Whether to add `highPurity` isn't a question of precedent in a chapter that predates the idea — it's the tradeoff your CLAUDE.md already lays out: does it cut the fake-track background enough to be worth whatever signal acceptance it costs? That's exactly what the three in-repo workstreams are for:

- the sideband dE/dx study (does `highPurity`, or some refinement of it, actually discriminate real tracks from fakes),
- the signal-acceptance cutflow (what does requiring it cost in efficiency, per n-layers bin), and
- the fake-track yield estimate (does the background number actually go down enough to matter).

None of those three depend on whether the dissertation happened to name the cut.

**One more thing worth flagging:** if the acceptance/rejection tradeoff comes out in favor of adding `highPurity`, it will need its own systematic uncertainty at that point — not because the dissertation should have had one, but because every other track-quality/hit-based cut in that same chapter got one when it was adopted (the missing-hits table is the closest structural precedent: a data/MC efficiency comparison in control regions). That's a "when we add it, we follow the established methodology for evaluating a new selection systematic" situation, not a "it's already established so we can skip that step" situation.

Bottom line: don't read the dissertation's silence as the group having considered and rejected `highPurity`. It was silent because the cut wasn't in the analysis being written up, not because someone judged it unworthy. Decide on the actual acceptance-vs-background-rejection tradeoff, and budget for a new systematic study if you adopt it.
