---
name: disapptrks-analysis-note
description: Update the disappearing-tracks analysis note (CMS AN-24-155) in its Overleaf git clone at disappearing_tracks/analysis_note/ -- syncing with co-authors' Overleaf edits, putting new results (tables, figures, method text) in the right section with their provenance, building and visually checking the PDF locally, adding the changelog entry, committing, and pushing to Overleaf only when asked. Use whenever a task touches the AN, the analysis note, AN-24-155, Overleaf, or "put this in the note". Do not use this to produce the numbers themselves (see the disapptrks-* physics skills) or for slides (disapptrks-slides).
---

# Updating the Analysis Note (AN-24-155) on Overleaf

`disappearing_tracks/analysis_note/` is a git clone of the Overleaf project, and its
only remote is Overleaf. It's gitignored in the workspace repo, so commit inside it and
never in the parent repo. **There is one branch, `main`, and a push goes live for every
co-author at once.** There's no review step between your push and their editor.

**This skill never produces a number.** Every value in the note comes from a real output
file (EOS table, LPC JSON, limits directory) or from the user. If it doesn't exist yet,
the text says the item is in progress instead of inventing a value. Where each section's
numbers come from: [references/sources.md](references/sources.md).

## 0. Setup (once per machine, done by the user)

On Overleaf: Menu -> Integrations -> Git, generate a token, then
`git clone https://git@git.overleaf.com/<project-id> disappearing_tracks/analysis_note`
with the token as the password. macOS keeps it in `osxkeychain`. Claude never asks for
or handles the token. If a fetch prompts for credentials, stop and ask the user.

## 1. Sync before touching anything

```bash
cd disappearing_tracks/analysis_note
git status --short            # uncommitted local work? ask before discarding
git fetch -q && git log --oneline HEAD..origin/main
```

If co-authors pushed from Overleaf, `git pull --rebase` before editing. Overleaf's
commits all say "Update on Overleaf." and can touch any file, so read the diff of any
file you're about to edit. Fetch again right before pushing.

## 2. Scope the change with the user

- **Only the requested edit** (standing feedback): if you notice other stale text, list
  it as a suggestion and don't fix it unasked. Removing a section or appendix, changing
  scope (e.g. which run periods the note covers), or changing a method description
  needs the user's go-ahead.
- **Provenance flags must reach the text.** If the inputs predate a known fix (check
  memory, e.g. the jet ID fix `cfc31f0`, which all `dedx_puppi_v1` and earlier outputs
  predate), or are statistical-only or a placeholder, say so in the caption or text and
  in the changelog. Don't present them as final.
- **Methods follow Run 2** (EXO-19-010) unless memory records an exception. Describe
  what the code actually does, and check the code if the existing AN text and the code
  might disagree. Several old sentences described Run 2 or dissertation-era behavior.
- **Don't overwrite a co-author's newer content** because a skill or memory says
  something different. Raise the conflict.

## 3. Where things go

| Item | Location |
| --- | --- |
| Main file / build wrapper | `AN-24-155.tex` (inputs every section) / `AN-24-155_temp.tex` (what gets compiled) |
| Sections | `samples.tex`, `triggers.tex`, `eventSelection.tex`, `backgroundEstimation.tex`, `correctionsToTheSignal.tex`, `systematicUncertainties.tex`, `results.tex`, appendices (`algorithmsForMissingHitsCorrections.tex`, `triggerEfficiencies.tex`, `fullFakeTrackProbabilities.tex`) |
| Run 3 figures | `Run3_figures/Run3_<section>/` (`Run3_eventSelection`, `Run3_triggers`, `Run3_backgroundEstimation`, `Run3_systematicUncertainties`, `Run3_results`, ...) |
| Tables | `tables/<name>.tex`, pulled in with `\input` inside a `table` float that holds the caption and `\label` |
| Legacy Run 2 figures | `figures/` (mostly referenced only from commented-out blocks; leave them) |
| Change log | `changelog.tex`: one `\item` per change under the current version's `\subsection*` |

Conventions in this note:
- Period names in text: `2022 CD, 2022 EFG, 2023 C, 2023 D, 2024, 2025, 2026`. In file
  names: `2022CD`, `2022EFG`, ... For 2024–26 add the 2023BPix-simulation /
  target-year-pileup footnote (†) wherever simulation enters, plus ‡ "2025 pileup
  profile used" for 2026.
- **Generate tables from the source JSON** with a short script rather than retyping
  numbers. Give uncertainties where the source has them.
