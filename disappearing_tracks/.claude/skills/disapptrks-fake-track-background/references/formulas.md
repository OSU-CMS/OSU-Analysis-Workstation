# Formulas and dissertation cross-reference

## AN/Chapter-5 method (`--an-control`)

This is the dissertation's method (M. Carrigan, "Searches for Long-Lived Particles with
the CMS and milliQan Experiments," OSU dissertation 2025, Section 7.4.2 "Fake Tracks")
-- see also `disapptrks-track-diagnostics`'s
[references/fake-track-background-estimate.md](../../disapptrks-track-diagnostics/references/fake-track-background-estimate.md)
for the physics motivation.

```text
P_fake_raw = N_sideband / N_control                          (dissertation eq. 7.11; code: estimate_fake_track_background_an)
P_fake     = zeta * P_fake_raw                                (eq. 7.13)
N_fake     = P_fake * N_basic                                 (eq. 7.14, if --basic-yield-category/--basic-files given)
```

- `N_control`: the Z->ll control-region yield (`fake_zmumu_control` or
  `fake_zee_control` category) -- dissertation's N_Z.
- `N_sideband`: candidates in the `0.05 < |d0| < 0.50 cm` sideband within that control
  region, per layer bin (`fake_zmumu_sideband_{layer}`/`fake_zee_sideband_{layer}`).
- `zeta`: the d0 transfer factor, either:
  - **fixed** (`--transfer-factor-source fixed`, the `estimate-fake-tracks` default):
    looked up from `AN_FIXED_TRANSFER_FACTORS` in `src/disapptrks/fake_tracks.py` by
    run period and control region (dissertation Table 7.29's exact values -- see
    below); or
  - **fit** (`--transfer-factor-source fit`, `make-standard-fake-track-estimate`'s
    default): a Gaussian(mean=0)+constant Poisson-likelihood fit to the folded |d0|
    histogram (`fake{ZMuMu,Zee}FitTrack_absDxy`) in `0.10 <= |d0| < 0.50 cm`,
    integrated over `0.0-0.02 cm` (signal) and `0.05-0.50 cm` (sideband) and divided
    (dissertation eq. 7.12). The signed histogram (`fake{ZMuMu,Zee}FitTrack_dxy`) is
    used only for the Figure-7.15-style plot, not the fit itself.
- `N_basic`: the basic-selection/JetMET yield (`basic_yield_category`, default
  `basic_selection`), used to normalize the Z->ll-derived probability onto the actual
  search sample.

### Fixed AN transfer factors (`AN_FIXED_TRANSFER_FACTORS`)

Matches dissertation Table 7.29 exactly as of this writing -- treat the code as
authoritative if it has since been updated (e.g. a new run period added):

| Run period | zeta (Z -> mu mu) | zeta (Z -> ee) |
| --- | --- | --- |
| 2022CD | 0.10 +/- 0.06 | 0.11 +/- 0.16 |
| 2022EFG | 0.09 +/- 0.04 | 0.10 +/- 0.04 |
| 2023C | 0.08 +/- 0.04 | 0.07 +/- 0.07 |
| 2023D | 0.09 +/- 0.05 | 0.09 +/- 0.04 |

Run-period and control-region strings are aliased (e.g. `2022_postEE` -> `2022EFG`,
`EGamma`/`electron` -> `zee`) -- see `AN_RUN_PERIOD_ALIASES` and
`AN_CONTROL_REGION_ALIASES` for the full mapping before assuming a string needs to
match exactly.

## General method (no `--an-control`)

The module docstring's stated Run-3 convention, generalizing the AN method to use
direct category-count ratios instead of only a Z->ll d0 fit:

```text
xi (transfer_factor) = N(transfer_signal_category) / N(transfer_sideband_category)
normalization         = N(basic_yield_category) / N(z_to_ll_yield_category)   [if both given]
control               = N(control_category) * normalization * prescale
N_fake (estimate)     = control * xi
```

Defaults: `transfer_signal_category="fake_basic3hits_d0_signal"`,
`transfer_sideband_category="fake_basic3hits_d0_sideband"`,
`control_category="fake_control_{layer}"` -- a 3-hit/basic-track proxy population's own
d0 signal-vs-sideband ratio, rather than a fit to a Z-control sample. This lets the
control region be the basic/JetMET selection directly (no Z->ll normalization needed)
by omitting `--basic-yield-category`/`--z-to-ll-yield-category`, or generalizes to any
other control by passing those two categories explicitly.

## Sanity-checking against the dissertation

Dissertation Tables 7.30-7.31 give, for 2022CD/2022EFG/2023C/2023D and each layer bin,
`P_fake` and `N_fake` for both Z->mu mu and Z->ee. A new AN-method estimate for one of
those periods should land close to those published numbers; a large discrepancy most
likely means a category-name, dataset, or control-region mismatch (see
[workflow.md](workflow.md#common-mistakes)) rather than a real change in the data.
