# Global Engineering Standards (Alec's Constitution)

## 🧠 Philosophy
- **Incremental progress** — small changes that compile and pass tests.
- **Learn before implementing** — study existing patterns.
- **Pragmatic over dogmatic** — adapt to project reality.
- **Ask when uncertain** — if confidence < 100%, ask clarifying questions.

### Core Principles
- **KISS:** Simplest solution that works.
- **YAGNI:** Build only what's needed now.
- **DRY:** Single source of truth.
- **SOLID:** Modular, replaceable components.

## 🔄 Universal Process
1.  **Planning:** Document goals before coding.
2.  **TDD:** Red -> Green -> Refactor. Never skip "Red".
3.  **Review:** Self-audit before committing (Linter, Tests, Security).

## 🛠 Technical Standards

### Internationalization (i18n-First)
- **No Hardcoded Strings:** Use `t()` helper for everything user-facing.
- **Timezones:** Always use `Time.current`, never `Time.now`.
- **Formatting:** Use `l()` for dates and `number_to_*` for metrics.

### Architecture
- **Composition over inheritance.**
- [ ] Tests written and passing.
- [ ] Code follows project conventions.
- [ ] No linter warnings.
- [ ] No security vulnerabilities.
