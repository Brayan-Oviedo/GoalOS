# 🎯 GoalOS — Goal Architect AI

> **Transforma objetivos vagos en roadmaps visuales accionables tipo Miro**  
> Compatible con GitHub Copilot, Claude y Open WebUI

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![AI-Powered](https://img.shields.io/badge/AI-Powered-blue)](https://github.com)

---

## ⚡ Setup en 1 Minuto

```bash
# 1. Clonar
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS

# 2. (Opcional) Configurar Notion/Miro
export NOTION_API_TOKEN="secret_..."      # 30 seg: notion.so/my-integrations
export NOTION_PARENT_PAGE_ID="123abc..."  # ID de tu página de Notion
export MIRO_ACCESS_TOKEN="..."            # 20 seg: miro.com/app/settings/user-profile/apps

# 3. Validar (opcional)
./validate-tokens.sh

# 4. Abrir en tu IA favorita (VS Code, Claude, Open WebUI)
code .  # O sigue instrucciones abajo para Claude/Open WebUI

# 5. ¡Crear tu primer roadmap!
# En tu IA: @GoalOS quiero [tu objetivo]
```

**¿Sin tokens?** ¡No pasa nada! El board HTML funciona offline sin configuración.

---

## ✨ ¿Qué hace GoalOS?

1. **Extraes tu objetivo** → Le dices qué quieres lograr (en lenguaje natural)
2. **Te hace 4-6 preguntas** → Clarifica tu contexto, recursos, timeline
3. **Genera el plan completo** → Phases, tasks, estimaciones, dependencias
4. **Crea un board visual** → HTML interactivo tipo Miro que se abre en tu navegador
5. **Trackeas progreso** → Click en tasks para marcar avance (se guarda automáticamente)

**Todo en 2-5 minutos** 🚀

> 💡 **Nota**: El board HTML funciona **offline** y **sin tokens**. Notion y Miro son **opcionales** solo si quieres colaboración en cloud.

---

## 🎬 Demo Rápido

```
Usuario: @GoalOS quiero aprender inglés en 2 meses

GoalOS: ¡Perfecto! Para armar el mejor plan, cuéntame:
        ¿Cuál es tu nivel actual?...

[4 preguntas después]

GoalOS: ✅ Plan Completado: Aprender Inglés Conversacional

        📊 Roadmap:
        - 4 phases / 24 tasks
        - 60 días estimados
        - 180h total

        📁 Files:
        - output/roadmap.json
        - output/visual-board.html (se abrió en navegador)

        [Board visual tipo Miro con fases, tasks, dependencias]
```

---

## 📦 Instalación Ultra-Simple

### Paso 1: Clonar

```bash
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS
```

### Paso 2: (Opcional) Conectar Notion y Miro

**Si quieres exportar tus roadmaps a Notion o Miro**, configura los tokens:

#### 🔷 Notion Setup (30 segundos)

1. **Obtén tu token de Notion**:
   - Ve a [https://www.notion.so/my-integrations](https://www.notion.so/my-integrations)
   - Click en **"+ New integration"**
   - Nombre: `GoalOS`
   - Capabilities: ✅ Read content, ✅ Insert content, ✅ Update content
   - Click **"Submit"** y copia el **Internal Integration Token**

2. **Obtén el Page ID de tu workspace**:
   - Abre cualquier página de Notion donde quieras crear roadmaps
   - Copia la URL: `https://www.notion.so/tu-workspace/ESTE-ES-EL-PAGE-ID-123abc456def`
   - El Page ID es la parte después del último `/` (ej: `123abc456def789`)

3. **Comparte la página con tu integración**:
   - En esa página de Notion, click en **"..."** (arriba derecha)
   - **"Add connections"** → Busca **"GoalOS"** → Add

4. **Configura las variables**:
```bash
export NOTION_API_TOKEN="secret_tu_token_aqui"
export NOTION_PARENT_PAGE_ID="123abc456def789"
```

#### 🎨 Miro Setup (20 segundos)

1. **Obtén tu token de Miro**:
   - Ve a [https://miro.com/app/settings/user-profile/apps](https://miro.com/app/settings/user-profile/apps)
   - En la sección **"Your apps"**, click **"Create new app"**
   - Nombre: `GoalOS`
   - Click **"Create"**
   - En la pestaña **"OAuth & Permissions"**, copia el **Access token**

2. **Configura la variable**:
```bash
export MIRO_ACCESS_TOKEN="tu_token_miro_aqui"
```

**💡 Tip**: Guarda estos exports en tu `~/.zshrc` o `~/.bashrc` para que sean permanentes:

```bash
echo 'export NOTION_API_TOKEN="secret_tu_token"' >> ~/.zshrc
echo 'export NOTION_PARENT_PAGE_ID="tu_page_id"' >> ~/.zshrc
echo 'export MIRO_ACCESS_TOKEN="tu_token_miro"' >> ~/.zshrc
source ~/.zshrc
```

✅ **Verifica que estén configurados**:
```bash
# Opción 1: Manual
echo $NOTION_API_TOKEN
echo $NOTION_PARENT_PAGE_ID
echo $MIRO_ACCESS_TOKEN

# Opción 2: Script automático (recomendado)
./validate-tokens.sh
```

El script `validate-tokens.sh` hace lo siguiente:
- ✅ Verifica que las variables estén configuradas
- ✅ Valida que los tokens sean correctos (hace test API calls)
- ✅ Muestra cuántos boards tienes en Miro
- ✅ Te dice qué puedes exportar

**Ejemplo de output**:
```
🔍 Validando tokens de GoalOS...

📝 Validando Notion...
✅ NOTION_API_TOKEN configurado
✅ Token de Notion VÁLIDO
✅ NOTION_PARENT_PAGE_ID configurado

🎨 Validando Miro...
✅ MIRO_ACCESS_TOKEN configurado
✅ Token de Miro VÁLIDO
   Boards disponibles: 12

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ Todos los tokens configurados

🚀 Puedes usar:
   @GoalOS exporta a Notion
   @GoalOS exporta a Miro
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

### Paso 3: Elegir tu IA favorita

#### 🔷 GitHub Copilot (VS Code)

**Requisitos**: VS Code + GitHub Copilot extension

```bash
# Ya está listo! Solo abre esta carpeta en VS Code
code .
```

En Copilot Chat, escribe:
```
@GoalOS quiero [tu objetivo aquí]
```

✅ **Funciona inmediatamente** — Copilot lee `.github/copilot-instructions.md` automáticamente

#### 🔶 Claude (Projects)

**Requisitos**: Claude Pro + Projects

1. Abre [Claude](https://claude.ai)
2. Crea un nuevo **Project**
3. Ve a **Project Settings** → **Custom Instructions**
4. Copia y pega el contenido de [`CLAUDE.md`](CLAUDE.md)
5. Guarda

Ahora en ese proyecto, escribe:
```
GoalOS quiero [tu objetivo aquí]
```

✅ **Funciona inmediatamente** — Claude usa las instrucciones del proyecto

#### 🔴 Open WebUI / Ollama

**Requisitos**: Open WebUI instalado

1. Abre **Open WebUI** → **Workspace** → **Models**
2. Clic en **"+ Create Model"**
3. Llena:
   - Name: `GoalOS`
   - Description: `Goal Architect - Roadmaps visuales`
   - Base Model: `llama3` (o tu favorito)
   - System Prompt: Copia desde [`OPENWEBUI.md`](OPENWEBUI.md) sección "SYSTEM PROMPT"
4. Save

Selecciona "GoalOS" en el dropdown y escribe:
```
GoalOS quiero [tu objetivo aquí]
```

✅ **Funciona inmediatamente** — El modelo usa el system prompt configurado

---

## 🚀 Uso

### Modo Simple (Recomendado)

Simplemente di tu objetivo:

```
@GoalOS quiero lanzar mi SaaS en 90 días
```

```
@GoalOS necesito automatizar mi onboarding de clientes
```

```
@GoalOS planifica escalar mi negocio a $10k MRR
```

GoalOS hace el resto automáticamente.

### Ejemplos de Objetivos

#### 🚀 **Productos**
```
Launch B2B SaaS with 100 users by Q3
Build mobile app for fitness tracking
Create API para integración con Stripe
```

#### 🏢 **Procesos**
```
Automatizar onboarding de clientes
Optimizar proceso de facturación
Crear workflow de content marketing
```

#### 📚 **Aprendizaje**
```
Aprender Python para data science en 3 meses
Certificación AWS Solutions Architect
Inglés nivel conversacional en 60 días
```

---

## 📊 ¿Qué obtienes?

### 1. Goal Specification
```json
{
  "goal": {
    "title": "Launch B2B SaaS",
    "statement": "Lanzar plataforma SaaS...",
    "success_criteria": [
      "100 usuarios pagos",
      "$5k MRR",
      "NPS > 40"
    ],
    "timeline": "90 días"
  }
}
```

### 2. Roadmap Estructurado
```json
{
  "phases": [
    {
      "id": "phase-1",
      "name": "Discovery & Validation",
      "duration_weeks": 2,
      "tasks": [
        {
          "id": "task-1-1",
          "title": "User interviews (20 customers)",
          "estimated_hours": 24,
          "deliverable": "Problem validation doc",
          "status": "pending"
        }
      ]
    }
  ]
}
```

### 3. Board Visual Interactivo

![GoalOS Board Preview](https://via.placeholder.com/800x400/667eea/ffffff?text=Visual+Board+Preview)

**Features del board**:
- ✅ Click en tasks para cambiar status (pending → in-progress → done)
- ✅ Progress bar automático
- ✅ Persiste en localStorage
- ✅ Export JSON
- ✅ Responsive (mobile-friendly)

---

## 🎯 Pipeline Completo

GoalOS ejecuta automáticamente 5 fases:

```
[1] GOAL EXTRACTION
    └─ Goal Statement + Success Criteria + Timeline + Constraints

[2] DISCOVERY (condicional)
    └─ Bottlenecks + Integraciones + ROI + Contexto profundo

[3] SKILL MATCHING
    └─ Skills relevantes del ecosistema

[4] GOAL DECOMPOSITION
    └─ Phases (2-5) + Tasks (3-8 por phase) + Dependencies

[5] VISUAL GENERATION
    └─ HTML Board interactivo + JSON exportable
```

**NUNCA salta fases** — Cada fase tiene gates de validación

---

## 🔄 Comandos Avanzados

### Regenerar con más detalle
```
@GoalOS regenera con más detalle
```
→ Expande cada task en 2-3 sub-tasks más específicas

### Agregar fase
```
@GoalOS agrega fase de testing
```
→ Inserta nueva fase sin regenerar todo el roadmap

### Ajustar timeline
```
@GoalOS ajusta timeline a 60 días
```
→ Rebalancea fases y tasks para nuevo deadline

### Exportar a otras plataformas

Después de generar tu roadmap, puedes exportarlo:

#### 📝 Exportar a Notion
```
@GoalOS exporta output/roadmap.json a Notion
```

**Qué hace**:
- Crea una página nueva en tu Notion workspace
- Crea una database con todas las tasks
- Propiedades: Phase, Status, Estimated Hours, Deliverable
- Link directo a la página creada

**Requisitos**: `NOTION_API_TOKEN` y `NOTION_PARENT_PAGE_ID` configurados (ver Paso 2)

---

#### 🎨 Exportar a Miro
```
@GoalOS exporta output/roadmap.json a Miro
```

**Qué hace**:
- Crea un board nuevo en tu Miro workspace
- Frames por cada phase
- Cards para cada task con colores
- Conexiones visuales para dependencias
- Link directo al board creado

**Requisitos**: `MIRO_ACCESS_TOKEN` configurado (ver Paso 2)

---

#### 🐙 Exportar a GitHub Issues
```
@GoalOS convierte output/roadmap.json a GitHub issues
```

**Qué hace**:
- Crea un issue "parent" con el goal
- Un issue por cada task
- Labels: `goal`, `phase-1`, `phase-2`, etc.
- Dependencies como "blocked by #123"

**Requisitos**: Estar en un repo de Git con `gh` CLI autenticado

---

## 📁 Estructura del Proyecto

```
GoalOS/
├── .github/
│   ├── copilot-instructions.md   # Config para GitHub Copilot
│   └── agents/
│       └── goal-architect.agent.md  # Agente principal
├── skills/                        # Skills del ecosistema
│   ├── goal-extractor/
│   ├── discovery-interview/
│   ├── skill-matcher/
│   ├── goal-decomposer/
│   └── miro-generator/
├── output/                        # Output generado (git-ignored)
│   ├── roadmap.json
│   └── visual-board.html
├── CLAUDE.md                      # Instrucciones para Claude
├── OPENWEBUI.md                   # Instrucciones para Open WebUI
└── README.md                      # Este archivo
```

---

## 🎓 Cómo Funciona

### 1. Detección Inteligente de Tipo

GoalOS analiza tu objetivo y detecta el tipo:

- **🏢 PROCESS** → Automatización, workflows, onboarding
- **🚀 PRODUCT** → SaaS, apps, MVPs, APIs
- **📚 LEARNING** → Cursos, certificaciones, skills

Según el tipo, hace preguntas específicas de discovery.

### 2. Skills Relevantes

GoalOS busca automáticamente skills del ecosistema que puedan ayudar:

```yaml
Ecosistema de Skills:
  - discovery-interview: Elicitación profunda
  - n8n-workflow-generator: Automatizaciones no-code
  - workflow-bottleneck-analyzer: Analizar procesos con VSM
  - solution-architect: Diseñar arquitecturas
  - github-issuer: Crear issues automáticamente
```

### 3. Estimaciones Inteligentes

Usa heurísticas probadas:
- Research: 4-8h
- Design: 4-12h
- Coding (small): 8-16h
- Coding (medium): 16-40h
- Testing: 20-30% del dev time

### 4. Dependencies Automáticas

Detecta y crea dependencias lógicas entre tasks:
```
task-1-3 (Define MVP) → task-2-1 (Setup dev env)
task-2-5 (Build core features) → task-3-1 (Testing)
```

---

## 🛠️ Troubleshooting

### "No encuentra el agente @GoalOS"

**Copilot**: Asegúrate de que estás en la carpeta raíz de GoalOS en VS Code

**Claude**: Verifica que copiaste las instrucciones completas en Project Settings

**Open WebUI**: Revisa que el modelo "GoalOS" esté seleccionado en el dropdown

---

### "No genera el board visual"

Verifica que la carpeta `output/` existe. Créala si no:
```bash
mkdir output
```

---

### "Las tasks son muy genéricas"

Usa el comando:
```
@GoalOS regenera con más detalle
```

O da más contexto en las respuestas iniciales.

---

### "Error al exportar a Notion"

**Error: "Could not find database"**
- Verifica que `NOTION_PARENT_PAGE_ID` sea correcto
- Asegúrate de haber compartido la página con tu integración "GoalOS"

**Error: "Unauthorized"**
- Verifica que `NOTION_API_TOKEN` esté configurado correctamente
- Debe empezar con `secret_`

**Validar tokens de Notion**:
```bash
curl -X GET 'https://api.notion.com/v1/users/me' \
  -H "Authorization: Bearer $NOTION_API_TOKEN" \
  -H "Notion-Version: 2022-06-28"
```

Si funciona, verás tu info de usuario.

---

### "Error al exportar a Miro"

**Error: "Unauthorized" o "Invalid token"**
- Verifica que `MIRO_ACCESS_TOKEN` esté configurado correctamente
- Revisa que el token tenga permisos de `boards:write`

**Validar token de Miro**:
```bash
curl -X GET 'https://api.miro.com/v2/boards' \
  -H "Authorization: Bearer $MIRO_ACCESS_TOKEN"
```

Si funciona, verás la lista de tus boards.

---

### "No tengo Notion/Miro pero quiero roadmaps visuales"

**No te preocupes!** El board HTML local funciona sin tokens:

```
@GoalOS quiero [tu objetivo]
```

Al final genera `output/visual-board.html` que:
- ✅ Funciona offline
- ✅ No requiere ningún token
- ✅ Es interactivo (click para cambiar status)
- ✅ Guarda progreso en tu navegador

**Solo abre el archivo en tu navegador** y ya! 🎉

---

### "Quiero cambiar el diseño del board"

Edita `templates/miro-board-template.html` (próximamente)

---

## 🤝 Contribuir

¿Quieres agregar un skill nuevo o mejorar GoalOS?

1. Fork este repo
2. Crea tu feature branch (`git checkout -b feature/amazing-skill`)
3. Agrega tu skill en `skills/tu-skill/SKILL.md`
4. Commit tus cambios (`git commit -m 'Add amazing skill'`)
5. Push al branch (`git push origin feature/amazing-skill`)
6. Abre un Pull Request

---

## 📄 Licencia

MIT License — Úsalo libremente, comparte, modifica

---

## 🌟 Créditos

**GoalOS** es parte del ecosistema [RiseOS](https://github.com/Brayan-Oviedo/RiseOS)

Construido con:
- GitHub Copilot API
- Claude Projects
- Open WebUI / Ollama
- Vanilla JavaScript (board visual)

**APIs opcionales**:
- Notion API (para colaboración)
- Miro API (para boards visuales)
- GitHub CLI (para issue tracking)

---

## 📚 Documentación Completa

- [**QUICKSTART.md**](QUICKSTART.md) — Setup en 3 minutos
- [**EXAMPLES.md**](EXAMPLES.md) — Ejemplos completos de uso real
- [**CLAUDE.md**](CLAUDE.md) — Setup detallado para Claude
- [**OPENWEBUI.md**](OPENWEBUI.md) — Setup detallado para Open WebUI
- [**copilot-instructions.md**](.github/copilot-instructions.md) — Config de Copilot
- [**validate-tokens.sh**](validate-tokens.sh) — Script para validar tokens

---

## 📝 Resumen Ejecutivo de Setup

### ⚡ Setup Mínimo (Sin tokens - 30 segundos)
```bash
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS
code .  # Abrir en VS Code

# En Copilot Chat:
@GoalOS quiero [tu objetivo]
```
**✅ Output**: Board HTML local interactivo

---

### 📝 Setup con Notion (1 minuto)
```bash
# 1. Clonar repo
git clone https://github.com/Brayan-Oviedo/GoalOS.git && cd GoalOS

# 2. Configurar Notion (30 seg en notion.so/my-integrations)
export NOTION_API_TOKEN="secret_tu_token_aqui"
export NOTION_PARENT_PAGE_ID="123abc456def"

# 3. Validar
./validate-tokens.sh

# 4. Usar
code .
# @GoalOS quiero [objetivo]
# @GoalOS exporta a Notion
```

---

### 🎨 Setup con Miro (1 minuto)
```bash
# 1. Clonar repo
git clone https://github.com/Brayan-Oviedo/GoalOS.git && cd GoalOS

# 2. Configurar Miro (20 seg en miro.com/app/settings/user-profile/apps)
export MIRO_ACCESS_TOKEN="tu_token_miro_aqui"

# 3. Validar
./validate-tokens.sh

# 4. Usar
code .
# @GoalOS quiero [objetivo]
# @GoalOS exporta a Miro
```

---

### 🚀 Setup TODO (Notion + Miro - 1.5 min)
```bash
# Configurar ambos
export NOTION_API_TOKEN="secret_..."
export NOTION_PARENT_PAGE_ID="..."
export MIRO_ACCESS_TOKEN="..."

# Validar
./validate-tokens.sh
# ✅ Todos los tokens configurados
# 🚀 Puedes exportar a Notion y Miro

# Hacer permanente (agregar a ~/.zshrc)
cat >> ~/.zshrc << 'EOF'
export NOTION_API_TOKEN="secret_..."
export NOTION_PARENT_PAGE_ID="..."
export MIRO_ACCESS_TOKEN="..."
EOF
source ~/.zshrc
```

---

## 💬 Soporte

¿Tienes preguntas? Abre un [Issue](https://github.com/Brayan-Oviedo/GoalOS/issues)

---

**¿Listo para empezar?** 

```bash
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS

# Opcional: Configurar tokens
export NOTION_API_TOKEN="secret_..."
export MIRO_ACCESS_TOKEN="..."
./validate-tokens.sh

# Abrir en tu IA favorita
code .  # O sigue instrucciones para Claude/Open WebUI

# Crear tu primer roadmap
# @GoalOS quiero [tu objetivo]
```

🚀 **Happy Planning!**
