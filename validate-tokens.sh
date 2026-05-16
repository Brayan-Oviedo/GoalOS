#!/bin/bash
# GoalOS — Token Validation Script
# Valida que tus tokens de Notion y Miro estén correctamente configurados

set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "🔍 Validando tokens de GoalOS..."
echo ""

# Check Notion
echo "📝 Validando Notion..."
if [ -z "$NOTION_API_TOKEN" ]; then
  echo -e "${YELLOW}⚠️  NOTION_API_TOKEN no configurado${NC}"
  echo "   Configure con: export NOTION_API_TOKEN='tu_token'"
  echo "   (Puede empezar con 'secret_', 'ntn_' o ser alfanumérico)"
else
  echo -e "${GREEN}✅ NOTION_API_TOKEN configurado${NC}"
  
  # Test API call to validate token
  response=$(curl -s -o /dev/null -w "%{http_code}" -X GET 'https://api.notion.com/v1/users/me' \
    -H "Authorization: Bearer $NOTION_API_TOKEN" \
    -H "Notion-Version: 2022-06-28")
  
  if [ "$response" -eq 200 ]; then
    echo -e "${GREEN}✅ Token de Notion VÁLIDO${NC}"
  elif [ "$response" -eq 401 ]; then
    echo -e "${RED}❌ Token de Notion INVÁLIDO (Unauthorized - HTTP 401)${NC}"
    echo ""
    echo -e "${YELLOW}Posibles causas:${NC}"
    echo "   1. Token copiado incorrectamente (con espacios o comillas)"
    echo "   2. Token expirado o regenerado"
    echo "   3. Token no existe en tu workspace"
    echo ""
    echo -e "${YELLOW}Solución:${NC}"
    echo "   → Ve a: https://www.notion.so/my-integrations"
    echo "   → Verifica que exista la integración 'GoalOS'"
    echo "   → Copia el token completo (sin espacios ni comillas)"
  elif [ "$response" -eq 403 ]; then
    echo -e "${RED}❌ Token de Notion SIN PERMISOS (Forbidden - HTTP 403)${NC}"
    echo ""
    echo -e "${YELLOW}⚠️ CAUSA MÁS COMÚN:${NC}"
    echo "   NO conectaste la integración 'GoalOS' a la página"
    echo ""
    echo -e "${YELLOW}Solución:${NC}"
    echo "   1. Abre tu página de Notion en el navegador"
    echo "   2. Click en '...' (arriba derecha)"
    echo "   3. Click en 'Add connections' o 'Connect to'"
    echo "   4. Selecciona 'GoalOS' de la lista"
    echo "   5. Verifica que aparezca en conexiones activas"
  else
    echo -e "${RED}❌ Error de conexión (HTTP $response)${NC}"
    echo "   Verifica tu conexión a internet"
  fi
fi

if [ -z "$NOTION_PARENT_PAGE_ID" ]; then
  echo -e "${YELLOW}⚠️  NOTION_PARENT_PAGE_ID no configurado${NC}"
  echo "   Configure con: export NOTION_PARENT_PAGE_ID='...'"
else
  echo -e "${GREEN}✅ NOTION_PARENT_PAGE_ID configurado${NC}"
fi

echo ""

# Check Miro
echo "🎨 Validando Miro..."
if [ -z "$MIRO_ACCESS_TOKEN" ]; then
  echo -e "${YELLOW}⚠️  MIRO_ACCESS_TOKEN no configurado${NC}"
  echo "   Configure con: export MIRO_ACCESS_TOKEN='...'"
else
  echo -e "${GREEN}✅ MIRO_ACCESS_TOKEN configurado${NC}"
  
  # Test API call
  response=$(curl -s -o /dev/null -w "%{http_code}" -X GET 'https://api.miro.com/v2/boards?limit=1' \
    -H "Authorization: Bearer $MIRO_ACCESS_TOKEN")
  
  if [ "$response" -eq 200 ]; then
    echo -e "${GREEN}✅ Token de Miro VÁLIDO${NC}"
    
    # Get board count (only if jq is installed)
    if command -v jq &> /dev/null; then
      board_count=$(curl -s -X GET 'https://api.miro.com/v2/boards?limit=1' \
        -H "Authorization: Bearer $MIRO_ACCESS_TOKEN" | jq -r '.size // 0' 2>/dev/null)
      if [ -n "$board_count" ] && [ "$board_count" != "null" ]; then
        echo "   Boards disponibles: $board_count"
      fi
    fi
  elif [ "$response" -eq 401 ]; then
    echo -e "${RED}❌ Token de Miro INVÁLIDO (Unauthorized)${NC}"
    echo "   El token no tiene permisos o es incorrecto"
    echo "   Verifica:"
    echo "   - Que hayas obtenido el token desde 'Install app and get OAuth token'"
    echo "   - Permisos boards:read y boards:write configurados en el manifest"
    echo "   - Que hayas compartido un board con la app"
  else
    echo -e "${RED}❌ Token de Miro INVÁLIDO (HTTP $response)${NC}"
    echo "   Verifica que el token sea correcto y tenga permisos"
  fi
fi

echo ""

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

if [ -n "$NOTION_API_TOKEN" ] && [ -n "$NOTION_PARENT_PAGE_ID" ] && [ -n "$MIRO_ACCESS_TOKEN" ]; then
  echo -e "${GREEN}✅ Todos los tokens configurados${NC}"
  echo ""
  echo "🚀 Puedes usar:"
  echo "   @GoalOS exporta a Notion"
  echo "   @GoalOS exporta a Miro"
elif [ -n "$NOTION_API_TOKEN" ] || [ -n "$MIRO_ACCESS_TOKEN" ]; then
  echo -e "${YELLOW}⚠️  Configuración parcial${NC}"
  echo ""
  echo "✅ Puedes exportar a las plataformas configuradas"
  echo "⚠️  Configura los tokens faltantes para más opciones"
else
  echo -e "${YELLOW}⚠️  Sin tokens configurados${NC}"
  echo ""
  echo "💡 No te preocupes! El board HTML local funciona sin tokens"
  echo "   Solo genera tu roadmap y abre output/visual-board.html"
  echo ""
  echo "📚 Ver README.md para configurar Notion/Miro (opcional)"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
