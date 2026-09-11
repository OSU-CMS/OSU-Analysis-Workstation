# Troubleshooting

## Schema and retained hit information

Check a representative custom NanoAOD before a large submission:

```bash
disapptrks audit-schema PATH/representative.root
```

The detailed studies require the `IsoTrackDeDxHit` table and its association
field `isoTrackIdx`. If the processor reports that this table is absent, the
existing NanoAOD cannot produce per-hit or derived per-track dE/dx quantities;
remake it with the updated OSUNano configuration or disable the optional dE/dx
histograms.

For source MiniAOD, `edmDumpEventContent` establishes whether the
`reco::DeDxHitInfo` products exist. `edmProvDump` establishes the exact
`saveDeDxHitInfo` and `saveDeDxHitInfoCut` configuration used to produce the
file. The existence of the product does not mean every isolated track has
retained hit information.

## Common command mistakes

- Environment variables placed after `scripts/run_lpc_dask.sh` are parsed as
  script arguments. Move them before the script name.
- A `zee` output made from a Muon JSON is not a valid electron control sample;
  verify dataset JSON, sample, primary dataset, and output variant together.
- Use a new output variant when comparing implementations so previous PDFs and
  Coffea files are not overwritten.
- Local dataset JSONs may be stale. Follow the user's declared authoritative
  checkout and do not infer production contents from unrelated local files.

## Output size and Dask

Per-hit histograms can substantially increase processing and reduction cost.
Enable them only for the dedicated high-purity sideband mode. The signal mode
stores compact track summaries only.

Late failures in a Dask output reducer, repeated `KilledWorker`, or missing
spill files usually indicate memory pressure or worker loss during reduction,
not a physics-selection error. Inspect worker logs, reduce histogram payload,
use an appropriate tree reduction, or increase worker resources. Do not assume
that increasing scaleout fixes a reduction bottleneck.

## Count consistency

The input-variable overlays are independently normalized. Different curve
heights do not directly give efficiency; use their legend `N` values.

Different variables can have different entry counts when values are masked,
missing, outside the plotted range, or defined only for tracks with strip
hits. Inspect `UF`, `OF`, and the variable definition before treating unequal
entries as a processing bug.
