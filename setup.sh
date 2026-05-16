#!/bin/bash

# 🎯 GoalOS — Instalación Interactiva
# Este script configura GoalOS en 2 minutos con preguntas simples

set -e

# Colores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color
BOLD='\033[1m'

clear

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║${NC}  ${BOLD}🎯 GoalOS — Goal Architect AI Setup${NC}                   ${BLUE}║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}Transforma objetivos vagos en roadmaps visuales accionables${NC}"
echo -e "${GREEN}Compatible con: GitHub Copilot, Claude, Open WebUI${NC}"
echo ""

# ============================================
# PASO 1: Detectar plataforma AI
# ============================================

echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BOLD}Paso 1/3: ¿Dónde vas a usar GoalOS?${NC}"
echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "Opciones:"
echo "  1) GitHub Copilot (VS Code)       [Recomendado - Setup automático]"
echo "  2) Claude (Projects)               [Requiere copiar instrucciones]"
echo "  3) Open WebUI (Ollama)             [Requiere configurar modelo]"
echo "  4) Todas las anteriores            [Setup completo]"
echo ""
read -p "$(echo -e ${YELLOW}Tu elección [1-4]:${NC} )" ai_platform

# Validar input
if [[ ! "$ai_platform" =~ ^[1-4]$ ]]; then
    echo -e "${RED}✗ Opción inválida. Usando opción 1 (Copilot)${NC}"
    ai_platform=1
fi

# ============================================
# PASO 2: Configurar integraciones opcionales
# ============================================

echo ""
echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BOLD}Paso 2/3: Integraciones opcionales (Notion y Miro)${NC}"
echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${BLUE}ℹ️  Importante:${NC} El board HTML funciona ${GREEN}offline sin tokens${NC}"
echo -e "   Solo necesitas tokens si quieres exportar a Notion/Miro"
echo ""
read -p "$(echo -e ${YELLOW}¿Quieres configurar Notion/Miro ahora? [y/N]:${NC} )" setup_tokens

if [[ "$setup_tokens" =~ ^[Yy]$ ]]; then
    
    # ────────────────────────────────
    # NOTION SETUP
    # ────────────────────────────────
    
    echo ""
    echo -e "${BOLD}📘 Configurar Notion${NC}"
    echo ""
    read -p "$(echo -e ${YELLOW}¿Configurar Notion? [y/N]:${NC} )" setup_notion
    
    if [[ "$setup_notion" =~ ^[Yy]$ ]]; then
        echo ""
        echo -e "${BLUE}Pasos para obtener tu token de Notion:${NC}"
        echo ""
        echo "1. Abre https://www.notion.so/my-integrations en tu navegador"
        echo "2. Click en '+ New integration'"
        echo "3. Nombre: GoalOS"
        echo "4. Associated workspace: [tu workspace]"
        echo "5. En 'Capabilities', activa:"
        echo "   ✓ Read content"
        echo "   ✓ Insert content"
        echo "   ✓ Update content"
        echo "6. Click 'Submit'"
        echo "7. Copia el 'Internal Integration Token' (empieza con 'secret_')"
        echo ""
        echo -e "${YELLOW}[Presiona Enter cuando tengas el token listo]${NC}"
        read
        
        read -p "$(echo -e ${YELLOW}Pega tu NOTION_API_TOKEN (secret_...):${NC} )" notion_token
        
        if [[ -n "$notion_token" ]]; then
            echo ""
            echo -e "${BLUE}Ahora necesitas el Page ID de tu workspace:${NC}"
            echo ""
            echo "1. Abre cualquier página de Notion donde quieras crear roadmaps"
            echo "2. Copia la URL. Ejemplo:"
            echo "   https://notion.so/workspace/Mi-Pagina-123abc456def"
            echo "                                          ^^^^^^^^^^^^"
            echo "3. El Page ID es la parte después del último '-'"
            echo "   En el ejemplo: 123abc456def"
            echo ""
            read -p "$(echo -e ${YELLOW}Pega tu NOTION_PARENT_PAGE_ID:${NC} )" notion_page_id
            
            # Guardar en .env
            cat > .env << EOF
