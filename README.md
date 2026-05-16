# 🎯 GoalOS — Goal Architect AI

> **Tu IA personal para transformar ideas vagas en planes accionables**  
> De "quiero aprender inglés" a un roadmap visual con 24 tasks en 3 minutos

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![AI-Powered](https://img.shields.io/badge/AI-Powered-blue)](https://github.com)

---

## 😤 El Problema Que Resolvemos

**¿Te suena familiar?**

- 💭 **"Tengo mil ideas, pero no sé por dónde empezar"**
- 📝 **"Llevo 3 horas en Google Docs y sigo sin un plan claro"**
- 🤯 **"Mi objetivo es muy grande, no sé cómo dividirlo"**
- ⏰ **"No tengo tiempo para planificar, solo quiero ejecutar"**
- 🔄 **"Empiezo proyectos pero nunca los termino por falta de estructura"**

**La realidad:**
- Planificar manualmente toma **2-5 horas**
- El 70% de los proyectos personales fracasan por **mala planificación inicial**
- Las herramientas tipo Trello/Asana requieren que **TÚ hagas el análisis**
- Los consultores cobran **$500-2000** por armar un roadmap

---

## ✨ La Solución: GoalOS

**Imagina esto:**

Tú: _"Quiero aprender inglés para trabajar en una empresa gringa"_

**GoalOS (3 minutos después):**

```
✅ Roadmap completo: "Inglés Profesional B2"
   • 4 fases estructuradas
   • 24 tasks accionables con estimaciones
   • Dependencias claras (qué hacer primero)
   • Board visual tipo Miro (se abre en tu navegador)
   • Progreso trackeable (click para marcar como done)
```

**Sin escribir una sola línea de texto.** Sin pensar en estructura. Sin perder horas en Google.

---

## ⚡ Setup Ultra-Simple (Copia-Pega)

### Opción 1: Instalación Automática (Recomendado)

```bash
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS
./setup.sh
```

**Eso es todo.** El script te pregunta:
- ¿Dónde vas a usarlo? (Copilot / Claude / Open WebUI)
- ¿Quieres exportar a Notion/Miro? (opcional)
- Y listo. Todo configurado.

---

### Opción 2: Setup Manual (Si prefieres control)

```bash
# 1. Clonar
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS

# 2. Abrir en tu IA favorita
code .              # GitHub Copilot (VS Code)
# O sigue CLAUDE.md para Claude Projects
# O sigue OPENWEBUI.md para Open WebUI

# 3. ¡Pruébalo!
# En tu IA: @GoalOS quiero [tu objetivo]
```

**¿Notion/Miro?** Son **100% opcionales**. El board HTML funciona offline sin configuración.

---

## 🎬 Demo: De 0 a Roadmap en 3 Minutos

**Input:**
```
@GoalOS quiero lanzar mi SaaS en 90 días
```

**GoalOS hace 5 preguntas:**
```
1. ¿Qué problema resuelve tu SaaS?
2. ¿Ya tienes MVP o empiezas de cero?
3. ¿Cuántas horas semanales puedes dedicar?
4. ¿Tienes equipo o vas solo?
5. ¿Cuál es tu budget de marketing?
```

**Output (3 minutos después):**
```
✅ Roadmap: "Lanzar SaaS de Automatización de Emails"

📊 Resumen:
   • 5 phases (Discovery → Build → Test → Launch → Growth)
   • 32 tasks accionables
   • 90 días estimados
   • 280h de esfuerzo total

📁 Files generados:
   ✓ output/roadmap.json             (datos estructurados)
   ✓ output/visual-board.html        (board interactivo - SE ABRIÓ EN TU NAVEGADOR)

🎨 Board visual incluye:
   ✓ Fases con fechas estimadas
   ✓ Tasks con effort, dependencias, hitos
   ✓ Progress tracking (click para marcar)
   ✓ Funciona offline (se guarda en localStorage)
```

**Y ahora tienes un plan claro.** Sin gastarte 5 horas. Sin pagar un consultor.

---

## 💡 ¿Qué Hace GoalOS Exactamente?

### Pipeline Inteligente de 5 Fases

```
Tu objetivo vago → [GoalOS] → Roadmap accionable tipo Miro
```

**Internamente:**

1. **📋 Extraction** — Extrae tu objetivo del chat
2. **🔍 Discovery** — Te hace 4-6 preguntas estratégicas (contexto, recursos, constraints)
3. **🎯 Matching** — Decide qué tipo de plan necesitas (learning / product / automation / process)
4. **🧩 Decomposition** — Genera phases → milestones → tasks con estimaciones
5. **🎨 Visual** — Crea board HTML interactivo + exporta a Notion/Miro (opcional)

**Todo automático.** Tú solo respondes preguntas.

---

## 🚀 Casos de Uso Reales

### 🎓 Learning Goals
```
Input: "Quiero aprender Python para data science"
Output: 12 semanas • 4 fases • 28 tasks • Roadmap con proyectos progresivos
```

### 🚀 Product Launch
```
Input: "Lanzar mi app de meditación en 3 meses"
Output: MVP → Beta → Launch → Growth • 32 tasks • Dependencies claras
```

### 🤖 Automation Projects
```
Input: "Automatizar onboarding de clientes con n8n"
Output: 5 workflows • 18 tasks • Integrations mapping • Timeline 6 semanas
```

### 📊 Process Optimization
```
Input: "Reducir tiempo de facturación de 2h a 15min"
Output: VSM actual → Bottlenecks → Solutions → Implementation plan
```

**Más ejemplos en [EXAMPLES.md](EXAMPLES.md)**

---

## 📦 Instalación Súper Simple

### Opción A: Setup Automático (1 comando)

```bash
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS
./setup.sh
```

**El script interactivo te pregunta:**
1. ¿Dónde lo usarás? (Copilot / Claude / Open WebUI)
2. ¿Quieres configurar Notion/Miro? (opcional, con guía paso a paso)
3. Listo. Todo configurado.

---

### Opción B: Setup Manual Ultrarrápido

```bash
# 1. Clonar
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS

# 2. Abrir en tu IA
code .                    # Si usas GitHub Copilot

# 3. ¡Usar!
# En Copilot Chat: @GoalOS quiero [tu objetivo]
```

**Para Claude o Open WebUI:** Lee [CLAUDE.md](CLAUDE.md) o [OPENWEBUI.md](OPENWEBUI.md) (copy-paste en 1 minuto)

---

## 🔧 Configuración Opcional: Notion y Miro

**⚠️ IMPORTANTE:** El board HTML funciona **offline sin tokens**. Solo configura esto si quieres exportar a la nube.

### ¿Cuándo configurar Notion/Miro?

- ✅ Quieres colaborar con tu equipo
- ✅ Quieres acceder desde cualquier dispositivo
- ✅ Prefieres Notion/Miro sobre HTML local

### ¿Cuándo NO los necesitas?

- ✅ Trabajas solo
- ✅ El board HTML en tu navegador te basta
- ✅ No quieres lidiar con APIs (todavía)

---

### 📘 Configurar Notion (Guía Exacta)

**Paso 1: Crear integración (2 minutos)**

1. Abre https://www.notion.so/my-integrations
2. Click **"+ New integration"**
3. Completa:
   - **Name:** `GoalOS`
   - **Associated workspace:** [Tu workspace]
   - **Type:** Internal
4. En **"Capabilities"**, marca:
   - ✅ **Read content**
   - ✅ **Insert content**
   - ✅ **Update content**
5. Click **"Submit"**
6. **Copia el "Internal Integration Token"** (empieza con `secret_...`)

**Paso 2: Obtener Page ID (1 minuto)**

1. Abre cualquier página de Notion donde quieras guardar roadmaps
2. Click en **"..."** (arriba derecha) → **"Add connections"**
3. Busca **"GoalOS"** y selecciónalo (esto da permisos)
4. Copia la URL de la página. Ejemplo:
   ```
   https://www.notion.so/workspace/Mi-Pagina-123abc456def789
                                                ^^^^^^^^^^^^^^^^
   ```
5. El **Page ID** es la parte después del último `-`:
   ```
   123abc456def789
   ```

**Paso 3: Guardar tokens**

```bash
# Opción A: Temporal (esta sesión)
export NOTION_API_TOKEN="secret_tu_token_aqui"
export NOTION_PARENT_PAGE_ID="tu_page_id_aqui"

# Opción B: Permanente
echo 'export NOTION_API_TOKEN="secret_..."' >> ~/.zshrc
echo 'export NOTION_PARENT_PAGE_ID="..."' >> ~/.zshrc
source ~/.zshrc
```

**Validar:**
```bash
./validate-tokens.sh
# Debería mostrar: ✓ Notion API: Connected
```

---

### 🎨 Configurar Miro (Guía Exacta)

**Paso 1: Crear app (2 minutos)**

1. Abre https://miro.com/app/settings/user-profile/apps
2. Scroll a **"Your apps"** → Click **"Create new app"**
3. Completa:
   - **App name:** `GoalOS`
   - **Description:** `Visual roadmap generator`
4. Click **"Create app"**

**Paso 2: Generar token (1 minuto)**

1. En la página de tu app, ve a **"OAuth & Permissions"** (menú izquierdo)
2. Scroll a **"Access token"**
3. Click **"Generate"** (o copia el existente si ya hay uno)
4. **Copia el Access Token**

**Paso 3: Guardar token**

```bash
# Opción A: Temporal
export MIRO_ACCESS_TOKEN="tu_token_aqui"

# Opción B: Permanente
echo 'export MIRO_ACCESS_TOKEN="..."' >> ~/.zshrc
source ~/.zshrc
```

**Validar:**
```bash
./validate-tokens.sh
# Debería mostrar: ✓ Miro API: Connected
```

---

## 🎯 Cómo Usar GoalOS

### En GitHub Copilot (VS Code)

**Setup (ya lo hiciste con `./setup.sh` o `code .`):**

1. Abre VS Code en la carpeta `GoalOS`
2. Presiona `Cmd+Shift+I` (Mac) o `Ctrl+Shift+I` (Windows/Linux)
3. Copilot Chat detecta automáticamente el agente `@GoalOS`

**Uso:**

```
@GoalOS quiero aprender Python para data science
```

GoalOS responde con preguntas → Tú respondes → Genera roadmap + board HTML

**Comandos útiles:**

```
@GoalOS exporta a Notion     # Si configuraste tokens
@GoalOS exporta a Miro       # Si configuraste tokens
@GoalOS muestra el progreso  # Ver % completado
```

---

### En Claude Projects

**Setup (1 vez):**

1. Abre https://claude.ai
2. Crea un **Project** (ej: "GoalOS")
3. **Project Settings** → **Custom Instructions**
4. Abre el archivo [CLAUDE.md](CLAUDE.md)
5. Copia **TODO** su contenido
6. Pega en **Custom Instructions** y guarda

**Uso:**

```
GoalOS quiero lanzar mi SaaS en 90 días
```

(No necesitas `@` en Claude Projects)

---

### En Open WebUI (Ollama)

**Setup (1 vez):**

1. Abre Open WebUI (http://localhost:3000)
2. **Workspace** → **Models** → **+ Create Model**
3. Configura:
   - **Name:** `GoalOS`
   - **Base Model:** `llama3` (o tu favorito)
   - **System Prompt:** Copia desde [OPENWEBUI.md](OPENWEBUI.md) → sección "SYSTEM PROMPT"
4. Guarda

**Uso:**

1. Selecciona el modelo **GoalOS** en el chat
2. Escribe:
   ```
   GoalOS quiero automatizar el onboarding de clientes
   ```

---

## 📁 Archivos Generados

Cuando usas GoalOS, se crean estos archivos en `output/`:

```
output/
├── roadmap.json              # Datos estructurados (JSON)
├── visual-board.html         # Board interactivo (SE ABRE AUTOMÁTICO)
├── notion-export.json        # (Si exportas a Notion)
└── miro-export.json          # (Si exportas a Miro)
```

### 🎨 El Board HTML

**Características:**

- ✅ **Offline:** Funciona sin internet después de cargarlo
- ✅ **Interactive:** Click en tasks para marcar como done
- ✅ **Persistent:** Guarda tu progreso en localStorage
- ✅ **Visual:** Estilo Miro con fases, dependencias, colores
- ✅ **Responsive:** Funciona en desktop y mobile

**Controles:**

- **Click en task** → Marca/desmarca como completada
- **Hover en task** → Ver detalles (effort, dependencies)
- **Scroll/zoom** → Navegar el board

---

## 🤔 FAQ

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

## 🤔 FAQ

### ¿Necesito tokens de Notion/Miro obligatoriamente?

**NO.** El board HTML funciona **100% offline** sin configuración. Notion y Miro son opcionales solo si quieres exportar a la nube.

### ¿Funciona con modelos locales (Ollama)?

**SÍ.** Compatible con Open WebUI + Ollama. Lee [OPENWEBUI.md](OPENWEBUI.md) para configurarlo.

### ¿Puedo usar GoalOS gratis?

**SÍ.** El código es MIT License (100% gratis). Solo necesitas:
- **Copilot:** $10/mes (GitHub Copilot)
- **Claude:** Claude Pro $20/mes (para Projects)
- **Ollama:** 100% gratis (modelos locales)

### ¿Los roadmaps se guardan?

**SÍ.** En 3 lugares:
- `output/roadmap.json` (archivo local)
- Board HTML (localStorage del navegador)
- Notion/Miro (si exportas)

### ¿Puedo editar el roadmap después?

**SÍ.** El board HTML es interactivo:
- Click en tasks para marcar como done
- El progreso se guarda automáticamente
- Puedes regenerar el board desde el JSON

### ¿Qué pasa si no tengo GitHub Copilot ni Claude Pro?

Usa **Open WebUI + Ollama** (100% gratis, local). Guía completa en [OPENWEBUI.md](OPENWEBUI.md).

### ¿Puedo usar GoalOS para mi equipo?

**SÍ.** Exporta a Notion/Miro y comparte con tu equipo. El roadmap es colaborativo.

### ¿Funciona en español?

**SÍ.** GoalOS detecta tu idioma automáticamente. Responde en el idioma que uses.

### ¿Puedo customizar los prompts?

**SÍ.** Edita:
- `.github/agents/goal-architect.agent.md` (lógica del agente)
- `skills/discovery-interview/SKILL.md` (preguntas de discovery)

### ¿Hay límite de roadmaps?

**NO.** Crea infinitos roadmaps. Los archivos se guardan en `output/`.

---

## 🛠️ Troubleshooting

### "No se genera el board HTML"

**Solución:**
```bash
# Verifica que el JSON se haya creado
ls -la output/roadmap.json

# Regenera el board manualmente
open output/roadmap.json  # Copia el contenido
# Luego: @GoalOS genera board desde este JSON
```

### "Tokens inválidos de Notion/Miro"

**Solución:**
```bash
# Valida tus tokens
./validate-tokens.sh

# Si fallan, revisa:
# 1. Notion: ¿Compartiste la página con la integración?
# 2. Miro: ¿El token tiene permisos de boards:write?
```

### "El agente @GoalOS no aparece en Copilot"

**Solución:**
```bash
# Asegúrate de estar en la carpeta correcta
cd /path/to/GoalOS

# Abre VS Code desde ahí
code .

# Copilot debería detectar .github/copilot-instructions.md automáticamente
# Si no: Reload window (Cmd+Shift+P → "Developer: Reload Window")
```

### "En Claude no funciona"

**Solución:**

1. ¿Creaste un **Project** (no chat normal)?
2. ¿Copiaste **TODO** el contenido de [CLAUDE.md](CLAUDE.md)?
3. ¿Lo pegaste en **Project Settings → Custom Instructions**?
4. Escribe `GoalOS quiero...` (sin `@`)

### "En Open WebUI no responde bien"

**Solución:**

1. ¿Copiaste el **System Prompt** completo de [OPENWEBUI.md](OPENWEBUI.md)?
2. ¿Seleccionaste el modelo **GoalOS** en el chat?
3. Prueba con modelo más potente (`llama3:70b` vs `llama3:8b`)

---

## 📚 Documentación Completa

- **[README.md](README.md)** — Este archivo (overview completo)
- **[QUICKSTART.md](QUICKSTART.md)** — Setup en 3 minutos
- **[EXAMPLES.md](EXAMPLES.md)** — 4 casos de uso reales con outputs
- **[CLAUDE.md](CLAUDE.md)** — Setup detallado para Claude Projects
- **[OPENWEBUI.md](OPENWEBUI.md)** — Setup para Open WebUI + Ollama
- **[VALIDATION.md](VALIDATION.md)** — Checklist pre-producción
- **[SUCCESS.md](SUCCESS.md)** — Guía post-instalación

---

## 🤝 Contribuir

¿Encontraste un bug? ¿Tienes una idea?

1. **Issues:** https://github.com/Brayan-Oviedo/GoalOS/issues
2. **Pull Requests:** Bienvenidos
3. **Discussions:** Comparte tus roadmaps generados

---

## 📄 License

MIT License — Úsalo como quieras.

---

## 🙏 Agradecimientos

GoalOS usa:
- **GitHub Copilot** (agente principal)
- **Claude Projects** (instrucciones custom)
- **Open WebUI** (modelos locales)
- **Notion API** (exportación)
- **Miro API** (boards visuales)

---

## 📬 Contacto

- **Issues:** https://github.com/Brayan-Oviedo/GoalOS/issues
- **Email:** (Agregar si quieres)

---

**¡Transforma tus objetivos vagos en roadmaps accionables en minutos!** 🚀

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
