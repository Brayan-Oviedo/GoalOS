# 🚀 GoalOS — Quick Start

> **De 0 a tu primer roadmap en 2 minutos**

---

## ⚡ Instalación Automática (Recomendado)

```bash
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS
./setup.sh
```

**El script interactivo te pregunta:**
1. ¿Dónde lo usarás? (Copilot / Claude / Open WebUI)
2. ¿Quieres configurar Notion/Miro? (opcional)
3. Listo. Abre y usa.

**Ventajas:**
- ✅ Configuración guiada paso a paso
- ✅ Validación automática de tokens
- ✅ Instrucciones exactas con URLs
- ✅ Guarda tokens permanentemente (opcional)

---

## 🔧 Instalación Manual (Si prefieres control)

### Paso 1: Clonar (10 segundos)

```bash
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS
```

---

### Paso 2: Elegir Plataforma (1 minuto)

<details>
<summary><strong>GitHub Copilot (VS Code)</strong> [Recomendado]</summary>

```bash
code .
```

En Copilot Chat:
```
@GoalOS quiero [tu objetivo]
```

✅ **LISTO** — Funciona automáticamente

</details>

<details>
<summary><strong>Claude (Projects)</strong></summary>

1. Abre https://claude.ai
2. Crea un **Project**
3. **Project Settings** → **Custom Instructions**
4. Copia TODO [CLAUDE.md](CLAUDE.md)
5. Pega y guarda

En el proyecto:
```
GoalOS quiero [tu objetivo]
```

✅ **LISTO**

</details>

<details>
<summary><strong>Open WebUI (Ollama)</strong></summary>

