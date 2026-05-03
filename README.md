# 🧠 Second Brain Template

> A terminal-first, AI-powered Obsidian vault that maintains a **living profile of who you are**.

![demo](assets/demo.gif)

## The Problem

You capture 100 notes a month. You organize 90. You review 3.

Your second brain becomes a graveyard.

And you still don't have a clear picture of **your own growth**.

## The Solution

This template gives you:

- **Terminal capture** from anywhere (`brain "note"`)
- **AI processing** with OpenCode — structured wiki, auto-linked
- **The Anson Protocol** — a self-updating profile that grows as you do
- **Obsidian graph** — beautiful, navigable knowledge network
- **Git backup** — everything is local, versioned, and yours

## 30-Second Setup

```bash
git clone https://github.com/YOUR_USERNAME/second-brain-template.git
cd second-brain-template
./install.sh
```

Then open the folder in Obsidian. Done.

---

## How It Works

```
┌─────────────┐    ┌──────────┐    ┌─────────────┐    ┌──────────────┐
│  Capture    │───▶│  Inbox   │───▶│  OpenCode   │───▶│    Wiki      │
│ (terminal)  │    │(00-Inbox)│    │ (AGENTS.md) │    │ (05-Wiki/)   │
└─────────────┘    └──────────┘    └──────┬──────┘    └──────────────┘
                                          │
                                          ▼
                                   ┌──────────────┐
                                   │ The Anson    │
                                   │ Protocol     │
                                   │(living       │
                                   │ profile)     │
                                   └──────────────┘
```

---

## The Stack

| Layer | Tool | Why |
|-------|------|-----|
| **Capture** | `brain` CLI + Telegram bot | Terminal-first, mobile-friendly |
| **Storage** | Obsidian + Markdown + Git | Local-first, future-proof |
| **Processing** | OpenCode + AGENTS.md | Context-aware, versioned agents |
| **Profile** | The Anson Protocol | Auto-updating self-knowledge |
| **Visualize** | Obsidian Graph + Dataview | Beautiful, interactive |

---

## Commands

| Command | What It Does |
|---------|-------------|
| `brain capture "text"` | Dump note to inbox instantly |
| `brain process` | AI processes inbox → wiki + protocol |
| `brain ask "question"` | Query your entire knowledge base |
| `brain protocol` | View your living profile |
| `brain sync` | Git commit and push |
| `brain daily` | Open today's note |

---

## The Anson Protocol

A living YAML + Markdown profile that auto-updates as you learn:

```yaml
skills:
  tech: [Python, Obsidian, Linux]
  other: [Photography, Writing]
goals:
  short: [Finish current project, Learn X]
  long: [Remote job, Build something people use]
```

Every time you process notes, the AI checks for personal updates and appends them with timestamps and wikilinks. **You never have to write about yourself — the system does it for you.**

---

## Folder Structure

```
~/brain/
├── 00-Inbox/           ← dump zone (brain capture goes here)
├── 01-Projects/        ← things with deadlines
├── 02-Areas/           ← ongoing areas of your life
├── 03-Resources/       ← reference material
├── 04-Archive/         ← processed notes
├── 05-Wiki/            ← MAIN KNOWLEDGE BASE
│   └── The-Anson-Protocol.md  ← YOUR living profile
├── 06-Daily/           ← daily notes
├── 07-Agent-Logs/      ← AI session logs
├── Templates/          ← note blueprints
├── AGENTS.md           ← AI instructions
└── brain               ← terminal command
```

---

## What's Included

- ✅ Pre-configured Obsidian settings
- ✅ 7-folder PARA-inspired structure
- ✅ `brain` terminal command
- ✅ AGENTS.md (production-ready AI instructions)
- ✅ Note templates (Wiki, Daily, Project)
- ✅ Dashboard with Dataview queries
- ✅ The Anson Protocol template
- ✅ Telegram bot for mobile capture
- ✅ Auto-git backup setup

## Why Not Just Obsidian?

| Feature | Plain Obsidian | This Template |
|---------|---------------|---------------|
| Terminal capture | ❌ | ✅ |
| Auto-linking | Manual | AI-powered |
| Living profile | ❌ | ✅ (Protocol) |
| Agent instructions | ❌ | ✅ (AGENTS.md) |
| Mobile → desktop flow | ❌ | ✅ (Telegram) |

---

## Requirements

- [Obsidian](https://obsidian.md) (free)
- [OpenCode](https://opencode.ai) (free tier available)
- Git
- Bash / Linux / macOS (Windows: use WSL)

---

## Contributing

This is a template — fork it, customize your Protocol, and make it yours. PRs welcome for new templates and improvements.

## License

MIT — do whatever you want.

---

*Built by a 17-year-old who thinks folder structures shouldn't require a PhD.*
