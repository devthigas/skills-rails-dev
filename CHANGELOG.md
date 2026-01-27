# Changelog

All notable changes to the **Claude Rails Developer Kit** will be documented in this file.

## [2.0.0] - 2026-01-27

### 🚀 The "AI Team" Release
Completely restructured the repository from a static list of prompts into a modular, role-based multi-agent system.

### 🤖 New Agents & Roles
- **Orchestrator (`/dev`):** Central brain capable of **Dynamic Persona Adoption**. It autonomously reads other agent definitions to perform specialized tasks (Planning, Coding, Auditing) without user switching.
- **Product Manager (`/prod`):** Strategy (WSJF), Growth (Feature Flags/AB Testing), Analytics.
- **Rails Architect (`/arch`):** System design, stack selection, implementation planning.
- **Rails Developer (`/code`):** Implementation with strict TDD (Red-Green-Refactor).
- **Rails Auditor (`/audit`):** QA (Definition of Done), Security (Brakeman), Refactoring.
- **UI/UX Designer (`/design`):** Visual design (Tailwind), Accessibility (WCAG), UX flows.
- **AI Specialist (`/ai`):** LLM integration, RAG (pgvector), MCP Server creation.
- **i18n Specialist (`/i18n`):** Globalization, Timezones, Localization.
- **Tech Writer (`/writer`):** Release management (SemVer), Open Source compliance, Docs.
- **DevOps Engineer (`/ops`):** Infrastructure (Kamal, Docker), CI/CD.

### 🛠 System Improvements
- **Native Slash Commands:** Replaced fragile shell aliases with native Claude `/commands` (e.g., `/dev`, `/arch`).
- **Global Rules:** Separated `GLOBAL_RULES.md` (Kit standards) from Project Context.
- **Smart Installer:**
    - Generates native commands in `~/.claude/commands`.
    - Supports remote install via curl.
    - `claude-init` helper for project bootstrapping.
- **MCP Ready:** Native support for Rails MCP, AppSignal, GitHub, and Postgres MCP servers.

### 📚 New Skills (Knowledge Base)
- **Product:** WSJF, JTBD, Roadmap, Feature Flags (Flipper), A/B Testing.
- **AI:** OpenAI/Anthropic integration, Vector DBs, MCP building.
- **Rails Core:** ActiveInteraction > Services, Native Auth > Devise, Modern conventions.
- **Testing:** Flexible support for RSpec/Minitest and Fixtures/FactoryBot.
- **Docs:** Open Source Licenses, Community Health, ADRs.
- **Global:** "i18n-First" standards, Timezone safety.

### ⚡️ Breaking Changes
- **Devise Removed:** Default authentication is now Rails 8 Native Auth.
- **Legacy Structure Removed:** Old `rails-*` folders archived/deleted.

## [1.0.0] - Legacy
- Initial collection of Rails prompts (Archived).