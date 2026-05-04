# second-brain-template

A terminal-first Obsidian vault with an AI agent that processes your notes into a wiki and keeps a running profile of who you are.

![demo](assets/demo.gif)

---

## The idea

Most second brain setups fail the same way. You capture everything, organize nothing, and review even less. After months of notes, you still have no clear picture of your own growth.

This template fixes that with one addition: a file called **The Anson Protocol** (rename it to yours). Every time the AI processes your inbox, it checks if anything is personal — new skill, new decision, new goal — and updates that file automatically with a timestamp and wikilinks. You never have to write about yourself. The system does it.

---

## Stack

| Layer | Tool |
|-------|------|
| Capture | `brain` CLI + Telegram bot |
| Storage | Obsidian + Markdown + Git |
| Processing | OpenCode + AGENTS.md |
| Profile | The Anson Protocol |
| Visualize | Obsidian Graph + Dataview |

---

## Setup

```bash
git clone https://github.com/Baseplayer23893/second-brain-template.git
cd second-brain-template
./install.sh
```

Open the installed folder as a vault in Obsidian. Install community plugins: **Dataview** and **Templater**.

---

## Commands

```bash
brain capture "note text"   # dump to inbox instantly
brain process               # AI processes inbox → wiki + protocol
brain ask "question"        # query your knowledge base
brain protocol              # view your living profile
brain sync                  # git commit and push
brain daily                 # open today's note
```

---

## How it works

```
capture → 00-Inbox/ → OpenCode (AGENTS.md) → 05-Wiki/
                                ↓
                        The Anson Protocol
```

The agent reads AGENTS.md for instructions. It extracts key ideas from each inbox note, creates or updates wiki pages, adds wikilinks, archives the raw note, and logs everything. If the note contains anything personal, it updates your Protocol file too.

---

## Folder structure

```
~/brain/
├── 00-Inbox/        # everything lands here
├── 01-Projects/     # things with deadlines
├── 02-Areas/        # ongoing, no end date
├── 03-Resources/    # reference material
├── 04-Archive/      # processed notes
├── 05-Wiki/         # main knowledge base
│   └── The-Anson-Protocol.md
├── 06-Daily/        # daily notes
├── 07-Agent-Logs/   # what the AI did each session
├── Templates/
├── AGENTS.md        # AI instructions
└── brain            # the CLI
```

---

## The Anson Protocol

Rename this file to yours. It's a YAML + Markdown file that the agent updates automatically:

```yaml
updated: YYYY-MM-DD
skills:
  tech: [Python, Obsidian, Linux]
goals:
  short: [current thing you're working toward]
  long: [where you want to be]
```

Below the YAML: a Timeline, Decisions, Patterns, and Future Questions section. All maintained by the agent, not by you.

---

## Mobile capture

There's a Telegram bot in `scripts/telegram-bridge.py` that dumps messages straight to your inbox. Run it on your desktop, message your bot from your phone, then `brain process` in the evening.

---

## Requirements

- Obsidian
- OpenCode
- Git
- Bash (Linux/macOS, or WSL on Windows)

---

## License

MIT
