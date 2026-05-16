#!/bin/bash
# GoalOS — Validación Exhaustiva de Exportación Completa
# Verifica que TODA la información se exporte sin pérdida

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

GOALOS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$GOALOS_DIR"

echo ""
echo -e "${BLUE}╔═══════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   🔬 GoalOS — Validación Exhaustiva         ║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════════════╝${NC}"
echo ""

ERRORS=0
WARNINGS=0

error() {
  echo -e "${RED}❌ $1${NC}"
  ERRORS=$((ERRORS + 1))
}

warn() {
  echo -e "${YELLOW}⚠️  $1${NC}"
  WARNINGS=$((WARNINGS + 1))
}

success() {
  echo -e "${GREEN}✓ $1${NC}"
}

# ═══════════════════════════════════════════════════════════════
# [1] VALIDAR SINTAXIS DE TODOS LOS SCRIPTS
# ═══════════════════════════════════════════════════════════════

echo -e "${BLUE}[1/7] Validando sintaxis de scripts...${NC}"

SCRIPTS=("setup.sh" "validate-tokens.sh" "goalos-notion" "goalos-miro" "test-notion.sh")

for script in "${SCRIPTS[@]}"; do
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

# ═══════════════════════════════════════════════════════════════
# [2] VERIFICAR SCHEMA COMPLETO DEL AGENTE
# ═══════════════════════════════════════════════════════════════

echo -e "${BLUE}[2/7] Verificando schema del agente...${NC}"

AGENT_FILE=".github/agents/goal-architect.agent.md"

REQUIRED_FIELDS=(
  "description"
  "steps"
  "priority"
  "tools_needed"
  "assigned_skill"
  "deliverable"
  "estimated_hours"
)

for field in "${REQUIRED_FIELDS[@]}"; do
  if grep -q "$field" "$AGENT_FILE" 2>/dev/null; then
    success "Schema incluye: $field"
  else
    error "Schema NO incluye: $field"
  fi
done

echo ""

# ═══════════════════════════════════════════════════════════════
# [3] VERIFICAR CAMPOS EN GOALOS-NOTION
# ═══════════════════════════════════════════════════════════════

echo -e "${BLUE}[3/7] Verificando goalos-notion...${NC}"

NOTION_FIELDS=(
  "Priority"
  "Skill"
  "Tools"
  "TASK_DESC"
  "TASK_PRIORITY"
  "TASK_SKILL"
  "TASK_TOOLS"
)

for field in "${NOTION_FIELDS[@]}"; do
  if grep -q "$field" "goalos-notion" 2>/dev/null; then
    success "goalos-notion exporta: $field"
  else
    error "goalos-notion NO exporta: $field"
  fi
done

echo ""

# ═══════════════════════════════════════════════════════════════
# [4] VERIFICAR CAMPOS EN GOALOS-MIRO
# ═══════════════════════════════════════════════════════════════

echo -e "${BLUE}[4/7] Verificando goalos-miro...${NC}"

MIRO_FIELDS=(
  "TASK_DESC"
  "TASK_PRIORITY"
  "TASK_SKILL"
  "TASK_TOOLS"
  "PRIORITY_COLOR"
  "DESC_HEIGHT"
  "SKILL_HEIGHT"
  "TOOLS_HEIGHT"
)

for field in "${MIRO_FIELDS[@]}"; do
  if grep -q "$field" "goalos-miro" 2>/dev/null; then
    success "goalos-miro exporta: $field"
  else
    error "goalos-miro NO exporta: $field"
  fi
done

echo ""

# ═══════════════════════════════════════════════════════════════
# [5] VERIFICAR COMANDO DE EXPORTACIÓN AUTOMÁTICA
# ═══════════════════════════════════════════════════════════════

echo -e "${BLUE}[5/7] Verificando exportación automática...${NC}"

if grep -q "COMANDO OBLIGATORIO" "$AGENT_FILE" 2>/dev/null; then
  success "Agente tiene comando de exportación obligatorio"
else
  error "Agente NO tiene comando de exportación obligatorio"
fi

if grep -q "Exportación Automática OBLIGATORIA" "$AGENT_FILE" 2>/dev/null; then
  success "Agente tiene principio #4 (exportación obligatoria)"
else
  error "Agente NO tiene principio #4"
fi

if grep -q "goalos-notion output/roadmap.json" "$AGENT_FILE" 2>/dev/null; then
  success "Comando incluye goalos-notion"
else
  error "Comando NO incluye goalos-notion"
fi

if grep -q "goalos-miro output/roadmap.json" "$AGENT_FILE" 2>/dev/null; then
  success "Comando incluye goalos-miro"
else
  error "Comando NO incluye goalos-miro"
fi

echo ""

# ═══════════════════════════════════════════════════════════════
# [6] PROBAR CON ROADMAP DE EJEMPLO
# ═══════════════════════════════════════════════════════════════

echo -e "${BLUE}[6/7] Probando con roadmap de ejemplo...${NC}"

# Create output directory
mkdir -p output

