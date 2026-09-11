# Plot definitions and interpretation

The sideband PDFs repeat the same plots for 4, 5, and at-least-6 measured
tracker layers. `N` is the population entering that distribution; `UF` and
`OF` are underflow and overflow counts.

## High-purity input overlays

These compare the same fake-track sideband selection before and after the
`highPurity` requirement. Each curve is normalized separately.

- **Track pt, eta, phi:** candidate transverse momentum and direction.
- **Track pt, eta, phi uncertainties:** fitted uncertainty on each corresponding
  track parameter; large values indicate poorly constrained parameters.
- **d0 and dz from the beamspot:** transverse and longitudinal impact
  parameters relative to the beamspot.
- **d0 and dz from the closest PV:** the same impact parameters relative to the
  closest reconstructed primary vertex.
- **Impact-parameter uncertainties:** fitted uncertainty on each beamspot- or
  PV-referenced d0 and dz value.
- **Track chi2:** total track-fit chi-squared; depends on both residuals and the
  number of fit constraints.
- **Track ndof:** number of track-fit degrees of freedom.
- **Normalized chi2:** chi2/ndof, allowing a more direct fit-quality comparison
  between tracks with different numbers of measurements.
- **Valid pixel and strip hits:** numbers of valid assigned hits in the pixel
  and strip trackers.
- **Missing hits before/after:** expected measurements absent before the first
  or after the last valid hit. Missing outer hits are part of the disappearing
  track signature.
- **Inactive layers before/after:** crossed non-operational layers, which help
  distinguish detector inactivity from an unexplained missing hit.
- **Layers without hits on the track body:** missing middle measurements
  between the innermost and outermost valid hits.
- **Track algorithm and original algorithm:** integer tracking iteration that
  finalized the track and the iteration that first reconstructed it.

Unavailable inner/outer-state momentum fields are represented by a sentinel
in older schemas and should be omitted rather than plotted as data.

## Event- and candidate-level dE/dx summaries

- **Raw dE/dx-hit multiplicity:** all `IsoTrackDeDxHit` rows stored in the
  selected event; not candidate-specific.
- **Retained dE/dx hits on track:** hit rows linked to the selected candidate by
  `isoTrackIdx`.
- **Retained hits minus measured layers:** difference between associated hit
  count and tracker layers with measurements. Zero means one retained row per
  measured layer; overlaps or multiple measurements can create legitimate
  positive values.
- **Median dE/dx:** robust estimate of typical ionization on the track.
- **Mean after dropping maximum:** simple truncated mean that suppresses one
  anomalously large measurement.
- **Maximum dE/dx:** largest retained measurement on the track.
- **Standard deviation:** hit-to-hit dE/dx spread about the mean.
- **Range:** maximum minus minimum dE/dx.
- **Maximum/median:** dimensionless measure of whether one measurement is much
  larger than the track's typical ionization.
- **Hits above 10 or 20 MeV/mm:** counts of moderately or very large per-hit
  ionization measurements.
- **Retained strip hits:** associated dE/dx rows in the strip tracker.
- **Strip shape failures:** associated strip hits failing the standard cluster
  shape selection.
- **Strip failure fraction:** failures divided by retained strip hits. It is
  defined only for candidates with at least one retained strip hit, so its `N`
  may be smaller.

## One-dimensional per-hit plots

Each entry is one retained hit associated with a selected high-purity
candidate, except where stated otherwise.

- **Associated retained hits per event:** sum of linked hits for selected
  candidates in the event; differs from the raw event multiplicity.
- **Source IsoTrack index:** internal row index used to validate association;
  not a physical observable.
- **Hit index:** position in the source track's `DeDxHitInfo` payload; also an
  association diagnostic.
- **detId:** packed CMS tracker detector identifier.
- **Subdetector:** PXB, PXF, TIB, TID, TOB, or TEC.
- **Layer/disk/wheel:** physical layer within the subdetector.
- **Side:** barrel, negative-z endcap, or positive-z endcap.
- **Is pixel:** pixel-versus-strip classification.
- **Hit type:** stored `DeDxHitInfo` integer type code; decode explicitly before
  assigning physical meaning to individual values.
- **Passes strip shape:** stored strip cluster-shape flag. Pixel rows are
  conventionally true, so use strip-only summaries for strip conclusions.
- **Charge:** stored cluster charge before path-length normalization.
- **Path length:** fitted distance through active sensor material.
- **Per-hit dE/dx:** charge normalized by path length.
- **Local x and y:** hit position in the detector module's local coordinates.
- **Pixel size, size X, size Y:** total pixel cluster multiplicity and its
  extent along each local direction. Strip sentinel values are excluded.

## Detector-resolved two-dimensional plots

The color represents the fraction of all retained in-range hits, not a
separately normalized distribution in each detector layer.

- **Subdetector versus layer:** retained-hit tracker occupancy.
- **Hit type versus detector layer:** reconstruction hit-type codes by physical
  tracker layer.
- **Strip shape versus detector layer:** pass/fail strip-cluster shape status;
  pixel rows are excluded.
- **Charge versus detector layer:** cluster-charge behavior by layer.
- **Path length versus detector layer:** sensor path length by layer and
  geometry.
- **dE/dx versus detector layer:** ionization behavior and localized detector
  effects.
- **Local x or y versus detector layer:** within-module hit position by layer,
  useful for module-edge or geometric structures.
- **Pixel size, size X, or size Y versus detector layer:** pixel cluster size
  and shape by pixel barrel layer or endcap disk.

## What can support a new rejection requirement

Prioritize variables with an anomalous sideband population and acceptable
signal retention. Useful scans may include strip-shape failure fraction,
maximum/median dE/dx, dE/dx spread, and retained-hit excess. These variables
are correlated; do not quote their rejection factors as independently
multiplicative. Avoid selecting a threshold from normalized sideband shapes
alone.
