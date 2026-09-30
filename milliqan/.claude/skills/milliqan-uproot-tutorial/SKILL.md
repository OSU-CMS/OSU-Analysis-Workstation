---
name: milliqan-uproot-tutorial
description: Run an interactive, Claude-guided walkthrough of the milliqanOffline uproot-based analysis framework for a new user -- opening a file, selecting branches, making cuts, drawing histograms (hist/matplotlib and PyROOT), and running the full milliqanCuts/Scheduler/Processor/Plotter framework to separate beam muons from cosmics (beamOn vs. beamOff). Use when a new user wants to learn the analysis framework hands-on, or asks for "the tutorial" / "a walkthrough" / "an onboarding session" for milliqanOffline. Assumes cluster access and the working area/conda env already exist -- see osu-t3-remote-session and milliqan-t3-working-area-setup and run those first if they aren't done yet; don't duplicate their setup steps here.
---

# milliQan Uproot Tutorial (Interactive Walkthrough)

A live, staged walkthrough of `milliqanOffline`'s Python analysis stack, adapted from
the repo's own `Run3Detector/analysis/tutorial/MilliQanUprootTutorial2024.ipynb` but
run stage-by-stage over SSH against real data rather than read from the notebook.
Built from a session that actually validated every stage below end-to-end -- the
"expected output" in each stage is real, not illustrative, so use it to sanity-check
the new user's environment rather than assuming it's approximately right.

## How to run this

- **Pace it like a class, not a script dump.** Run one stage, show the real output,
  briefly explain what it means, and pause before moving to the next stage. Ask if
  they have questions or want to poke at something before continuing.