1. Abre Open WebUI (http://localhost:3000)
2. **Workspace** → **Models** → **+ Create Model**
3. Name: `GoalOS`
4. Base Model: `llama3`
5. System Prompt: Copia desde [OPENWEBUI.md](OPENWEBUI.md)
6. Guarda

Selecciona modelo `GoalOS` y:
```
GoalOS quiero [tu objetivo]
```

✅ **LISTO**

</details>

---

### Paso 3: (Opcional) Configurar Notion/Miro

**⚠️ Solo si quieres exportar a la nube. El board HTML funciona offline sin esto.**

<details>
<summary><strong>Configurar Notion</strong> (3 minutos)</summary>

**Paso A: Crear integración**

1. https://www.notion.so/my-integrations
2. **+ New integration**
3. Name: `GoalOS`
4. Capabilities: ✅ Read, ✅ Insert, ✅ Update
5. Submit → Copia el token (`secret_...`)

**Paso B: Obtener Page ID**

1. Abre página de Notion donde quieras guardar roadmaps
2. **...** → **Add connections** → `GoalOS`
3. URL de la página:
   ```
   https://notion.so/workspace/Mi-Pagina-123abc456def789
                                           ^^^^^^^^^^^^^^^^
   ```
4. Page ID = `123abc456def789`

**Paso C: Configurar**

```bash
export NOTION_API_TOKEN="secret_tu_token"
export NOTION_PARENT_PAGE_ID="tu_page_id"
```

**Validar:**
```bash
./validate-tokens.sh
```

</details>

<details>
<summary><strong>Configurar Miro</strong> (2 minutos)</summary>

**Paso A: Crear app**

1. https://miro.com/app/settings/user-profile/apps
2. **Create new app**
3. Name: `GoalOS`
4. Create

**Paso B: Generar token**

1. En tu app → **OAuth & Permissions**
2. **Access token** → Generate o copia
3. Copia el token

**Paso C: Configurar**

```bash
export MIRO_ACCESS_TOKEN="tu_token"
```

**Validar:**
```bash
./validate-tokens.sh
```

</details>

**Hacer permanentes:**
```bash
# Agrega a ~/.zshrc para que persistan
echo 'export NOTION_API_TOKEN="secret_..."' >> ~/.zshrc
echo 'export NOTION_PARENT_PAGE_ID="..."' >> ~/.zshrc
echo 'export MIRO_ACCESS_TOKEN="..."' >> ~/.zshrc
source ~/.zshrc
```

---

## 🎯 Primer Uso

**Ejemplo 1: Learning Goal**

```
@GoalOS quiero aprender Python en 3 meses
```

GoalOS pregunta:
- ¿Nivel actual?
- ¿Objetivo final? (data science / web / automation)
- ¿Horas disponibles por semana?
- ¿Presupuesto para cursos?

Genera:
- 12 semanas
- 4 fases (Basics → Intermediate → Projects → Portfolio)
- 28 tasks con estimaciones
- Board HTML interactivo

---

**Ejemplo 2: Product Launch**

```
@GoalOS quiero lanzar mi SaaS en 90 días
```

GoalOS pregunta:
- ¿Qué problema resuelve?
- ¿MVP o desde cero?
- ¿Horas semanales?
- ¿Tienes equipo?
- ¿Budget marketing?

Genera:
- 13 semanas
- 5 fases (Discovery → Build → Test → Launch → Growth)
- 32 tasks accionables
- Roadmap visual

---

**Ejemplo 3: Automation**

```
@GoalOS quiero automatizar el onboarding de clientes
```

GoalOS pregunta:
- ¿Proceso actual? (manual / semi-auto)
- ¿Cuántos clientes/mes?
- ¿Herramientas actuales?
- ¿Pain points?

Genera:
- 6 semanas
- 4 fases (Map → Design → Build → Deploy)
- 18 tasks
- Workflows n8n/Zapier

---

## 📁 Archivos Generados

```
output/
├── roadmap.json              # JSON estructurado
├── visual-board.html         # Board interactivo (se abre auto)
├── notion-export.json        # (Si configuras Notion)
└── miro-export.json          # (Si configuras Miro)
```

---

## 🆘 Troubleshooting

### "No aparece @GoalOS en Copilot"

```bash
# 1. Asegúrate de estar en la carpeta
cd /path/to/GoalOS

# 2. Abre VS Code desde ahí
code .

# 3. Reload window
# Cmd+Shift+P → "Developer: Reload Window"
```

---

### "Tokens de Notion/Miro no funcionan"

```bash
# Valida
./validate-tokens.sh

# Si falla Notion:
# ¿Compartiste la página con la integración?
# (...) → Add connections → GoalOS

# Si falla Miro:
# ¿El token tiene permisos boards:write?
```

---

### "No se genera el board HTML"

```bash
# Verifica que existe el JSON
ls -la output/roadmap.json

# Pídele a GoalOS que lo regenere
# @GoalOS genera board desde output/roadmap.json
```

---

## 📚 Más Info

- **README completo:** [README.md](README.md)
- **Casos de uso:** [EXAMPLES.md](EXAMPLES.md)
- **Claude setup:** [CLAUDE.md](CLAUDE.md)
- **Open WebUI setup:** [OPENWEBUI.md](OPENWEBUI.md)

---

**¡Listo para transformar tus objetivos en roadmaps!** 🚀
5. Save

Selecciona "GoalOS" y:
```
GoalOS quiero [tu objetivo]
```

✅ **LISTO** — Ya funciona

---

## Paso 3: Crear tu primer roadmap

### Ejemplo 1: Learning Goal

```
@GoalOS quiero aprender Python para data science en 3 meses
```

**GoalOS preguntará**:
- Nivel actual
- Tiempo disponible
- Objetivo (job, cert, hobby)

**Generará**:
- Roadmap con 4-5 phases
- 15-25 tasks con estimaciones
- Board visual HTML interactivo

---

### Ejemplo 2: Product Launch

```
@GoalOS quiero lanzar mi SaaS B2B en 90 días
```

**GoalOS preguntará**:
- Qué problema resuelve
- Quiénes son los usuarios
- Features core
- Budget y team

**Generará**:
- Plan con Discovery → Build → Launch
- Tasks con dependencias
- Estimaciones realistas

---

### Ejemplo 3: Process Automation

```
@GoalOS necesito automatizar el onboarding de clientes
```

**GoalOS preguntará**:
- Pasos actuales
- Bottlenecks
- Frecuencia
- Herramientas

**Generará**:
- Análisis ROI
- Plan de automatización
- Recomendación de tools

---

## 🎯 Output

Después de responder 4-6 preguntas, obtienes:

### 1. `output/roadmap.json`

```json
{
  "goal": {
    "title": "...",
    "success_criteria": [...]
  },
  "phases": [
    {
      "name": "Discovery",
      "tasks": [...]
    }
  ]
}
```

### 2. `output/visual-board.html`

- Board tipo Miro
- Click en tasks para marcar progreso
- Progress bar automático
- Se guarda en tu navegador

**Se abre automáticamente** en tu navegador 🎉

---

## 🔄 Comandos Extra

### Refinar roadmap
```
@GoalOS regenera con más detalle
```
→ Expande tasks en sub-tasks

```
@GoalOS agrega fase de testing
```
→ Inserta fase nueva

```
@GoalOS ajusta timeline a 60 días
```
→ Rebalancea el roadmap

### Exportar (si configuraste tokens en Paso 2)

```
@GoalOS exporta output/roadmap.json a Notion
```
→ Crea página + database en Notion con todas las tasks

```
@GoalOS exporta output/roadmap.json a Miro
```
→ Crea board visual en Miro con frames y cards

```
@GoalOS convierte output/roadmap.json a GitHub issues
```
→ Crea issues con labels y dependencies

---

## 🚨 Si algo falla

### Notion no exporta
```bash
# Verifica token
curl -X GET 'https://api.notion.com/v1/users/me' \
  -H "Authorization: Bearer $NOTION_API_TOKEN" \
  -H "Notion-Version: 2022-06-28"
```

### Miro no exporta
```bash
# Verifica token
curl -X GET 'https://api.miro.com/v2/boards' \
  -H "Authorization: Bearer $MIRO_ACCESS_TOKEN"
```

### No tengo tokens
**¡No pasa nada!** El board HTML local funciona sin tokens. Solo abre `output/visual-board.html` en tu navegador.

---

## 📚 ¿Necesitas más info?

- [**README.md**](README.md) — Documentación completa
- [**CLAUDE.md**](CLAUDE.md) — Setup detallado para Claude
- [**OPENWEBUI.md**](OPENWEBUI.md) — Setup detallado para Open WebUI

---

**Total: 3 minutos de setup, luego solo dices tu objetivo** 🚀