# Notion Configuration
NOTION_API_TOKEN="$notion_token"
NOTION_PARENT_PAGE_ID="$notion_page_id"
EOF
            
            echo -e "${GREEN}✓ Notion configurado correctamente${NC}"
        else
            echo -e "${YELLOW}⊘ Saltando Notion (puedes configurarlo después)${NC}"
        fi
    else
        echo -e "${YELLOW}⊘ Saltando Notion${NC}"
    fi
    
    # ────────────────────────────────
    # MIRO SETUP
    # ────────────────────────────────
    
    echo ""
    echo -e "${BOLD}🎨 Configurar Miro${NC}"
    echo ""
    read -p "$(echo -e ${YELLOW}¿Configurar Miro? [y/N]:${NC} )" setup_miro
    
    if [[ "$setup_miro" =~ ^[Yy]$ ]]; then
        echo ""
        echo -e "${BLUE}Pasos para obtener tu token de Miro:${NC}"
        echo ""
        echo "1. Abre https://miro.com/app/settings/user-profile/apps"
        echo "2. En la sección 'Your apps', click 'Create new app'"
        echo "3. App name: GoalOS"
        echo "4. Description: Visual roadmap generator"
        echo "5. Click 'Create app'"
        echo "6. En la página de tu app, ve a 'OAuth & Permissions'"
        echo "7. En 'Access token', click 'Generate' o copia el token existente"
        echo "8. Copia el Access Token"
        echo ""
        echo -e "${YELLOW}[Presiona Enter cuando tengas el token listo]${NC}"
        read
        
        read -p "$(echo -e ${YELLOW}Pega tu MIRO_ACCESS_TOKEN:${NC} )" miro_token
        
        if [[ -n "$miro_token" ]]; then
            # Append to .env
            if [[ -f .env ]]; then
                cat >> .env << EOF

# Miro Configuration
MIRO_ACCESS_TOKEN="$miro_token"
EOF
            else
                cat > .env << EOF
# Miro Configuration
MIRO_ACCESS_TOKEN="$miro_token"
EOF
            fi
            
            echo -e "${GREEN}✓ Miro configurado correctamente${NC}"
        else
            echo -e "${YELLOW}⊘ Saltando Miro (puedes configurarlo después)${NC}"
        fi
    else
        echo -e "${YELLOW}⊘ Saltando Miro${NC}"
    fi
    
    # Validar tokens
    if [[ -f .env ]]; then
        echo ""
        echo -e "${BLUE}Validando tokens...${NC}"
        
        if [[ -f validate-tokens.sh ]]; then
            chmod +x validate-tokens.sh
            if ./validate-tokens.sh; then
                echo -e "${GREEN}✓ Todos los tokens son válidos${NC}"
            else
                echo -e "${YELLOW}⚠ Algunos tokens podrían ser inválidos. Revisa el output arriba.${NC}"
            fi
        fi
        
        # Agregar .env a .zshrc para que sea permanente
        echo ""
        read -p "$(echo -e ${YELLOW}¿Hacer los tokens permanentes en tu shell? [Y/n]:${NC} )" make_permanent
        
        if [[ ! "$make_permanent" =~ ^[Nn]$ ]]; then
            shell_rc="$HOME/.zshrc"
            if [[ "$SHELL" == *"bash"* ]]; then
                shell_rc="$HOME/.bashrc"
            fi
            
            echo "" >> "$shell_rc"
            echo "# GoalOS Environment Variables" >> "$shell_rc"
            cat .env | grep -v "^#" | sed 's/^/export /' >> "$shell_rc"
            
            echo -e "${GREEN}✓ Tokens guardados en $shell_rc${NC}"
            echo -e "${BLUE}  (Reinicia la terminal o ejecuta: source $shell_rc)${NC}"
        fi
    fi
    
else
    echo -e "${YELLOW}⊘ Saltando configuración de tokens${NC}"
    echo -e "${BLUE}  Puedes configurarlos después ejecutando: ./setup.sh${NC}"
fi

# ============================================
# PASO 3: Abrir en la plataforma elegida
# ============================================

echo ""
echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BOLD}Paso 3/3: Abrir GoalOS${NC}"
echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

