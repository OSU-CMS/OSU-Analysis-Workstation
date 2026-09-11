---
name: lpc-eos
description: Working with EOS storage specifically on the FNAL LPC (not any other site or grid environment) -- listing, finding, and copying files under a personal or analysis EOS directory, and reading EOS files from ROOT/uproot/python code. Use whenever a task touches EOS, /store/..., cmseos, xrdcp, xrootd, or the LPC personal storage space.
---

# EOS on the FNAL LPC

## Hard rule: never use direct filesystem paths

Never access EOS through `/eos/uscms/...` directly -- not with `ls`, `glob`, `open()`,
`ROOT.TFile`, `uproot`, or anything else -- even though it happens to be mounted and
"works" on LPC login nodes. This is an explicit FNAL LPC admin policy, not a style
preference. Always go through the xrootd redirector `root://cmseos.fnal.gov/`.

| Don't | Do |
|---|---|
| `ls /eos/uscms/store/user/<username>/...` | `eos root://cmseos.fnal.gov/ ls /store/user/<username>/...` |
| `open("/eos/uscms/store/...")` | `uproot.open("root://cmseos.fnal.gov//store/...")` |
| `glob.glob("/eos/uscms/store/.../*.root")` | `eos root://cmseos.fnal.gov/ find /store/.../` |

Note the path itself always starts with `/store/...` (no `/eos/uscms` prefix) -- the
redirector already points at the right namespace.

## Where things live

- Personal EOS space: `/store/user/<lpc-username>` -- the LPC username is
  machine/person-specific; check `CLAUDE.local.md` for this machine's value.
- Any analysis-specific EOS subdirectory (e.g. a shared supplements directory)
  belongs in that analysis's own `CLAUDE.md`, not here.

## Running EOS commands

`eos` and `xrdcp` are LPC-side tools -- run them over SSH on the LPC host alias
configured for this project (see the root `CLAUDE.md`), not locally.

```bash
ssh <lpc-host-alias> "eos root://cmseos.fnal.gov/ ls /store/user/<username>/<path>"
```

### Listing / finding

```bash
# list a directory
eos root://cmseos.fnal.gov/ ls -l /store/user/<username>/<path>

# recursive find (use instead of a broad local search over a mount)
eos root://cmseos.fnal.gov/ find /store/user/<username>/<path>

# file/directory metadata
eos root://cmseos.fnal.gov/ stat /store/user/<username>/<path>/<name>
```

### Copying files

```bash
# EOS -> local
xrdcp root://cmseos.fnal.gov//store/user/<username>/<path>/<file> ./<file>

# local -> EOS
xrdcp ./<file> root://cmseos.fnal.gov//store/user/<username>/<path>/<file>
```

If a copy or write fails with a permission/auth error, the operation may need the grid
certificate proxy set explicitly (see the root or analysis `CLAUDE.md`'s mount/proxy
conventions):

```bash
ssh <lpc-host-alias> "X509_USER_PROXY=<grid-proxy-path> xrdcp ..."
```

### Deleting and moving/renaming

```bash
# delete a file or directory (recursively)
eos root://cmseos.fnal.gov/ rm -r /store/user/<username>/<path>

# move/rename a file or directory within EOS
eos root://cmseos.fnal.gov/ mv /store/user/<username>/<src> /store/user/<username>/<dst>
```

These are destructive/hard-to-reverse -- confirm the exact path list with the user before
running `rm -r`, and check the destination doesn't already hold something unrelated before
`mv`.

### Reading EOS files from code (ROOT / uproot / coffea / PocketCoffea)

Pass the full redirector URL as the file path -- these libraries open xrootd URLs
natively, no local copy needed:

```python
import uproot
f = uproot.open("root://cmseos.fnal.gov//store/user/<username>/<path>/<file>.root")
```

```cpp
TFile *f = TFile::Open("root://cmseos.fnal.gov//store/user/<username>/<path>/<file>.root");
```

This applies to CRAB/PocketCoffea job outputs, keytree files, and any other `/store/...`
path -- always construct the path with the `root://cmseos.fnal.gov/` prefix, in both
production code and one-off checks.
