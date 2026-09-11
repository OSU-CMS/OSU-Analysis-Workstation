# Physics background: charged-lepton fakes

Source: M. Carrigan, "Searches for Long-Lived Particles with the CMS and milliQan
Experiments" (OSU dissertation, 2025), Chapter 7, Section 7.4.1 "Charged Leptons".
Describes the same Run-3 disappearing-tracks charged-lepton background this skill
develops, in AN/dissertation notation rather than the Nano code's variable names.

## Why leptons are a background

A charged lepton (electron, muon, or hadronic tau) whose track is reconstructed but
which itself fails object reconstruction looks like a disappearing track: a track with
no matched lepton object and no further detector activity. The background estimate is
the expected rate of this non-reconstruction mimicking the signal topology.

For a non-reconstructed lepton to contribute to the background it must:

1. fail to be reconstructed as its lepton flavor, yet leave a track in the inner
   tracker;
2. have a large enough p_T^(miss, no mu) to pass the offline p_T^(miss, no mu)
   requirement (a reconstructed lepton would have contributed visible p_T instead of
   invisible p_T, i.e. would *not* have inflated MET the same way);
3. have p_T^(miss, no mu) large enough to have also passed the HLT MET requirement.

The background estimate is the product of three probabilities (the dissertation's
P_veto, P_offline, P_trigger) times the number of control events, corrected by the
lepton trigger efficiency:

```text
N_est^l = (N_ctrl^l / eps_trigger^l) * P_veto * P_offline * P_trigger      (dissertation eq. 7.9)
```

This is the same object as the Nano code's

```text
N_lepton = N_ctrl * Pveto * Poffline * Pmiss / epsilon_trig^lepton
```

**Terminology note:** the dissertation's P_trigger and the Nano code's/AN's `Pmiss` are
the same quantity -- the MET-trigger turn-on probability, given offline MET has already
passed. Don't confuse either with `epsilon_trig^lepton` (`eps_trigger^l`), the separate
tag-probe trigger-matching efficiency divisor.

## Pveto: the lepton non-reconstruction probability

Measured with a tag-and-probe study per flavor:

- Electrons and muons: same dataset/selections as the fiducial-map tag-and-probe study,
  plus the fiducial selections, considering all lepton-track pair combinations.
- Taus: two decay channels, tau -> e nu nu (EGamma dataset) and tau -> mu nu nu (Muon
  dataset), with M_T(p_T^miss, lepton) < 40 GeV added to suppress W+jets contamination,
  and the dR(track, jet) > 0.5 requirement dropped (since track-jet proximity is
  expected for a genuine hadronic tau decay).

For probe tracks passing tag-and-probe, a further veto selection identifies the
non-reconstructed-lepton candidates (well-separated from the lepton, calo energy cut,
missing-outer-hits requirement -- see dissertation Table 7.18). A same-sign subtraction
removes Drell-Yan/fake-track contamination:

```text
P_veto = (N_T&P^veto - N_SS,T&P^veto) / (N_T&P - N_SS,T&P)      (dissertation eq. 7.3)
```

This is the direct OS-minus-SS histogram-branch ratio -- the same convention as the
legacy AN scripts and what Nano implements (see
[references/workflow.md](workflow.md#legacy-pveto-convention)).

## Poffline: the offline MET probability

The probability for a non-reconstructed lepton to pass p_T^(miss, no mu) > 120 GeV and
|Delta Phi(leading jet, p_T^(miss, no mu))| > 0.5. Estimated in single-lepton control
samples (dissertation Tables 7.20-7.22) by re-treating the selected lepton as invisible:
p_T^(miss, no mu) -> |p_T^(miss, no mu) + p_T^lepton| (vector sum; electrons/taus only --
the analysis's p_T^(miss, no mu) definition already treats muons as invisible).

## Ptrigger / Pmiss: the MET-trigger turn-on

Given the offline requirement passed, the probability to also pass the HLT MET trigger.
Computed by convolving the HLT trigger-efficiency curve eps(x) (measured in the
single-lepton samples) with the p_T^(miss, no mu) distribution n(x) above 120 GeV:

```text
P_trigger = integral_120^inf [n(x) * eps(x) dx] / integral_120^inf [n(x) dx]      (eq. 7.5)
```

## Tau normalization

Run 3 has no low-p_T single-tau trigger, so the number of tau control events is
estimated from the ratio of a muon+tau cross-trigger to a muon-only trigger, applied to
the single-muon control sample:

```text
P(tau) = P(muon+tau) / P(muon)                              (eq. 7.7)
N_tau  = N_ctrl^l / P(muon) = N_total * N_(muon+tau) / N_muon      (eq. 7.8)
```

## Closure test

Validated on simulated ttbar and Z -> ll MC with relaxed jet/track/missing-outer-hit
selections (to increase statistics): P_veto measured from Z -> ll, the rest of the
estimate uses ttbar. Dissertation Table 7.26 shows agreement within 1 sigma between the
estimate and the observed non-reconstructed-lepton count, across all three layer bins
and all three flavors.

## What "improving" this background means

The background is already small (well under 1 event per era/layer-bin in most channels,
per dissertation Tables 7.23-7.25) and dominated by muon and tau statistics in the
n_layers = 4, 5 bins, where Poffline/Ptrigger had to be borrowed from the combined-layer
category for lack of statistics (see dissertation Tables 7.24-7.25 footnotes).
Investigating this background for "possible improvements" most plausibly means:
validating the AN-vs-Nano cross-check (Table 28 and friends) more completely across
eras, tightening the low-statistics layer-bin treatment, or resolving the open review
items in
[references/troubleshooting.md](troubleshooting.md#open-items-to-keep-in-mind) -- not
finding a new physics cut, since this is a measured non-reconstruction rate, not a
selection to optimize.
