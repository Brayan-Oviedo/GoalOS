#!/bin/bash
# GoalOS — Instalador de MCP para GitHub Copilot
# Configura automáticamente el MCP server en VS Code

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

GOALOS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo -e "${BLUE}╔═══════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   🔌 GoalOS MCP Setup for Copilot       ║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════════╝${NC}"
echo ""

# Check Node.js
if ! command -v node &> /dev/null; then
  echo -e "${RED}❌ Node.js no encontrado${NC}"
  echo ""
  echo "Instala Node.js (v18 o superior):"
  echo "  https://nodejs.org"
  echo ""
  exit 1
fi

NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
  echo -e "${RED}❌ Node.js v18+ requerido (tienes v$NODE_VERSION)${NC}"
  echo ""
  echo "Actualiza Node.js:"
  echo "  https://nodejs.org"
  echo ""
  exit 1
fi

echo -e "${GREEN}✓ Node.js $(node -v) detectado${NC}"
echo ""

# Install MCP SDK
echo -e "${BLUE}[1/3]${NC} Instalando dependencias MCP..."
npm install
echo -e "${GREEN}✓ Dependencias instaladas${NC}"
echo ""

# Make MCP server executable
chmod +x mcp-server-goalos.mjs
echo -e "${GREEN}✓ MCP server configurado${NC}"
echo ""

# Detect VS Code settings path
if [ "$(uname)" == "Darwin" ]; then
  VSCODE_SETTINGS="$HOME/Library/Application Support/Code/User/settings.json"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  VSCODE_SETTINGS="$HOME/.config/Code/User/settings.json"
else
  VSCODE_SETTINGS="$APPDATA/Code/User/settings.json"
fi

echo -e "${BLUE}[2/3]${NC} Configurando VS Code..."

# Create settings.json if it doesn't exist
mkdir -p "$(dirname "$VSCODE_SETTINGS")"
if [ ! -f "$VSCODE_SETTINGS" ]; then
  echo "{}" > "$VSCODE_SETTINGS"
fi

# Check if MCP already configured
if grep -q "goalos" "$VSCODE_SETTINGS" 2>/dev/null; then
  echo -e "${YELLOW}⚠️  GoalOS MCP ya está configurado en VS Code${NC}"
  echo ""
  printf "${YELLOW}¿Reconfigurar? [y/N]:${NC} "
  read RECONFIG
  if [[ ! "$RECONFIG" =~ ^[Yy]$ ]]; then
    echo -e "${GREEN}✓ Manteniendo configuración existente${NC}"
    echo ""
  else
    # Remove old config
    # (Simplified: just show manual instructions)
    echo -e "${YELLOW}Edita manualmente: $VSCODE_SETTINGS${NC}"
    echo ""
  fi
else
  echo -e "${GREEN}✓ Agregando configuración MCP a VS Code${NC}"
  echo ""
fi

echo -e "${BLUE}[3/3]${NC} Configuración final..."
echo ""

# Load tokens from .env if exists
if [ -f .env ]; then
  source .env
fi

# Show MCP config snippet
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}📋 COPIA ESTO EN TU settings.json DE VS CODE:${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "Ubicación: $VSCODE_SETTINGS"
echo ""
cat <<'MCP_CONFIG'
{
  "github.copilot.advanced": {
    "mcpServers": {
      "goalos": {
        "command": "node",
        "args": ["GOALOS_DIR/mcp-server-goalos.mjs"],
        "env": {
          "NOTION_API_TOKEN": "${env:NOTION_API_TOKEN}",
          "NOTION_PARENT_PAGE_ID": "${env:NOTION_PARENT_PAGE_ID}",
          "MIRO_ACCESS_TOKEN": "${env:MIRO_ACCESS_TOKEN}"
        }
      }
    }
  }
}
MCONFIG

# Replace GOALOS_DIR placeholder
sed "s|GOALOS_DIR|$GOALOS_DIR|g" <<'MCONFIG2'
MCONFIG2

echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

echo -e "${GREEN}✅ Instalación completa${NC}"
echo ""
echo -e "${BLUE}Próximos pasos:${NC}"
echo "1. Copia la configuración arriba en tu settings.json de VS Code"
echo "2. Reemplaza GOALOS_DIR con: $GOALOS_DIR"
echo "3. Reinicia VS Code (Cmd+Q o Ctrl+Q)"
echo "4. Verifica con: Developer: Show Running MCP Servers"
echo ""
echo -e "${BLUE}Uso en Copilot Chat:${NC}"
echo "  @goalos export_all       # Exporta a HTML + Notion + Miro"
echo "  @goalos export_to_notion # Solo Notion"
echo "  @goalos export_to_miro   # Solo Miro"
echo ""
