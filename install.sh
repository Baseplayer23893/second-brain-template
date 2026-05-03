#!/bin/bash
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}🧠 Second Brain Template Installer${NC}"
echo "===================================="

# Check dependencies
echo -e "${YELLOW}Checking dependencies...${NC}"
command -v git >/dev/null 2>&1 || { echo -e "${RED}Git is required but not installed.${NC}"; exit 1; }
command -v opencode >/dev/null 2>&1 || echo -e "${YELLOW}Warning: OpenCode not found. Install from opencode.ai${NC}"

# Set vault path
DEFAULT_VAULT="$HOME/brain"
read -p "Enter vault path [$DEFAULT_VAULT]: " VAULT_PATH
VAULT_PATH="${VAULT_PATH:-$DEFAULT_VAULT}"

if [ -d "$VAULT_PATH" ] && [ "$(ls -A $VAULT_PATH)" ]; then
  echo -e "${RED}Directory $VAULT_PATH already exists and is not empty.${NC}"
  read -p "Overwrite? (y/N): " CONFIRM
  if [[ ! $CONFIRM =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 1
  fi
  rm -rf "$VAULT_PATH"
fi

# Get repo directory
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy template to vault path
echo -e "${YELLOW}Installing vault to $VAULT_PATH...${NC}"
mkdir -p "$VAULT_PATH"
cp -r "$REPO_DIR"/. "$VAULT_PATH"/ 2>/dev/null || true

# Remove git history if this was cloned
rm -rf "$VAULT_PATH/.git"
rm -f "$VAULT_PATH/install.sh"
rm -f "$VAULT_PATH/README.md"

# Initialize new git repo
cd "$VAULT_PATH"
git init
git add .
git commit -m "Initial second brain setup"

# Install brain command
echo -e "${YELLOW}Installing 'brain' command...${NC}"
BRAIN_BIN="$VAULT_PATH/brain"

# Add to PATH
if [[ ":$PATH:" != *":$VAULT_PATH:"* ]]; then
  SHELL_RC=""
  if [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
  elif [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
  fi

  if [ -n "$SHELL_RC" ]; then
    echo "export PATH=\"\$PATH:$VAULT_PATH\"" >> "$SHELL_RC"
    echo "export BRAIN_VAULT=\"$VAULT_PATH\"" >> "$SHELL_RC"
    echo -e "${GREEN}Added to PATH in $SHELL_RC${NC}"
    echo -e "${YELLOW}Run: source $SHELL_RC${NC}"
  fi
fi

chmod +x "$BRAIN_BIN"

# Create symlink to /usr/local/bin if possible
if [ -w "/usr/local/bin" ]; then
  ln -sf "$BRAIN_BIN" /usr/local/bin/brain
  echo -e "${GREEN}Created symlink: /usr/local/bin/brain${NC}"
fi

echo ""
echo -e "${GREEN}✅ Installation complete!${NC}"
echo ""
echo "Next steps:"
echo "  1. Open Obsidian → Open folder as vault → Select: $VAULT_PATH"
echo "  2. Install Community Plugins: Dataview, Templater"
echo "  3. Run: source ~/.bashrc (or ~/.zshrc)"
echo "  4. Test: brain capture 'Hello second brain'"
echo "  5. Test: brain process"
echo ""
echo "Vault location: $VAULT_PATH"
