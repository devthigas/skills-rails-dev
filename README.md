# Claude Rails Developer Kit

A modular, role-based AI coding environment designed for building modern **Ruby on Rails (8.0+)** applications using **Claude Code**.

This repository transforms a generic AI coding assistant into a specialized **Rails Engineering Team** that lives in your terminal.

---

## 🌟 Features

*   **Autonomous Team:** The Orchestrator (`/dev`) can dynamically adopt roles (Architect, Developer, Auditor) to solve complex tasks end-to-end.
*   **Native Integration:** Uses Claude's native Slash Commands (`/arch`, `/code`) for seamless interaction.
*   **Modern Stack:** Rails 8.0, Hotwire, Inertia.js, GraphQL, Solid Queue/Cache, Kamal.
*   **Quality First:** Strict TDD workflows, Security Audits (Brakeman), and "Definition of Done".
*   **Production Ready:** Built-in support for i18n, Feature Flags, and MCP tools (AppSignal, GitHub).

---

## 🤖 The Team (Slash Commands)

| Command | Role | Triggers |
| :--- | :--- | :--- |
| **`/dev`** | **Orchestrator** | *Start Here.* Smartly routes tasks and adopts personas. |
| **`/prod`** | **Product Manager** | Strategy, WSJF, A/B Testing, Analytics. |
| **`/arch`** | **Rails Architect** | System design, Schema planning, Stack selection. |
| **`/code`** | **Rails Developer** | Implementation, TDD, Refactoring. |
| **`/audit`** | **Rails Auditor** | QA, Security, Code Review. |
| **`/design`**| **UI/UX Designer** | Tailwind, Accessibility, UX Flows. |
| **`/ai`** | **AI Specialist** | LLM Integration, RAG, MCP Servers. |
| **`/i18n`** | **i18n Specialist** | Globalization, Timezones. |
| **`/ops`** | **DevOps Engineer** | Kamal, Docker, CI/CD. |
| **`/writer`**| **Tech Writer** | Documentation, Releases, Licenses. |

---

## 🚀 Installation

### One-Line Install
Run this command to install the kit and configure slash commands:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/alec-c4/claude-rails-dev/master/scripts/install.sh)"
```

### Manual Install
1.  Clone the repository: `git clone ... ~/.claude/repo`
2.  Run: `~/.claude/repo/scripts/install.sh`

---

## 💡 Usage

### 0. Bootstrap
Enter your project root and run:
```bash
claude-init
```

### 1. Autonomous Mode (Recommended)
Just talk to the Orchestrator. It will figure out which specialist is needed.

**User:**
> `/dev I need a blog system where users can comment on posts.`

**Orchestrator:**
> "I see. I will activate the **Architect** to plan this feature first."
> *(Reads `agents/rails-architect.md`)*
> "Here is the Implementation Plan..."

### 2. Manual Specialist Mode
If you know exactly who you need, summon them directly.

**User:**
> `/audit Check my last commit for security issues.`

---

## 🔌 Recommended MCP Servers

To unlock "X-Ray Vision" for your agents, install these servers:

1.  **Rails MCP:** `gem install rails-mcp-server`
2.  **AppSignal:** `docker run ... appsignal/mcp-server`
3.  **GitHub:** `npx -y @modelcontextprotocol/server-github`

---

## 🛡 License
MIT License.
