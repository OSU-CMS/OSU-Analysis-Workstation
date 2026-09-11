---
name: python-style
description: Cleaning up Python import organization and blank-line/whitespace style per PEP 8 -- grouping imports into standard-library/third-party/local blocks with correct spacing, and fixing blank lines around top-level defs, classes, and methods. General Python style skill, not tied to any one project. Use whenever a task touches import order, a messy/unorganized imports block, "organize imports", or PEP 8 whitespace and blank-line style.
---

# Python Style: Imports & Blank Lines

A focused subset of PEP 8. Covers two things: import organization, and blank
lines. Do not expand scope to other PEP 8 rules (naming, line length,
comparisons, etc.) unless the user asks.

## Prefer existing tooling first

If the project already uses `isort` and/or `black`/`autopep8` (check for
config in `pyproject.toml`, `setup.cfg`, `.isort.cfg`, or that the packages
are installed), run those instead of hand-editing:

```bash
isort <file_or_dir>
black <file_or_dir>       # or: autopep8 --in-place --aggressive <file>
```

Only fall back to manual edits below if no such tooling is available, or the
user wants the changes made by hand.

## Import organization

PEP 8: imports go at the top of the file, right after the module
docstring/comments, before any module-level globals or constants.

Group imports into three blocks, in this order, separated by exactly one
blank line between groups:

1. **Standard library** -- e.g. `os`, `sys`, `json`, `pathlib`, `collections`
2. **Related third-party** -- anything installed from PyPI/conda, not part of
   the project itself
3. **Local application / first-party** -- modules from the same project
   (relative imports, or absolute imports of the project's own packages)

Within each group:
- Sort alphabetically (case-insensitive), `import x` lines before
  `from x import y` lines is not required by PEP 8 itself but is a common,
  reasonable convention -- follow whatever the file already does if it's
  consistent; otherwise default to alphabetical by module name regardless of
  `import`/`from` form.
- One module per `import` statement (`import os, sys` -> two lines). This
  restriction does not apply to `from x import a, b, c`.
- No wildcard imports (`from module import *`) -- flag these to the user
  rather than silently rewriting, since removing them may require knowing
  which names are actually used.

### Things to preserve, not reorder away

- **Conditional / fallback imports** (`try: import ujson as json except
  ImportError: import json`) -- keep the block intact in place; don't
  scatter its lines into the alphabetical order.
- **Order-sensitive imports** -- rare, but some modules have side effects on
  import (e.g. matplotlib backend selection, monkeypatching, warnings
  filters). If reordering could plausibly change behavior, flag it instead
  of silently moving it.
- **`# noqa` / `# isort:skip` comments** on an import line -- keep the
  comment attached to its line.
- Comments that clearly label a group (`# stdlib`, `# third-party`) can be
  dropped once the blank-line grouping makes them redundant, but leave a
  comment explaining *why* a specific import is where it is (e.g. `# must
  import before numpy`).

## Blank lines

- **Two** blank lines before and after every top-level function or class
  definition.
- **One** blank line between method definitions inside a class.
- No trailing whitespace on otherwise-blank lines.
- No blank lines at the very start of a file or a block (e.g. right after a
  `class Foo:` or `def bar():` line) -- delete leading blank lines inside a
  new scope; PEP 8 permits a single blank line there but omitting it is more
  common and preferred here.
- File ends with exactly one trailing newline, no extra blank lines at
  end-of-file.
- Blank lines used sparingly *within* a function to separate logical
  sections are fine and should be left alone -- don't collapse intentional
  spacing that isn't part of the def/class rules above.

## Workflow

1. Read the target file(s).
2. Identify the import block and classify each import as stdlib /
   third-party / local. Standard library membership can be checked with
   `python3 -c "import sys; print(sys.stdlib_module_names)"` if uncertain
   about a name.
3. Rewrite the import block with the three groups in order, one blank line
   between groups, preserving any conditional-import blocks and comments per
   the rules above.
4. Scan the rest of the file for blank-line violations around top-level
   defs/classes and methods, and fix them.
5. Show the user a diff-style summary of what changed before or as you make
   the edit -- don't silently rewrite large files without the user seeing
   what moved.
