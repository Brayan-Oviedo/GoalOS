#!/bin/bash
# GoalOS — Validación Completa Pre-Push
# Verifica que todo esté perfecto antes de compartir

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

GOALOS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$GOALOS_DIR"

echo ""
echo -e "${BLUE}╔═══════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   🔍 GoalOS — Validación Completa       ║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════════╝${NC}"
echo ""

ERRORS=0
WARNINGS=0

# Function to report errors
error() {
  echo -e "${RED}❌ ERROR:${NC} $1"
  ERRORS=$((ERRORS + 1))
}

# Function to report warnings
warn() {
  echo -e "${YELLOW}⚠️  WARNING:${NC} $1"
  WARNINGS=$((WARNINGS + 1))
}

# Function to report success
success() {
  echo -e "${GREEN}✓ $1${NC}"
}

echo -e "${BLUE}[1/7] Validando sintaxis de scripts bash...${NC}"

# Validate bash scripts
BASH_SCRIPTS=(
  "setup.sh"
  "validate-tokens.sh"
  "goalos-notion"
  "goalos-miro"
  "install-mcp.sh"
  "test-notion.sh"
)

for script in "${BASH_SCRIPTS[@]}"; do
  if [ -f "$script" ]; then
    if bash -n "$script" 2>/dev/null; then
      success "$script syntax OK"
    else
      error "$script has syntax errors"
    fi
  else
    error "$script not found"
  fi
done

echo ""
echo -e "${BLUE}[2/7] Validando Node.js/MCP files...${NC}"

# Validate Node.js syntax
if [ -f "mcp-server-goalos.mjs" ]; then
  if command -v node &> /dev/null; then
    if node --check mcp-server-goalos.mjs 2>/dev/null; then
      success "mcp-server-goalos.mjs syntax OK"
    else
      error "mcp-server-goalos.mjs has syntax errors"
    fi
  else
    warn "Node.js not installed, skipping MCP validation"
  fi
else
  error "mcp-server-goalos.mjs not found"
fi

# Validate package.json
if [ -f "package.json" ]; then
  if command -v jq &> /dev/null; then
    if jq empty package.json 2>/dev/null; then
      success "package.json valid JSON"
    else
      error "package.json invalid JSON"
    fi
  else
    warn "jq not installed, skipping package.json validation"
  fi
else
  error "package.json not found"
fi

echo ""
echo -e "${BLUE}[3/7] Verificando archivos obligatorios...${NC}"

# Check required files
REQUIRED_FILES=(
  "README.md"
  "QUICKSTART.md"
  "CLAUDE.md"
  "OPENWEBUI.md"
  "EXAMPLES.md"
  "VALIDATION.md"
  "TROUBLESHOOTING_NOTION.md"
  "MCP-SETUP.md"
  ".github/agents/goal-architect.agent.md"
  ".gitignore"
  "setup.sh"
  "validate-tokens.sh"
  "goalos-notion"
  "goalos-miro"
  "install-mcp.sh"
  "mcp-server-goalos.mjs"
  "package.json"
)

for file in "${REQUIRED_FILES[@]}"; do
  if [ -f "$file" ]; then
    success "$file exists"
  else
    error "$file missing"
  fi
done

echo ""
echo -e "${BLUE}[4/7] Buscando tokens reales (SEGURIDAD)...${NC}"

# Search for real tokens (should only find placeholders)
SENSITIVE_PATTERNS=(
  "secret_[a-zA-Z0-9]{32,}"
  "ntn_[a-zA-Z0-9]{32,}"
  "eyJ[a-zA-Z0-9_-]{100,}"
  "ghp_[a-zA-Z0-9]{36}"
)

TOKENS_FOUND=0
for pattern in "${SENSITIVE_PATTERNS[@]}"; do
  if grep -rE "$pattern" . --exclude-dir=node_modules --exclude-dir=.git --exclude="*.md" 2>/dev/null | grep -v "PLACEHOLDER" | grep -v "ejemplo" | grep -v "tu_token"; then
    error "Real token found matching pattern: $pattern"
    TOKENS_FOUND=$((TOKENS_FOUND + 1))
  fi
done

if [ $TOKENS_FOUND -eq 0 ]; then
  success "No real tokens found (security OK)"
fi

echo ""
echo -e "${BLUE}[5/7] Verificando .gitignore...${NC}"

# Check .gitignore includes sensitive files
GITIGNORE_REQUIRED=(
  ".env"
  "*.env"
  "output/"
  "node_modules/"
  "package-lock.json"
)

for pattern in "${GITIGNORE_REQUIRED[@]}"; do
  if grep -q "$pattern" .gitignore 2>/dev/null; then
    success ".gitignore includes $pattern"
  else
    error ".gitignore missing $pattern"
  fi
done

echo ""
echo -e "${BLUE}[6/7] Verificando permisos de ejecución...${NC}"

# Check executable permissions
EXECUTABLES=(
  "setup.sh"
  "validate-tokens.sh"
  "goalos-notion"
  "goalos-miro"
  "install-mcp.sh"
  "test-notion.sh"
  "mcp-server-goalos.mjs"
)

for script in "${EXECUTABLES[@]}"; do
  if [ -f "$script" ]; then
    if [ -x "$script" ]; then
      success "$script is executable"
    else
      warn "$script not executable (run: chmod +x $script)"
    fi
  fi
done

echo ""
echo -e "${BLUE}[7/7] Verificando estructura del agente...${NC}"

# Validate agent file structure
AGENT_FILE=".github/agents/goal-architect.agent.md"
if [ -f "$AGENT_FILE" ]; then
  # Check for required sections
  if grep -q "EXPORTACIÓN AUTOMÁTICA" "$AGENT_FILE"; then
    success "Agent has export section"
  else
    error "Agent missing export section"
  fi
  
  if grep -q "MÉTODO 1: Usando MCP Server" "$AGENT_FILE"; then
    success "Agent has MCP instructions"
  else
    warn "Agent missing MCP instructions"
  fi
  
  if grep -q "export_all" "$AGENT_FILE"; then
    success "Agent references export_all function"
  else
    warn "Agent doesn't reference export_all"
  fi
fi

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}RESUMEN DE VALIDACIÓN${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
  echo -e "${GREEN}✅ TODO PERFECTO${NC}"
  echo -e "${GREEN}   0 errores, 0 warnings${NC}"
  echo ""
  echo -e "${GREEN}🚀 GoalOS está listo para compartir${NC}"
  exit 0
elif [ $ERRORS -eq 0 ]; then
  echo -e "${YELLOW}⚠️  LISTO CON WARNINGS${NC}"
  echo -e "${YELLOW}   0 errores, $WARNINGS warnings${NC}"
  echo ""
  echo -e "${YELLOW}Revisa los warnings arriba (no son críticos)${NC}"
  exit 0
else
  echo -e "${RED}❌ HAY ERRORES${NC}"
  echo -e "${RED}   $ERRORS errores, $WARNINGS warnings${NC}"
  echo ""
  echo -e "${RED}Arregla los errores antes de compartir${NC}"
  exit 1
fi
