---
name: notion-notes
description: Reading and writing to the user's personal Notion workspace via the Notion MCP server -- daily/weekly work notes and the Task List database. Use whenever a task touches Notion, weekly notes, daily notes, or the Task List.
---

# Notion Notes

## Overview

This skill covers reading and writing to the user's personal Notion workspace via the
Notion MCP server -- daily/weekly work notes and a task-tracking database. Use it
whenever asked to read, write, log, or add notes to Notion, add a subpage under a day's
notes, or add/update a task in the Task List.

## Verifying access

Before doing anything else, confirm the Notion MCP server is connected: call
`notion-fetch` with `id: "self"`. A successful result returns the workspace name and
user identity. If it errors or the tool isn't available, tell the user the Notion MCP
server isn't active rather than guessing at page structure.

## Workspace structure

The workspace has two areas this skill cares about:

- **Weekly Notes** (root page: `https://app.notion.com/p/3103040d408280718f52edc89f05bc86`)
  -- contains one child page per week, named `M/D/YYYY-M/D/YYYY` (Sunday through
  Saturday, no leading zeros). Each week page contains up to 7 day pages, titled
  `Sunday`, `Monday`, ... `Saturday`.
- **General** (root page: `https://app.notion.com/p/3123040d408280f890a5e417ab8a33bc`)
  -- contains the **Task List** database
  (`https://app.notion.com/p/37c3040d408280b89541f96ca0ff78fd`, data source
  `collection://37c3040d-4082-8017-bdc0-000b1ddf1d31`), where individual tasks are
  tracked.

These page/data-source IDs are stable (Notion IDs don't change on rename or edit) --
hardcode them rather than re-searching each time. Fall back to `notion-search` only if
a fetch against one of these IDs fails.

## Finding this week / today's page

To find "today's" page:

1. Get the current date (from the environment's `currentDate` context).
2. Compute the Sunday-Saturday week window containing it, formatted `M/D/YYYY-M/D/YYYY`
   (matching existing titles like `6/28/2026-7/4/2026`).
3. Fetch the Weekly Notes root page to list its children, and find the week page with
   that title. If it doesn't exist yet, create it as a child of Weekly Notes.
4. Within the week page, find the child page matching today's weekday name. If it
   doesn't exist, create it.

For "find last Tuesday" style requests, apply the same logic with the adjusted date
instead of today.

## Writing to a day's notes

Default to creating new content rather than editing what's already there:

- The default action for "add notes about X" is to create a new subpage under today's
  (or the specified day's) page via `notion-create-pages`, with
  `parent: {"type": "page_id", "page_id": <day page id>}`.
- Only modify an existing page's content in place (`notion-update-page` with
  `update_content`/`insert_content`) if the user explicitly asks to add to or edit that
  specific page.
- Still fetch the day page first to confirm it exists and to place the new subpage
  sensibly, but treat its existing content as read-only by default.

## Adding a task to the Task List

To add a task, create a new page via `notion-create-pages` with
`parent: {"type": "data_source_id", "data_source_id": "37c3040d-4082-8017-bdc0-000b1ddf1d31"}`.
Set properties:

- `Name` (title) -- required
- `Category` (select) -- one of: `Custom NanoAOD`, `Analysis Framework`,
  `Investigation`, `PocketCoffea`, `Claude`, `Other`, `Supplements`
- `Status` (select) -- one of: `Not Started`, `In Progress`, `Done`, `Obsolete`;
  default to `Not Started` if not specified
- `Description` (text) -- optional, a short summary of the task

Task pages are typically left content-blank (properties only) unless the user wants
details written into the page body too.

## Formatting conventions

Match the style already used in the notes:

- Section headings are single `#` (e.g. `# Goals`, `# Notes`), not `##`.
- Goals/notes are plain `-` bullets; sub-bullets are tab-indented.
- Structured data (e.g. job status tables) uses Notion's native table format, not
  markdown pipes.
- Before writing a table or other non-trivial structure for the first time in a
  session, read the `notion://docs/enhanced-markdown-spec` resource via `notion-fetch`
  rather than guessing at syntax.
