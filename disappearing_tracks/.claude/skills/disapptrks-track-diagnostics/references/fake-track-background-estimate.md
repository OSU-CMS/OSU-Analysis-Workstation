# Fake-track background: the sideband dE/dx study vs. the yield estimate

This skill's dE/dx/high-purity sideband study (see
[references/workflows.md](workflows.md) and [references/plots.md](plots.md)) is a
**rejection-cut development** tool: it uses the Z fake-track sideband to look for
track/dE/dx variables that discriminate real tracks from fake ones, so new cuts can
reduce how many fake tracks survive the full selection.

That is a different thing from the disappearing-tracks search's actual **fake-track
background yield estimate** -- the number quoted in the final result. Source: M.
Carrigan, "Searches for Long-Lived Particles with the CMS and milliQan Experiments"
(OSU dissertation, 2025), Section 7.4.2 "Fake Tracks". Do not conflate the two when
asked to "investigate" or "improve" the fake-track background -- clarify which one is
meant if it's ambiguous.

## The yield-estimate method (dissertation 7.4.2)

Fake tracks are reconstruction artifacts (nearby real-track hits misassembled into a
track that doesn't correspond to any real particle trajectory), not associated with a
primary vertex. The estimate uses a Z -> mu mu (nominal) and Z -> ee (cross-check)
control region:

1. Select Z candidates (dissertation Tables 7.27/7.28), then apply the full
   disappearing-track selection to the event *except* the |d0| < 0.02 cm requirement,
   replaced by a sideband 0.05 < |d0| < 0.50 cm -- large-d0 tracks are unlikely to
   originate from the primary vertex, i.e. more likely to be genuine fakes.
2. `P_fake^raw = N(>=1 disappearing track in sideband | control region) /
   N(control region)` (eq. 7.11).
3. A transfer factor zeta extrapolates the sideband rate into the signal
   |d0| < 0.02 cm region, from a Gaussian+constant fit to the track d0 distribution
   (0.1 <= |d0| <= 0.5 cm, mean fixed at 0):
   `zeta = integral_0^0.02 fit d|d0| / integral_0.05^0.50 fit d|d0|` (eq. 7.12). zeta is
   only computed in the n_layers = 4 bin (highest statistics) and reused for all layer
   bins.
4. `P_fake = zeta * P_fake^raw`; `N_est^fake = P_fake * N_ctrl^basic` (eqs. 7.13-7.14).

Closure tests validate: (a) Z -> mu mu vs. Z -> ee give consistent estimates (sets a
systematic), (b) counting sideband vs. signal-region events directly in the control
sample agrees with the fit-based estimate within about 1 sigma, (c) the estimate is
insensitive to the exact sideband lower bound (scanned 0.05-0.50 cm), and (d) MC closure
recovers the true simulated fake-track rate within about 2 sigma (limited by MC
statistics in higher layer bins).

## Framework support

The Nano/PocketCoffea framework has a `DISAPPTRKS_CATEGORY_MODE=fake_tracks` mode
(datasets: `DATA_JetMET`, `DATA_MET`, `DATA_Muon`, or `DATA_EGamma`) for fake-track
estimate control regions -- distinct from this skill's `high_purity_study` mode. For
running that mode and producing the actual estimate (`estimate-fake-tracks`,
`make-standard-fake-track-estimate`), use the `disapptrks-fake-track-background` skill
instead of this one.

## How the two connect

A new dE/dx-based rejection cut (this skill's purpose) changes which tracks survive
into the *signal* region, which changes `N_ctrl^basic` and the disappearing-track
selection efficiency on genuine fakes -- but it does not change the d0-sideband estimate
methodology itself. "Improving" the fake-track background through dE/dx diagnostics
means finding a cut that measurably lowers the fake-track yield (fewer sideband/full-
selection fakes) without an unacceptable signal-efficiency cost -- exactly the tradeoff
this skill's
[references/plots.md](plots.md#what-can-support-a-new-rejection-requirement) section
describes.
