# Claude Rails Kit Aliases (Fish)
# Source this file in your config.fish: source $HOME/.claude/dev-kit/claude_kit.fish

set -x CLAUDE_KIT_PATH "$HOME/.claude/dev-kit"
set -x GLOBAL_CTX "$CLAUDE_KIT_PATH/GLOBAL_RULES.md"

# Router
alias claude-dev 'claude -p "Activate Orchestrator agent. Analyze my request." --context "$CLAUDE_KIT_PATH/agents/orchestrator.md" --context "$GLOBAL_CTX"'

# Direct Agent Access
alias claude-prod 'claude -p "Activate Product Manager agent." --context "$CLAUDE_KIT_PATH/agents/product-manager.md" --context "$GLOBAL_CTX"'
alias claude-ai 'claude -p "Activate AI Specialist agent." --context "$CLAUDE_KIT_PATH/agents/ai-specialist.md" --context "$GLOBAL_CTX"'
alias claude-arch 'claude -p "Activate Rails Architect agent." --context "$CLAUDE_KIT_PATH/agents/rails-architect.md" --context "$GLOBAL_CTX"'
alias claude-code 'claude -p "Activate Rails Developer agent." --context "$CLAUDE_KIT_PATH/agents/rails-developer.md" --context "$GLOBAL_CTX"'
alias claude-design 'claude -p "Activate UI/UX Designer agent." --context "$CLAUDE_KIT_PATH/agents/ui-ux-designer.md" --context "$GLOBAL_CTX"'
alias claude-audit 'claude -p "Activate Rails Auditor agent." --context "$CLAUDE_KIT_PATH/agents/rails-auditor.md" --context "$GLOBAL_CTX"'
alias claude-writer 'claude -p "Activate Tech Writer agent." --context "$CLAUDE_KIT_PATH/agents/tech-writer.md" --context "$GLOBAL_CTX"'
alias claude-i18n 'claude -p "Activate i18n Specialist agent." --context "$CLAUDE_KIT_PATH/agents/i18n-specialist.md" --context "$GLOBAL_CTX"'
alias claude-api 'claude -p "Activate API Specialist agent." --context "$CLAUDE_KIT_PATH/agents/api-specialist.md" --context "$GLOBAL_CTX"'
alias claude-ops 'claude -p "Activate DevOps Engineer agent." --context "$CLAUDE_KIT_PATH/agents/devops-engineer.md" --context "$GLOBAL_CTX"'

# Project Setup
function claude-init
    cp "$CLAUDE_KIT_PATH/templates/CLAUDE.md" ./CLAUDE.md
    echo "✅ Initialized CLAUDE.md in current directory."
end

# CLI Tool
alias claude-kit '"$CLAUDE_KIT_PATH/../repo/bin/claude-kit"'