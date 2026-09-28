import re
import sys

SPLIT = re.compile(r'(?<!\\)\|')


def cells(line):
    parts = SPLIT.split(line.rstrip('\n'))
    if parts and parts[0] == '':
        parts = parts[1:]
    if parts and parts[-1] == '':
        parts = parts[:-1]
    return [p.strip() for p in parts]


def parse_content(path):
    lines = open(path).read().split('\n')
    trees = {}
    detail = {}
    i = 0
    n = len(lines)
    while i < n:
        line = lines[i]
        m = re.match(r'^# (\w+) Content$', line)
        if m:
            tree = m.group(1)
            i += 1
            assert lines[i] == '', lines[i]
            i += 1
            assert lines[i].startswith('| Collection'), lines[i]
            i += 1
            assert lines[i].startswith('| -'), lines[i]
            i += 1
            rows = []
            while i < n and lines[i].startswith('|'):
                c = cells(lines[i])
                mm = re.match(r'\[\*\*(.+?)\*\*\]\(#(.+?)\)', c[0])
                rows.append((mm.group(1), mm.group(2), c[1]))
                i += 1
            trees[tree] = rows
            continue
        m = re.match(r'^# (\w+) detail$', line)
        if m:
            tree = m.group(1)
            i += 1
            anchor_order = []
            branch_map = {}
            while i < n and not re.match(r'^# ', lines[i]):
                m2 = re.match(r"^### <a id='(.+?)'>", lines[i])
                if m2:
                    anchor = m2.group(1)
                    anchor_order.append(anchor)
                    i += 1
                    assert lines[i].startswith('| Object property'), lines[i]
                    i += 1
                    assert lines[i].startswith('| -'), lines[i]
                    i += 1
                    props = []
                    while i < n and lines[i].startswith('|'):
                        c = cells(lines[i])
                        props.append((c[0].strip('*'), c[1].strip(), c[2]))
                        i += 1
                    branch_map[anchor] = props
                else:
                    i += 1
            detail[tree] = (anchor_order, branch_map)
            continue
        i += 1
    return trees, detail


def parse_size(path, tree_order):
    lines = open(path).read().split('\n')
    n = len(lines)
    i = 0
    header_line = lines[0]
    while lines[i] != '# Collection data':
        i += 1
    i += 1
    assert lines[i].startswith('| collection'), lines[i]
    i += 1
    assert lines[i].startswith('| -'), lines[i]
    i += 1
    coll_rows = {}
    tree_idx = 0
    cur = {}
    while i < n and (lines[i].startswith('|') or lines[i].startswith('**')):
        line = lines[i]
        if line.startswith('**All '):
            coll_rows[tree_order[tree_idx]] = cur
            tree_idx += 1
            cur = {}
            i += 1
            continue
        c = cells(line)
        mm = re.match(r'\[\*\*(.+?)\*\*\]\(#(.+?)\)', c[0])
        if not mm:
            # bold summary rows: **Non per-event data or overhead**, **Overhead**, **File size**
            i += 1
            continue
        anchor = mm.group(2)
        cur[anchor] = tuple(x.strip() for x in c[1:])
        i += 1

    detail = {}
    while i < n:
        m = re.match(r'^# (\w+) detail$', lines[i])
        if m:
            tree = m.group(1)
            i += 1
            branch_map = {}
            while i < n and not re.match(r'^# ', lines[i]):
                m2 = re.match(r"^## <a id='(.+?)'>", lines[i])
                if m2:
                    anchor = m2.group(1)
                    i += 1
                    assert lines[i].startswith('| branch'), lines[i]
                    i += 1
                    assert lines[i].startswith('| -'), lines[i]
                    i += 1
                    props = []
                    while i < n and lines[i].startswith('|'):
                        c = cells(lines[i])
                        name = re.match(r'<b>(.+?)</b>', c[0]).group(1)
                        props.append((name, c[1], c[2], c[3], c[4]))
                        i += 1
                    branch_map[anchor] = props
                else:
                    i += 1
            detail[tree] = branch_map
            continue
        i += 1
    return header_line, coll_rows, detail


def merge(content_path, size_path, out_path):
    trees, cdetail = parse_content(content_path)
    header_line, coll_rows, sdetail = parse_size(size_path, list(trees.keys()))

    out = [header_line, '']
    for tree in trees:
        c_rows = trees[tree]
        s_rows = coll_rows[tree]
        out.append(f'# {tree} Content')
        out.append('')
        out.append('| Collection | Description | kb/evt | % of tree |')
        out.append('| - | - | - | - |')
        for name, anchor, desc in c_rows:
            s = s_rows.get(anchor)
            kb_evt = s[3] if s else ''
            pct = s[5] if s else ''
            out.append(f'| **{name}** | {desc} | {kb_evt}| {pct}|')
        out.append('')
        out.append(f'# {tree} detail')
        out.append('')
        anchor_order, branch_map = cdetail[tree]
        s_branch_map = sdetail.get(tree, {})
        for anchor in anchor_order:
            display_name = next(name for name, a, _ in c_rows if a == anchor)
            out.append(f'### {display_name}')
            out.append('| Object property | Type | Description | b/event | b/item | % |')
            out.append('| - | - | - | - | - | - |')
            size_props = {p[0]: p for p in s_branch_map.get(anchor, [])}
            for prop, ptype, pdesc in branch_map[anchor]:
                sp = size_props.get(prop)  # (name, kind, b_event, b_item, pct)
                b_evt = sp[2] if sp else ''
                b_item = sp[3] if sp else ''
                pct = sp[4] if sp else ''
                out.append(f'| **{prop}** | {ptype}| {pdesc} | {b_evt}| {b_item}| {pct}|')
            out.append('')

    with open(out_path, 'w') as f:
        f.write('\n'.join(out) + '\n')


if __name__ == '__main__':
    content_path, size_path, out_path = sys.argv[1:4]
    merge(content_path, size_path, out_path)