- Use macros from `commands.tex`/`pdefs.tex` (`\metNoMu`, `\Wtolnu`, `\nlayers`,
  `\Poffline`, `\intlumiRunIII`, ...). Cite from `AN-24-155.bib`, where
  `CMS:2020atg` = EXO-19-010.
- Leave commented-out Run 2 blocks (`%`, `\iffalse`) alone unless asked.
- **Removing a figure:** first `grep -rn <basename> --include='*.tex' .` to confirm
  nothing else uses the file; `git rm` it only if it's being replaced or the user
  asked. Note that macOS is case-insensitive, and two files differing only in case
  showed up as a permanent modification.
- Wide tables go in `\resizebox{\textwidth}{!}{...}` or `adjustbox`. For two-panel
  plots (e.g. middle+outer hits), use one per row at `0.85\textwidth`. Two side by side
  at `0.49` were unreadable. Put `\clearpage` at the end of a figure-heavy subsection
  so its floats don't drift into the next one.
- When you rename a `\label`, grep for every `\ref` to the old one in all files,
  including `changelog.tex` and other sections.

## 4. Getting figures and inputs from the LPC

Use the `lpc-remote-session` / `lpc-eos` skills. Practicalities seen in this note's
updates:
- Connect as `ssh mjoyce@cmslpc-el9.fnal.gov` (full hostname, matching the user's
  `Host cmslpc*.fnal.gov` block). If the sandbox reads the wrong Kerberos cache, use
  `export KRB5CCNAME=FILE:/tmp/krb5cc_$(id -u)` locally.
- Copy several files with `ssh host "cd <dir> && tar cf - <files>" | tar xf - -C <scratch>`.
  `scp` with brace globs fails on the remote side.
- EOS only through `root://cmseos.fnal.gov/` (`xrdcp`), never `/eos/uscms`.
- Stage downloads in the session scratchpad, then copy into `Run3_figures/...` under
  AN-style names (camelCase plus period suffix, e.g. `missingHitsCorrected_2023D.pdf`).
  Prefer PDF over PNG.
- Check plot labels before including a plot: `pdftotext f.pdf - | grep -o '[0-9.]* fb'`
  should match the luminosities in the note (see sources.md). Flag mismatches or missing
  labels to the user rather than silently including them.

## 5. Build and check

```bash
cd disappearing_tracks/analysis_note
export PATH=/Library/TeX/texbin:$PATH          # latexmk is not on the default PATH
OUT=<scratchpad>/an_build; mkdir -p $OUT
BIBINPUTS=.: latexmk -pdf -interaction=nonstopmode -outdir=$OUT AN-24-155_temp.tex > $OUT/build.log 2>&1
grep -c '^!' $OUT/AN-24-155_temp.log                       # errors: must be 0
grep "Reference .* undefined" $OUT/AN-24-155_temp.log | sort -u   # must be empty
grep 'newlabel{<your label>' $OUT/AN-24-155_temp.aux       # page/number of new floats
```

- Build into the scratchpad. Never leave `.aux`/`.log`/`.pdf` in the clone, because they'd
  be pushed to Overleaf.
- Undefined *citations* (`[?]`) in this local build are normal: the bibliography
  doesn't resolve here, but Overleaf resolves it. Just confirm any new key exists in
  `AN-24-155.bib`.
- **Look at the pages you changed:** `/opt/homebrew/bin/pdftoppm -r 70 -png -f <p> -l <p> $OUT/AN-24-155_temp.pdf $OUT/pg`
  then Read the PNGs. Check figure readability, float placement, and table width. PDF
  page numbers run about 2 ahead of the printed ones.

## 6. Changelog, commit, push

- Add an `\item` to the current version in `changelog.tex` that names what changed with
  `\ref`s, plus any provenance caveat (e.g. "these fits also predate the jet ID fix").
- Commit in the clone with a descriptive message ending in the attribution line
  required by the session (currently `Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>`).
  For multi-line messages use `git commit -F -` with a heredoc.
- **Push only when the user says to.** Before pushing, `git fetch` and confirm
  `HEAD..origin/main` is empty (rebase if not), then `git push origin main` and report
  the range (`old..new`). Afterwards ask the user to recompile in Overleaf and check the
  changed pages, since you can't see Overleaf's render.

## 7. Report back

Say which sections, tables, and figures changed, and where the numbers came from. List
what is still stale or in progress, with any label or plot issues you found, and
whether the change is pushed or only committed locally.
