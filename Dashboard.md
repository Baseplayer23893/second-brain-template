---
tags: [dashboard]
---

# 🧠 Brain Dashboard

> Your second brain at a glance.

## The Anson Protocol

![[The-Anson-Protocol]]

---

## Recent Wiki Updates

```dataview
TABLE file.mtime as "Updated"
FROM "05-Wiki"
WHERE file.name != "The-Anson-Protocol"
SORT file.mtime DESC
LIMIT 10
```

## Inbox Status

```dataview
TABLE date, file.size as "Size"
FROM "00-Inbox"
SORT date DESC
LIMIT 10
```

## Daily Streak

```dataview
TABLE date
FROM "06-Daily"
SORT date DESC
LIMIT 7
```

---

## Quick Actions

- [[The-Anson-Protocol]] — View your living profile
- Open Graph View (`Ctrl+G`) — Explore your knowledge network
- `brain process` — Process inbox from terminal
- `brain capture "note"` — Quick capture

---

*Last system update: 2026-05-03*

> **Note:** Dataview and Templater plugins must be installed for tables and templates to work. Run `./install.sh` — it handles the setup instructions.
