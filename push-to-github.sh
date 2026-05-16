#!/bin/bash
# Script para conectar GoalOS a GitHub y hacer push
# Uso: ./push-to-github.sh

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 GoalOS — Push to GitHub${NC}"
echo ""

# Verificar que estamos en la carpeta correcta
if [ ! -f "README.md" ] || [ ! -d ".github" ]; then
  echo -e "${YELLOW}⚠️  Error: Ejecuta este script desde la carpeta raíz de GoalOS${NC}"
  exit 1
fi

# Inicializar Git si no existe
if [ ! -d ".git" ]; then
  echo -e "${GREEN}📦 Inicializando repositorio Git...${NC}"
  git init
fi

# Agregar todos los archivos
echo -e "${GREEN}📝 Agregando archivos...${NC}"
git add .

# Verificar que no haya tokens expuestos
echo -e "${YELLOW}🔍 Verificando que no haya tokens expuestos...${NC}"
if git diff --cached | grep -i "secret_" > /dev/null; then
  echo -e "${YELLOW}⚠️  ADVERTENCIA: Detectados posibles tokens en los archivos${NC}"
  echo -e "${YELLOW}   Revisa que no estés commiteando tokens reales${NC}"
  read -p "¿Continuar de todas formas? (y/n): " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi

# Commit
echo -e "${GREEN}💾 Creando commit...${NC}"
git commit -m "GoalOS v1.0 - Visual Goal Planning AI

- Setup en 1 minuto con instrucciones detalladas
- Compatible con GitHub Copilot, Claude, Open WebUI
- Exportación opcional a Notion/Miro
- Board HTML funciona offline sin tokens
- Script de validación incluido (validate-tokens.sh)
- Documentación completa: README, QUICKSTART, EXAMPLES
- 5-phase pipeline: Extraction → Discovery → Matching → Decomposition → Visual
- Skill: discovery-interview para elicitación profunda"

# Cambiar a branch main
echo -e "${GREEN}🌿 Configurando branch main...${NC}"
git branch -M main

# Agregar remote (si no existe)
REPO_URL="https://github.com/Brayan-Oviedo/GoalOS.git"
if ! git remote | grep -q "origin"; then
  echo -e "${GREEN}🔗 Conectando con GitHub...${NC}"
  git remote add origin "$REPO_URL"
else
  echo -e "${BLUE}✓ Remote 'origin' ya existe${NC}"
fi

# Push
echo -e "${GREEN}⬆️  Haciendo push a GitHub...${NC}"
echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}IMPORTANTE:${NC} Si es la primera vez, GitHub pedirá autenticación"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "Opciones de autenticación:"
echo "1. Token personal (recomendado)"
echo "2. SSH key"
echo "3. GitHub CLI (gh auth login)"
echo ""
read -p "Presiona ENTER para continuar..."

git push -u origin main

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✅ GoalOS subido exitosamente a GitHub!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${BLUE}🔗 URL del repo:${NC} https://github.com/Brayan-Oviedo/GoalOS"
echo ""
echo -e "${YELLOW}📋 Próximos pasos:${NC}"
echo "1. Ve a GitHub y verifica que se subió todo"
echo "2. Agrega descripción del repo:"
echo "   🎯 Goal Architect AI — Transform vague goals into visual Miro-style roadmaps"
echo "3. Agrega topics: ai, copilot, claude, roadmap, planning, productivity"
echo "4. (Opcional) Crea Release v1.0.0"
echo ""
echo -e "${GREEN}🎉 ¡Listo para compartir!${NC}"