case $ai_platform in
    1)
        echo -e "${GREEN}✓ Configurado para GitHub Copilot${NC}"
        echo ""
        echo "Abriendo VS Code..."
        code .
        echo ""
        echo -e "${BOLD}🎯 Siguiente paso:${NC}"
        echo "   1. En VS Code, abre Copilot Chat (Cmd+Shift+I / Ctrl+Shift+I)"
        echo "   2. Escribe: ${GREEN}@GoalOS quiero aprender Python en 3 meses${NC}"
        echo "   3. Responde las preguntas y ¡listo!"
        ;;
    2)
        echo -e "${GREEN}✓ Configurado para Claude${NC}"
        echo ""
        echo -e "${BOLD}🎯 Siguientes pasos:${NC}"
        echo "   1. Abre https://claude.ai"
        echo "   2. Crea un nuevo Project"
        echo "   3. Ve a Project Settings → Custom Instructions"
        echo "   4. Abre el archivo CLAUDE.md y copia TODO su contenido"
        echo "   5. Pega en Custom Instructions y guarda"
        echo "   6. En el proyecto, escribe: ${GREEN}GoalOS quiero [tu objetivo]${NC}"
        echo ""
        echo "¿Abrir CLAUDE.md ahora? [Y/n]"
        read open_claude
        if [[ ! "$open_claude" =~ ^[Nn]$ ]]; then
            cat CLAUDE.md
        fi
        ;;
    3)
        echo -e "${GREEN}✓ Configurado para Open WebUI${NC}"
        echo ""
        echo -e "${BOLD}🎯 Siguientes pasos:${NC}"
        echo "   1. Abre Open WebUI (http://localhost:3000)"
        echo "   2. Workspace → Models → + Create Model"
        echo "   3. Name: GoalOS"
        echo "   4. Base Model: llama3 (o tu favorito)"
        echo "   5. System Prompt: Copia desde OPENWEBUI.md → sección SYSTEM PROMPT"
        echo "   6. Guarda y selecciona el modelo GoalOS"
        echo "   7. Escribe: ${GREEN}GoalOS quiero [tu objetivo]${NC}"
        echo ""
        echo "¿Abrir OPENWEBUI.md ahora? [Y/n]"
        read open_openwebui
        if [[ ! "$open_openwebui" =~ ^[Nn]$ ]]; then
            cat OPENWEBUI.md
        fi
        ;;
    4)
        echo -e "${GREEN}✓ Configurado para todas las plataformas${NC}"
        echo ""
        echo -e "${BOLD}📚 Guías disponibles:${NC}"
        echo "   • GitHub Copilot: Abre con 'code .' → @GoalOS quiero [objetivo]"
        echo "   • Claude: Lee CLAUDE.md"
        echo "   • Open WebUI: Lee OPENWEBUI.md"
        ;;
esac

# ============================================
# RESUMEN FINAL
# ============================================

echo ""
echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}${BOLD}✓ GoalOS instalado correctamente${NC}"
echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${BOLD}📁 Archivos importantes:${NC}"
echo "   • README.md          - Documentación completa"
echo "   • QUICKSTART.md      - Setup rápido"
echo "   • EXAMPLES.md        - Casos de uso reales"
if [[ -f .env ]]; then
    echo "   • .env               - Tus tokens (no subir a Git)"
fi
echo ""
echo -e "${BOLD}🎯 Prueba GoalOS ahora:${NC}"
echo ""
echo "   ${GREEN}@GoalOS quiero aprender inglés en 2 meses${NC}"
echo "   ${GREEN}@GoalOS quiero lanzar mi SaaS en 90 días${NC}"
echo "   ${GREEN}@GoalOS quiero automatizar el onboarding de clientes${NC}"
echo ""
echo -e "${BOLD}📚 Más info:${NC}"
echo "   • GitHub: https://github.com/Brayan-Oviedo/GoalOS"
echo "   • Issues: https://github.com/Brayan-Oviedo/GoalOS/issues"
echo ""
echo -e "${BLUE}¡Disfruta transformando tus objetivos en roadmaps accionables!${NC}"
echo ""