- **Save each stage's script** into the user's own working area as you go, so they
  have something to rerun/modify afterward instead of it only existing in your
  scratch files:
  ```text
  ~/scratch0/MilliqanWorkstation/tutorial/
    01_open_file.py
    02_branches_and_cuts.py
    03_histograms.py
    04_root_histograms.py
    05_iterate_multiple_files.py
    06_framework_basics.py
    07_beam_muons_vs_cosmics.py
  ```
  **Make every saved script self-contained.** The snippets in each stage below build
  on the previous stage's variables (`uptree`, `path`, `branches`, `branches_cut`,
  `ak`), so a script saved exactly as shown fails with a `NameError` when run on its
  own. Each saved file gets its own imports, `path`, and whatever loading it depends on
  (e.g. `03_histograms.py` repeats Stage 2's `.arrays()` call and cuts), plus
  `r.gROOT.SetBatch(True)` / `matplotlib.use("Agg")` if it draws. Test-run the saved
  file itself rather than the snippet, and write plots next to the script (relative
  paths), not to `/tmp`.
- **Show them how to run the scripts themselves** (see "Running the scripts on your
  own" below): after Stage 1, when the first file exists, run it once in front of them
  using the exact command they'd type, and go through the full section at wrap-up.
- **Quoting**: `cms-t3`'s default shell is tcsh, not bash -- write scripts to a local
  file, `scp` them over, then run with the env's python by full path (see
  `osu-t3-remote-session`'s and `milliqan-t3-working-area-setup`'s Gotchas for the
  quoting patterns that survive tcsh). Don't try to inline multi-line Python via `ssh
  host bash -c '"..."'` -- write a file instead, it's more reliable.
- **The example data**: use the v36 beam skim
  `/abyss/users/mjoyce/MilliQan_skims/beamOn/MilliQan_Run1500_v36_beam_beamOn_medium.root`
  (171,341 events) throughout; its beam-off counterpart for Stage 7 is in
  `/abyss/users/mjoyce/MilliQan_skims/beamOff/`. Both directories hold Run1000-2200
  blocks (11 beamOn files, 12 beamOff). The "RunNNNN" in a filename is a *block* of
  runs (Run1500 holds runs from ~1468 on), not one run -- use the `runNumber` branch
  for per-run bookkeeping. The original notebook's v35 `tight` skim
  (`/abyss/users/mcarrigan/milliqan/skims/beamMuon/MilliQan_Run1500_v35_beam_beamOn_tight.root`,
  11,800 events) still exists, but every expected number below is for v36 -- the two
  versions differ (see "v35 vs v36" below).
- **v35 vs v36** -- worth mentioning when numbers come up, all confirmed 2026-09-29:
  - v36 `medium` skims are much looser than v35 `tight`: ~14x the events, fewer and
    smaller pulses per event, far fewer events crossing all four layers.
  - v36 recalibrated nPE per channel (same `area`, different `nPE`: 0.64x-1.96x on
    some bar channels), and **panels (type 2) and slabs (type 1) went from effectively
    uncalibrated (nPE ~ 0.4 x area) to calibrated (~2-5e-4 x area)**. Any nPE
    threshold tuned on v35 is wrong on v36 -- the notebook's `panelVeto(nPECut=100e3)`
    vetoes nothing on v36 (~110 is the area-equivalent threshold).
  - v36 adds per-pulse `prePulseMean`/`prePulseRMS` branches. Quality flags differ:
    `goodRun*` are filled in v36 (empty in v35), `beamInFill` is filled in v35 only.
    The per-event `beamOn` flag is True for only ~41-44% of events in *both*
    versions' beamOn skims -- the filename, not that branch, defines the skim.
- **The environment**: `~/scratch0/MilliqanWorkstation/miniforge3/envs/milliqan/bin/python3`
  -- call it by full path, don't rely on `conda activate` (see
  `milliqan-t3-working-area-setup`).

## Stage 1: Opening a file with uproot

```python
import uproot
path = "/abyss/users/mjoyce/MilliQan_skims/beamOn/MilliQan_Run1500_v36_beam_beamOn_medium.root"
upfile = uproot.open(path)
uptree = upfile["t"]
uptree.show()       # all branches, types, interpretations
uptree.keys()
uptree.typenames()
```
**Expected**: tree `t` (171,341 entries) with branches including `height`, `area`,
`chan`, `layer`, `type`, `npulses`, `timeFit_module_calibrated`, `sidebandRMS`,
`prePulseMean`, `prePulseRMS`, etc. (confirmed branch list -- if branches are missing
or named differently, the file itself may have changed, worth flagging rather than
pressing on silently). `upfile.keys()` shows two cycles, `t;23` and `t;22` -- ROOT's
backup copy from rewriting the tree; `upfile["t"]` picks the newest, harmless.

Point out: `uproot.open(path)["t"]` and `uproot.open(f"{path}:t")` are equivalent
(the notebook shows both forms). Explain per-event branches (`int32_t`, `bool`, e.g.
`event`, `runNumber`, `boardsMatched`) vs. per-pulse `std::vector<...>` branches
(`AsJagged`: `height`, `area`, `nPE`, `chan`, `layer`, `type`, times) -- the jagged
structure is why the framework uses awkward arrays. `sidebandMean`, `sidebandRMS` and
`dynamicPedestal` are per-*channel* (80 per event), not per-pulse: index them with
`[chan]` to line them up with pulses.

## Stage 2: Selecting branches and making cuts

```python
# numpy / pandas / awkward -- three ways to load the same branches
uptree.arrays(["height", "area"], library="np", entry_stop=1)
uptree.arrays(["height", "area"], library="pd", entry_stop=10)
branches = uptree.arrays(["height", "area"], cut="height >= 500", entry_stop=100000)

# building and combining cuts on awkward arrays
area_cut = branches['area'] >= 500
height_cut = branches['height'] >= 700
branches_cut = branches[area_cut & height_cut]   # & / | / ~ for and/or/not
```
**Expected** (`entry_stop=100000` now genuinely limits the load: 100,000 of 171,341
events):

| Step | Events | Pulses |
| --- | --- | --- |
| no cut | 100,000 | 3,651,313 |
| `cut="height >= 500"` | 100,000 | 1,236,354 |
| `& area >= 500 & height >= 700` | 100,000 | 1,111,483 |
| events left with zero pulses | 3 | -- |
| `ak.any(mask, axis=1)` (>= 1 passing pulse) | 99,997 | -- |
| `ak.sum(mask, axis=1) >= 4` | 86,015 | -- |

The key lesson: **a mask built from a per-pulse branch removes pulses, not events**
-- `len(branches_cut)` stays 100,000, including the 3 events left with empty lists
(= 100,000 - 99,997, consistent with the `ak.any` row; recounted 2026-09-30).
To select *events*, reduce the pulse mask per event first (`ak.any(mask, axis=1)`,
`ak.sum(mask, axis=1) >= N`). Also: the `cut=` kwarg to `.arrays()` only does a simple
per-entry mask, so anything mixing levels (one pulse per layer, matching across
layers) has to be done on the loaded awkward array -- which is what the framework
cuts in Stages 6-7 do. Use `&`/`|`/`~` with parentheses, not `and`/`or`/`not`.

Gotcha to mention if they explore: `b.type` returns the awkward array's *type
description*, not the `type` branch -- use `b["type"]` (bracket access is the safe
habit for any branch name).

## Stage 3: Basic histogramming (hist + matplotlib)

```python
import awkward as ak
import hist
h1 = hist.Hist.new.Reg(1000, 0, 200000, name="Area").Double()
h1.fill(ak.flatten(branches_cut['area']))
print(h1.sum())            # 589649.0 with the Stage 2 selection above
print(h1.sum(flow=True))   # 1111483.0 -- all filled pulses

import matplotlib
matplotlib.use("Agg")      # no display on a headless login node
import matplotlib.pyplot as plt
plt.hist(ak.flatten(branches['height']), bins=140, range=(0, 1400))
plt.savefig("03_height_hist.png")
```
**Expected**: `h1.sum()` = **589,649**, but 1,111,483 pulses were filled --
**521,834 sit in the overflow bin** (median pulse area ~192k, so the 0-200k axis cuts
off almost half). `h1.sum()` excludes under/overflow; use `sum(flow=True)` when a
number should count everything.

The height plot: sharp edge at 500 (the load cut), a tall spike at ~1250 (~57% of
pulses -- saturated pulses), and a second spike at ~1080. Confirmed explanation:
- ~1250 is the saturation ceiling for most channels (all panels 68-73, slabs 74/75,
  most bars). ~1075-1090 is a *lower* ceiling on 16 bar channels (4, 5, 6, 19-23,
  37-39, 42, 52, 54, 55; plus ch 7 ~1017, ch 21 ~1055, ch 79 ~1187). Per-channel
  baselines are all ~0 +- 2, so this is a channel property, not baseline -- cause
  unknown, a question for the hardware experts.
- The tail above 1250 (to ~1330) *is* baseline: height = ceiling - `dynamicPedestal[chan]`
  event by event (slope -1; +1 against `sidebandMean[chan]`/`prePulseMean`).
- Takeaway: on saturated pulses `height` measures the ceiling, not the signal -- one
  reason the analysis cuts on `area`/`nPE`. Don't call 1250 "the digitizer maximum".
- Same spikes/channels in v35, so not a v36 artefact.

Images: the Browser pane can open a local PNG (`file://...`) reliably; `scp` the PNG
back first. A markdown image link to a path the user's machine doesn't have shows
nothing.

## Stage 4: ROOT histograms (PyROOT)

```python
import ROOT as r
import numpy as np
import array as arr

h_height = r.TH1F("h_height", "Height", 140, 0, 1400)
heights = arr.array('d', ak.flatten(branches['height']).to_list())
h_height.FillN(len(heights), heights, np.ones(len(heights)))

c1 = r.TCanvas("c1", "c1", 500, 400)
c1.cd()
h_height.Draw()
c1.SaveAs("04_h_height_root.png")   # scp this back to view it
```
**Expected**: **1,236,354 entries** (= Stage 2's pulse count after `height >= 500`,
a good consistency check), mean **1106.6**, std **217.5**; same shape as the
matplotlib plot.

Point out: `r.gROOT.SetBatch(True)` for any drawing on the login node; histogram
names are ROOT-global (re-creating `"h_height"` replaces the old one with a warning).
The list/`array('d')` route above is slow at this size: filling straight from numpy
gives identical bin contents ~8x faster (0.06 s vs 0.47 s for 1.24M values):
```python
vals = ak.to_numpy(ak.flatten(branches['height'])).astype('float64')
h_height.FillN(len(vals), vals, np.ones(len(vals)))
```

A `cling::CIFactory::createCI()` error about stdlib include paths prints on every
`import ROOT` -- cosmetic, doesn't block histogramming (see
`milliqan-t3-working-area-setup`'s notes on the conda-forge ROOT build).

## Stage 5: Iterating over multiple files

```python
totalEvents = 0
for events in uproot.iterate(
        [path],
        ["area", "height", "npulses", "chan", "type"],
        cut="height>=0",
        library='ak',
        step_size=1000,
        num_workers=8):
    totalEvents += len(events)
print(totalEvents)   # 171341
```
Then show it genuinely on multiple files -- all 11 v36 beamOn skims, filling a
histogram inside the loop:
```python
import glob
import hist
files = {f: "t" for f in sorted(glob.glob(
    "/abyss/users/mjoyce/MilliQan_skims/beamOn/MilliQan_Run*_v36_beam_beamOn_medium.root"))}
h_nPE = hist.Hist.new.Reg(100, 0, 5000, name="nPE").Double()
totalEvents = 0
for events in uproot.iterate(files, ["nPE", "type", "runNumber"], step_size=1000):
    totalEvents += len(events)
    h_nPE.fill(ak.flatten(events["nPE"][events["type"] == 0]))   # bar pulses
print(totalEvents)   # 718531
```
**Expected**: single file 171,341 (~8 s); all files **718,531 events** in 11 files
(Run1000: 39,081, 1100: 24,932, 1400: 3,859, 1500: 171,341, 1600: 147,314,
1700: 222,807, 1800: 22,515, 1900: 69,519, 2000: **6**, 2100: 9,234, 2200: 7,923),
387 distinct `runNumber`s (1006-2291), 21.1M bar pulses, ~30 s and ~640 MB -- only
one batch is ever in memory. When plotting with `hist`'s `plot1d` on a log scale, pass
`yerr=False`, or empty bins get drawn as spurious error bars.

Point out `uproot.iterate` as the pattern for processing a file (or filelist) in
batches without loading everything into memory at once -- this is what the
`milliqanProcessor` framework in the next stage does internally.

## Stage 6: The milliqan framework basics

```python
import sys, os
sys.path.append(os.path.expanduser(
    "~/scratch0/MilliqanWorkstation/milliqanOffline/Run3Detector/analysis/utilities/"))
from milliqanProcessor import *
from milliqanScheduler import *
from milliqanCuts import *
from milliqanPlotter import *
from utilities import *
import ROOT as r
r.gROOT.SetBatch(True)   # no display on a headless login node

filelist = [path]
branches = ['event', 'tTrigger', 'boardsMatched', 'pickupFlag', 'fileNumber', 'runNumber',
            'type', 'ipulse', 'nPE', 'chan', 'time_module_calibrated',
            'timeFit_module_calibrated', 'row', 'column', 'layer', 'height', 'area',
            'npulses', 'sidebandRMS']

mycuts = milliqanCuts()
heightCut200 = getCutMod(mycuts.heightCut, mycuts, 'heightCut200', heightCut=500, cut=True)
fourLayerCut = getCutMod(mycuts.oneHitPerLayerCut, mycuts, 'fourLayerCut', cut=True, multipleHits=True)

myplotter = milliqanPlotter()
h_height = r.TH1F("h_height", "Height", 140, 0, 1400)
myplotter.addHistograms(h_height, 'height')

cutflow = [mycuts.totalEventCounter, mycuts.fullEventCounter, fourLayerCut, heightCut200,
           myplotter.dict['h_height']]
myschedule = milliQanScheduler(cutflow, mycuts, myplotter)
myschedule.printSchedule()

myiterator = milliqanProcessor(filelist, branches, myschedule, step_size=1000,
                                qualityLevel='override', max_events=10000)
myiterator.run()
mycuts.getCutflowCounts()
```
Explain the four pieces: `milliqanCuts` (defines/holds cut functions and their
counters), `milliqanPlotter` (owns histograms, tied to cut names), `milliqanScheduler`
(orders cuts+plots into a cutflow), `milliqanProcessor` (the uproot.iterate-based
event loop that actually runs it all).

**Expected** (confirmed): "Number of processed events 10000", but the cutflow table
shows

| Cut | Events | Pulses |
| --- | --- | --- |
| totalEventCounter | 9,000 | 336,447 |
| fourLayerCut | 5,059 (56.2%) | 235,725 |
| heightCut200 | 5,059 | 80,877 (34.3% of total) |

- **9,000, not 10,000, is a framework bug**, not an environment problem:
  `milliqanProcessor.run()` adds the batch to `total_events` and then checks
  `max_events` *before* running the cuts, so the batch that reaches `max_events` is
  read and discarded. It costs one whole `step_size` (with `step_size=20000,
  max_events=40000` only 20,000 events get processed). Runs without `max_events` are
  unaffected.
- Read the table in both columns: `fourLayerCut` removes events; `heightCut200`
  (misleadingly named -- it's configured with `heightCut=500`; the name is just a
  label) removes pulses only -- the Stage 2 lesson built into the framework.
- Framework gotcha for later: a cut function that stores a derived per-event
  quantity *before* applying its own `cut=True` leaves that quantity set on failing
  events, because `cutBranches` only filters the framework's branch list and empties
  failing events rather than dropping them -- compute plotted quantities after the
  cuts (as Stage 7's `timeDiffMaxArea` does).

## Stage 7: Beam muons vs. cosmics (beamOn vs. beamOff)

Apply the "Muon Selections" to the same beam skim taken with beam on and with beam
off, and compare the layer3 - layer0 time difference. Beam muons appear as a sharp
peak at ~0 ns that is absent in beam-off data; cosmics sit at ~ -16 ns.

**Data** (v36 `beam` skims -- the same skim selection on beam-on and beam-off runs;
Run1000-2200 blocks exist in both directories):
```text
/abyss/users/mjoyce/MilliQan_skims/beamOn/MilliQan_Run1500_v36_beam_beamOn_medium.root    (171,341 events)
/abyss/users/mjoyce/MilliQan_skims/beamOff/MilliQan_Run1500_v36_beam_beamOff_medium.root  (116,062 events)
```

**Muon Selections -> code** (all `cut=True`, in this order):

| Selection | Code | Level |
| --- | --- | --- |
| Digitizer boards synchronized | `boardsMatched` | Event |
| Pickup cut tight | `pickupCut(tight=True)` -- drops pulses with `pickupFlagTight` | Pulse |
| First pulse in channel | `firstPulseCut(calculate=True)` -- first *remaining* pulse per channel | Pulse |
| 1100 <= t_p <= 1400 | `centralTime` (code uses strict `1100 < t < 1400`) | Pulse |
| Pulse area > 300 x 10^3 pVs | `areaCut(areaCut=300e3, barsOnly=True)` -- drops small **bar** pulses only; panels/slabs untouched | Pulse |
| 4 layers hit | `oneHitPerLayerCut(multipleHits=True)` -- >= 1 remaining bar in each of layers 0-3 | Event |

No nPE cuts, no panel veto/requirement, no energy scaling or time-walk correction,
`qualityLevel='override'`.

**Time difference, one entry per event**: t(max-area bar in layer 3) - t(max-area bar
in layer 0), from `timeFit_module_calibrated`, computed *after* the cuts. This is
the stage's framework lesson: write your own quantity as a function decorated with
`@mqCut`, attach it with `setattr(milliqanCuts, ...)`, and put it in the cutflow like
any built-in cut; the histogram registered under that name gets filled from it. It is
deliberately not the notebook's `mycuts.timeDiff`, which uses `ak.cartesian` to fill
every L0 x L3 pulse pair, so it counts pulse pairs rather than events and gives
several correlated entries per event.

```python
import sys, os
sys.path.append(os.path.expanduser(
    "~/scratch0/MilliqanWorkstation/milliqanOffline/Run3Detector/analysis/utilities/"))
from milliqanProcessor import *
from milliqanScheduler import *
from milliqanCuts import *
from milliqanPlotter import *
from utilities import *
import ROOT as r
r.gROOT.SetBatch(True)
import awkward as ak

skims = "/abyss/users/mjoyce/MilliQan_skims"
files = {
    "beamOn": f"{skims}/beamOn/MilliQan_Run1500_v36_beam_beamOn_medium.root",
    "beamOff": f"{skims}/beamOff/MilliQan_Run1500_v36_beam_beamOff_medium.root",
}
branches = ['event', 'tTrigger', 'boardsMatched', 'pickupFlag', 'pickupFlagTight', 'fileNumber',
            'runNumber', 'type', 'ipulse', 'nPE', 'chan', 'time_module_calibrated',
            'timeFit_module_calibrated', 'row', 'column', 'layer', 'height', 'area', 'npulses',
            'sidebandRMS']

@mqCut
def timeDiffMaxArea(self, cutName='timeDiffMaxArea', branches=None):
    # run AFTER the cuts: failing events have no pulses left, so they give no entry
    t = self.events['timeFit_module_calibrated']
    tl = {}
    for L in (0, 3):
        m = (self.events['layer'] == L) & (self.events['type'] == 0)
        tl[L] = t[m][ak.argmax(self.events['area'][m], axis=1, keepdims=True)]
    self.events[cutName] = ak.drop_none(tl[3] - tl[0])
setattr(milliqanCuts, 'timeDiffMaxArea', timeDiffMaxArea)

hists = {}
for label, path in files.items():
    mycuts = milliqanCuts()
    boardMatchCut = getCutMod(mycuts.boardsMatched, mycuts, 'boardMatchCut', cut=True, branches=branches)
    pickupCut = getCutMod(mycuts.pickupCut, mycuts, 'pickupCutTight', cut=True, tight=True)
    firstPulseCut = getCutMod(mycuts.firstPulseCut, mycuts, 'firstPulseCut', cut=True, calculate=True)
    centralTimeCut = getCutMod(mycuts.centralTime, mycuts, 'centralTimeCut', cut=True)
    areaCut = getCutMod(mycuts.areaCut, mycuts, 'areaCut300k', areaCut=300e3, barsOnly=True, cut=True)
    fourLayers = getCutMod(mycuts.oneHitPerLayerCut, mycuts, 'fourLayersHit', cut=True, multipleHits=True)

    myplotter = milliqanPlotter()
    myplotter.dict.clear()
    h = r.TH1F(f"h_timeDiff_{label}", ";t_{3} - t_{0} [ns];events / 2 ns", 100, -100, 100)
    myplotter.addHistograms(h, 'timeDiffMaxArea')

    cutflow = [mycuts.totalEventCounter, mycuts.fullEventCounter,
               boardMatchCut, pickupCut, firstPulseCut, centralTimeCut, areaCut, fourLayers,
               mycuts.timeDiffMaxArea, myplotter.dict[f"h_timeDiff_{label}"]]
    myschedule = milliQanScheduler(cutflow, mycuts, myplotter)
    myschedule.printSchedule()
    milliqanProcessor([path], branches, myschedule, mycuts, myplotter, step_size=20000,
                      qualityLevel='override', goodRunsList=None).run()
    mycuts.getCutflowCounts()
    print(f"{label}: entries={h.GetEntries():.0f} mean={h.GetMean():.2f} std={h.GetStdDev():.2f}")
    hists[label] = h

out = r.TFile("07_beam_muons_vs_cosmics.root", "RECREATE")
for h in hists.values():
    h.Write()
out.Close()

r.gStyle.SetOptStat(0)
c = r.TCanvas("c", "c", 650, 500)
hOn, hOff = hists["beamOn"], hists["beamOff"]
hOn.SetLineColor(r.kBlue + 1); hOn.SetLineWidth(2)
hOff.SetLineColor(r.kRed + 1); hOff.SetLineWidth(2)
hOn.SetMaximum(1.25 * max(hOn.GetMaximum(), hOff.GetMaximum()))
hOn.SetTitle("v36 Run1500, muon selection (bar area > 300k)")
hOn.Draw("hist"); hOff.Draw("hist same")
leg = r.TLegend(0.12, 0.74, 0.62, 0.88); leg.SetBorderSize(0)
for label, h in [("beamOn", hOn), ("beamOff", hOff)]:
    leg.AddEntry(h, f"{label} ({h.GetEntries():.0f} events, mean {h.GetMean():.1f} ns)", "l")
leg.Draw()
c.SaveAs("07_beam_muons_vs_cosmics.png")
```

**Running it**: ~10 min and ~0.8 GB on the login node for the two files -- run it in
tmux. `tmux new -d -s <name> "<cmd>"` runs `<cmd>` under the login shell (tcsh), so a
bash redirect like `2>&1` inside it makes the session die immediately with no log;
put the command in a small bash script and run `tmux new -d -s <name> "bash
run_07.sh"` instead. Don't set `max_events` for a quick test without explaining it:
`milliqanProcessor` drops the final batch when `max_events` is reached (with
`step_size=20000`, `max_events=40000` processes only 20,000 events).

**Expected cutflow** (confirmed 2026-09-29):

| Cut | beamOn events (pulses) | beamOff events (pulses) |
| --- | --- | --- |
| total | 171,341 (6,201,037) | 116,062 (4,318,421) |
| boardMatchCut | 171,341 | 116,062 |
| pickupCutTight | 171,341 (6,101,800) | 116,062 (4,250,635) |
| firstPulseCut | 171,341 (2,937,194) | 116,062 (2,031,253) |
| centralTimeCut | 164,639 (2,648,953) | 111,334 (1,830,269) |
| areaCut300k | 130,418 (928,422) | 87,070 (619,160) |
| **fourLayersHit** | **7,234** (85,754) | **2,121** (35,260) |

Histograms: beamOn **7,234 entries, mean -6.28 ns, std 9.54 ns**; beamOff **2,121
entries, mean -15.56 ns, std 6.92 ns**. Raw counts: beamOn has a sharp peak of
~1,070 events/2 ns at 0 ns plus a cosmic shoulder of ~400/bin at ~ -18 ns; beamOff is
a single peak of ~285/bin at ~ -16 ns with essentially nothing at 0.

**What to point out**:
- The peak at 0 ns is the beam muons; the beamOn shoulder at ~ -18 ns is cosmics
  recorded during beam time, matching the beamOff shape.
- The 300k bar-area requirement is what makes the separation work: with 100k instead
  (the "(100)" option in the selection table) beamOn/beamOff are 32,542 / 19,701
  events with means -8.1 / -10.1 ns, and the peak at 0 is barely visible.
- Don't compare raw beamOn/beamOff counts as rates: the skims don't carry their
  live time (`getSkimLumis()` returns 0 for them), so beamOff can't yet be scaled to
  beamOn's run time. The plot compares shapes and locations, not rates.
- Why beam muons sit at ~0 rather than at a layer-to-layer flight time is not
  established -- plausibly `timeFit_module_calibrated` is aligned on beam muons.
  Flag it as an open question rather than stating a cause.

## Running the scripts on your own

What the user needs in order to rerun or modify their scripts without Claude. Give
them these as commands to type in their own terminal, not as something Claude runs:

```bash
# 1. log in (on the OSU VPN if off campus) -- use their ~/.ssh/config alias if they have one
ssh <username>@cms-t3.mps.ohio-state.edu

# 2. go to the saved scripts
cd ~/scratch0/MilliqanWorkstation/tutorial

# 3. run one -- see "Which python" below for why it's this long path, not `python3`
~/scratch0/MilliqanWorkstation/miniforge3/envs/milliqan/bin/python3 03_histograms.py
```

**Which python, and why it matters.** Typing plain `python3 03_histograms.py` on
`cms-t3` runs the *system* Python (3.6.8), which has no `uproot`/`awkward`/`hist`, so
every script dies immediately with `ModuleNotFoundError: No module named 'uproot'`.
The packages live in the `milliqan` conda environment that
`milliqan-t3-working-area-setup` installed, and that environment has its own Python
program at:
```text
~/scratch0/MilliqanWorkstation/miniforge3/envs/milliqan/bin/python3
```
Typing that path in place of `python3` runs the script with the right Python, with no
`conda activate` step -- which matters because `conda activate` isn't set up for
`cms-t3`'s default tcsh shell. Walk the user through it rather than just saying "use
the env's python":

1. **Show the difference once**, so the failure is recognizable later:
   ```bash
   python3 --version        # Python 3.6.8   <- system python, wrong one
   ~/scratch0/MilliqanWorkstation/miniforge3/envs/milliqan/bin/python3 --version
                            # Python 3.x from the env <- right one
   ```
2. **Set up a short name** so they never type the long path. Nearly everyone on
   `cms-t3` is in tcsh (check with `echo $0`; `-tcsh`/`tcsh` means tcsh). Offer to
   append this line to their tcsh startup file -- ask first, don't edit their
   dotfiles silently:
   ```tcsh
   alias mqpython ~/scratch0/MilliqanWorkstation/miniforge3/envs/milliqan/bin/python3
   ```
   **Which file**: tcsh reads `~/.tcshrc` if it exists and otherwise falls back to
   `~/.cshrc` -- never both. Check which exists (`ls -la ~/.tcshrc ~/.cshrc`) and
   append to that one. If only `~/.cshrc` exists (the case on at least one real
   account, confirmed 2026-09-30), do **not** create a `~/.tcshrc`: that would
   silently stop `~/.cshrc` -- and any aliases/PATH settings in it -- from loading.
   Create `~/.tcshrc` only if neither exists. Back the file up first
   (`cp ~/.cshrc ~/.cshrc.bak-<date>`), and verify in a fresh login with
   `ssh host "mqpython --version"`.
   Then `source` that file (or log out and back in). If they use bash instead, the
   line goes in `~/.bashrc` with bash syntax:
   `alias mqpython=~/scratch0/MilliqanWorkstation/miniforge3/envs/milliqan/bin/python3`.
3. **From then on**, running any tutorial script is just:
   ```bash
   cd ~/scratch0/MilliqanWorkstation/tutorial
   mqpython 03_histograms.py
   ```
   and `mqpython --version` is the quick check that the alias points at the env.

- **Poking around interactively**: add `-i` (`mqpython -i 02_branches_and_cuts.py`)
  to drop into a Python prompt with the script's variables still loaded -- the closest
  thing to the notebook experience on a headless login node. Plain `mqpython` with no
  file gives an empty prompt with the env's packages available.
- **Viewing plots**: scripts save PNGs next to themselves; copy them back from the
  user's own machine with
  `scp <username>@cms-t3.mps.ohio-state.edu:scratch0/MilliqanWorkstation/tutorial/*.png .`
  and open locally. There's no display on the login node, which is why every drawing
  script sets batch mode.
- **Long jobs (Stage 7, ~10 min)**: run inside tmux so a dropped connection doesn't kill
  it. Interactively, the simplest way is `tmux new -s tutorial`, run the command
  inside, detach with `Ctrl-b d`, and later `tmux attach -t tutorial` (`tmux ls` lists
  sessions). Remember tmux sessions live on that specific login node -- log back in to
  the same host to reattach.
- **Expected noise**: the `cling::CIFactory::createCI()` error on every `import ROOT` is
  cosmetic (see Stage 4); don't let them chase it.
- **Scaling up**: anything much bigger than a few files belongs on HTCondor, not the
  login node -- see the `condorProcessor.py` note below.

## Wrap-up

- Point them at `backgroundEstimation/`, `goodRunTools/`, `limits/` in
  `Run3Detector/analysis/` (see `milliqan/CLAUDE.md`'s layout table) as the
  production-scale versions of what they just did by hand.
- Their saved scripts in `~/scratch0/MilliqanWorkstation/tutorial/` are a working
  starting point to copy and adapt for their own analysis, not just a record of the
  session. Walk through "Running the scripts on your own" above and have them run one
  script themselves, from their own terminal, before ending.
- Mention `condorProcessor.py` as the shared helper for scaling any of this up to
  Condor batch jobs once they're past single-file exploration.