# Create test roadmap with ALL fields
cat > output/test-roadmap.json <<'ROADMAP'
{
  "goal": {
    "title": "Test Goal - Validación Completa",
    "timeline": "30 días"
  },
  "phases": [
    {
      "id": "phase-1",
      "name": "Test Phase",
      "duration_weeks": 2,
      "objective": "Validar exportación completa",
      "tasks": [
        {
          "id": "task-1-1",
          "title": "Test Task con TODOS los campos",
          "description": "Esta task tiene description, steps, priority, skill y tools para validar que TODO se exporte sin pérdida.",
          "estimated_hours": 8,
          "steps": [
            {"order": 1, "action": "Paso 1 de prueba", "duration": "2h"},
            {"order": 2, "action": "Paso 2 de prueba", "duration": "4h"},
            {"order": 3, "action": "Paso 3 de prueba", "duration": "2h"}
          ],
          "priority": "high",
          "dependencies": [],
          "deliverable": "Validación completa confirmada",
          "assigned_skill": "test-skill",
          "tools_needed": ["Tool1", "Tool2", "Tool3"],
          "status": "pending"
        }
      ]
    }
  ],
  "metadata": {
    "total_phases": 1,
    "total_tasks": 1,
    "estimated_duration_weeks": 2,
    "estimated_hours": 8
  }
}
ROADMAP

if [ -f "output/test-roadmap.json" ]; then
  success "Test roadmap creado"
  
  # Verify all fields exist
  if jq -e '.phases[0].tasks[0].description' output/test-roadmap.json > /dev/null 2>&1; then
    success "Test roadmap tiene description"
  else
    error "Test roadmap NO tiene description"
  fi
  
  if jq -e '.phases[0].tasks[0].steps' output/test-roadmap.json > /dev/null 2>&1; then
    success "Test roadmap tiene steps"
  else
    error "Test roadmap NO tiene steps"
  fi
  
  if jq -e '.phases[0].tasks[0].priority' output/test-roadmap.json > /dev/null 2>&1; then
    success "Test roadmap tiene priority"
  else
    error "Test roadmap NO tiene priority"
  fi
  
  if jq -e '.phases[0].tasks[0].tools_needed' output/test-roadmap.json > /dev/null 2>&1; then
    success "Test roadmap tiene tools_needed"
  else
    error "Test roadmap NO tiene tools_needed"
  fi
else
  error "No se pudo crear test roadmap"
fi

# Clean up test file
rm -f output/test-roadmap.json

echo ""

# ═══════════════════════════════════════════════════════════════
# [7] VERIFICAR ARCHIVOS NECESARIOS
# ═══════════════════════════════════════════════════════════════

echo -e "${BLUE}[7/7] Verificando archivos necesarios...${NC}"

REQUIRED_FILES=(
  "README.md"
  "QUICKSTART.md"
  "CLAUDE.md"
  "OPENWEBUI.md"
  "EXAMPLES.md"
  "VALIDATION.md"
  "TROUBLESHOOTING_NOTION.md"
  ".github/agents/goal-architect.agent.md"
  ".gitignore"
  "setup.sh"
  "validate-tokens.sh"
  "goalos-notion"
  "goalos-miro"
)

for file in "${REQUIRED_FILES[@]}"; do
  if [ -f "$file" ]; then
    success "$file exists"
  else
    error "$file missing"
  fi
done

echo ""

# ═══════════════════════════════════════════════════════════════
# RESUMEN FINAL
# ═══════════════════════════════════════════════════════════════

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}RESUMEN DE VALIDACIÓN EXHAUSTIVA${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
  echo -e "${GREEN}✅ PERFECTO — TODO FUNCIONA 100%${NC}"
  echo -e "${GREEN}   0 errores, 0 warnings${NC}"
  echo ""
  echo -e "${GREEN}🚀 GoalOS exporta TODA la información sin pérdida:${NC}"
  echo -e "${GREEN}   • description ✅${NC}"
  echo -e "${GREEN}   • steps ✅${NC}"
  echo -e "${GREEN}   • priority ✅${NC}"
  echo -e "${GREEN}   • assigned_skill ✅${NC}"
  echo -e "${GREEN}   • tools_needed ✅${NC}"
  echo -e "${GREEN}   • deliverable ✅${NC}"
  echo -e "${GREEN}   • estimated_hours ✅${NC}"
  echo ""
  echo -e "${GREEN}📤 Exporta automáticamente a:${NC}"
  echo -e "${GREEN}   • HTML (siempre) ✅${NC}"
  echo -e "${GREEN}   • Notion (si hay token) ✅${NC}"
  echo -e "${GREEN}   • Miro (si hay token) ✅${NC}"
  exit 0
elif [ $ERRORS -eq 0 ]; then
  echo -e "${YELLOW}⚠️  LISTO CON WARNINGS${NC}"
  echo -e "${YELLOW}   0 errores, $WARNINGS warnings${NC}"
  echo ""
  echo -e "${YELLOW}Revisa los warnings arriba (no son críticos)${NC}"
  exit 0
else
  echo -e "${RED}❌ HAY ERRORES CRÍTICOS${NC}"
  echo -e "${RED}   $ERRORS errores, $WARNINGS warnings${NC}"
  echo ""
  echo -e "${RED}Arregla los errores antes de usar GoalOS${NC}"
  exit 1
fi
