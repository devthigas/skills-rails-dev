#!/bin/bash
set -e

# Configuration
REPO_URL="https://github.com/alec-c4/claude-rails-dev.git"
INSTALL_BASE="$HOME/.claude"
REPO_DIR="$INSTALL_BASE/repo"
KIT_DIR="$INSTALL_BASE/dev-kit"
COMMANDS_DIR="$INSTALL_BASE/commands"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🤖 Installing Claude Rails Developer Kit (v3.0.0 - Native Slash Commands)...${NC}"

# --- 1. Source Acquisition ---
if [ -d ".git" ] && [ -d "agents" ]; then
    SOURCE_DIR="$(pwd)"
else
    if [ -d "$REPO_DIR" ]; then
        cd "$REPO_DIR" && git pull > /dev/null
    else
        git clone "$REPO_URL" "$REPO_DIR" > /dev/null
    fi
    SOURCE_DIR="$REPO_DIR"
fi

# --- 2. Setup Kit Directory ---
mkdir -p "$KIT_DIR"
mkdir -p "$COMMANDS_DIR"

# Sync Assets
cp -r "$SOURCE_DIR/agents" "$KIT_DIR/"
cp -r "$SOURCE_DIR/skills" "$KIT_DIR/"
cp -r "$SOURCE_DIR/templates" "$KIT_DIR/"
cp "$SOURCE_DIR/templates/GLOBAL_RULES.md" "$KIT_DIR/GLOBAL_RULES.md"

# --- 3. Global Context Strategy (CLAUDE.md) ---
# We ensure ~/.claude/CLAUDE.md exists and includes our Global Rules if desired.
GLOBAL_CLAUDE_MD="$INSTALL_BASE/CLAUDE.md"

if [ ! -f "$GLOBAL_CLAUDE_MD" ]; then
    echo -e "${YELLOW}Creating global context at $GLOBAL_CLAUDE_MD...${NC}"
    # By default, point to our Kit Rules
    echo "See engineering standards at: $KIT_DIR/GLOBAL_RULES.md" > "$GLOBAL_CLAUDE_MD"
    cat "$KIT_DIR/GLOBAL_RULES.md" >> "$GLOBAL_CLAUDE_MD"
else
    echo -e "${GREEN}✓ Global CLAUDE.md found.${NC}"
    # Optional: We could append if not present, but let's respect user file for now.
fi

# --- 4. Install Native Slash Commands ---
echo -e "\n${BLUE}Installing Native Slash Commands...${NC}"

install_command() {
    local src="$1"
    local name="$2"
    local dest="$COMMANDS_DIR/$name.md"
    
    # We create a wrapper that includes the Agent Prompt AND handles arguments
    # Native commands use the file content as the prompt.
    # We prepend "ACTIVATE AGENT:" to ensure intent.
    
    echo "---" > "$dest"
    echo "description: Activate $name agent" >> "$dest"
    echo "---" >> "$dest"
    echo "" >> "$dest"
    echo "# ACTIVATE AGENT: $name" >> "$dest"
    echo "" >> "$dest"
    cat "$src" >> "$dest"
    echo "" >> "$dest"
    echo "USER REQUEST: $ARGUMENTS" >> "$dest"
    
    echo -e "${GREEN}✓ /$name installed.${NC}"
}

# Mapping Agents to Commands
install_command "$KIT_DIR/agents/orchestrator.md" "dev"
install_command "$KIT_DIR/agents/product-manager.md" "prod"
install_command "$KIT_DIR/agents/rails-architect.md" "arch"
install_command "$KIT_DIR/agents/rails-developer.md" "code"
install_command "$KIT_DIR/agents/rails-auditor.md" "audit"
install_command "$KIT_DIR/agents/ui-ux-designer.md" "design"
install_command "$KIT_DIR/agents/ai-specialist.md" "ai"
install_command "$KIT_DIR/agents/i18n-specialist.md" "i18n"
install_command "$KIT_DIR/agents/api-specialist.md" "api"
install_command "$KIT_DIR/agents/devops-engineer.md" "ops"
install_command "$KIT_DIR/agents/tech-writer.md" "writer"

# Init command (Special case: Shell script vs prompt)
# For /init, we might still need a shell alias because Slash Commands run inside the LLM context,
# they don't execute local file operations directly unless the LLM calls a tool.
# So 'claude-init' alias is still useful for bootstrapping.

# --- 5. Legacy Shell Aliases (Optional / Fallback) ---
mkdir -p "$KIT_DIR/aliases"
cat <<EOF > "$KIT_DIR/aliases/claude_kit.sh"
# Claude Rails Kit Aliases (Legacy / Utilities)
alias claude-init='cp "$KIT_DIR/templates/CLAUDE.md" ./CLAUDE.md && echo "✅ Initialized CLAUDE.md"'
alias claude-kit='$SOURCE_DIR/bin/claude-kit'
EOF

cat <<EOF > "$KIT_DIR/aliases/claude_kit.fish"
# Claude Rails Kit Aliases (Fish)
function claude-init
    cp "$KIT_DIR/templates/CLAUDE.md" ./CLAUDE.md
    echo "✅ Initialized CLAUDE.md"
end
alias claude-kit '$SOURCE_DIR/bin/claude-kit'
EOF

# Install fallback aliases
FISH_CONF_DIR="$HOME/.config/fish/conf.d"
[ -d "$FISH_CONF_DIR" ] && cp "$KIT_DIR/aliases/claude_kit.fish" "$FISH_CONF_DIR/claude_kit.fish"

OMZ_CUSTOM_DIR="$HOME/.oh-my-zsh/custom"
[ -d "$OMZ_CUSTOM_DIR" ] && cp "$KIT_DIR/aliases/claude_kit.sh" "$OMZ_CUSTOM_DIR/claude_kit.zsh"


echo -e "\n${GREEN}🎉 Installation Complete!${NC}"
echo "You can now use commands directly in Claude CLI:"
echo -e "  ${BLUE}/dev${NC} [request]   - Start Orchestrator"
echo -e "  ${BLUE}/arch${NC} [request]  - Rails Architect"
echo -e "  ${BLUE}/code${NC} [request]  - Rails Developer"
echo -e "  ${BLUE}/audit${NC} [request] - Rails Auditor"
echo ""
echo "Use 'claude-init' to bootstrap a new project."
