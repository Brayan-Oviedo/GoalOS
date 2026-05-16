# 🚀 GoalOS — Quick Start (3 minutos)

## Paso 1: Clonar

```bash
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS
```

## Paso 2: (Opcional) Conectar Notion y Miro

**Solo si quieres exportar roadmaps a Notion/Miro**. Si solo quieres el board HTML local, **salta este paso**.

### Notion (30 segundos)

```bash
# 1. Ve a https://www.notion.so/my-integrations
# 2. Crea integración "GoalOS" 
# 3. Copia el token y Page ID
export NOTION_API_TOKEN="secret_tu_token"
export NOTION_PARENT_PAGE_ID="tu_page_id"
```

### Miro (20 segundos)

```bash
# 1. Ve a https://miro.com/app/settings/user-profile/apps
# 2. Crea app "GoalOS"
# 3. Copia el Access token
export MIRO_ACCESS_TOKEN="tu_token_miro"
```

**Hazlos permanentes**:
```bash
echo 'export NOTION_API_TOKEN="secret_..."' >> ~/.zshrc
echo 'export NOTION_PARENT_PAGE_ID="..."' >> ~/.zshrc
echo 'export MIRO_ACCESS_TOKEN="..."' >> ~/.zshrc
source ~/.zshrc
```

## Paso 3: Elegir tu IA

### GitHub Copilot (VS Code)

```bash
code .
```

En Copilot Chat:
```
@GoalOS quiero [tu objetivo]
```

✅ **LISTO** — Ya funciona

---

### Claude (Projects)

1. Abre [Claude](https://claude.ai)
2. Crea un **Project**
3. **Project Settings** → **Custom Instructions**
4. Copia todo el contenido de [`CLAUDE.md`](CLAUDE.md)
5. Guarda

En el proyecto:
```
GoalOS quiero [tu objetivo]
```

✅ **LISTO** — Ya funciona

---

### Open WebUI

1. **Workspace** → **Models** → **+ Create Model**
2. Name: `GoalOS`
3. Base Model: `llama3` (o tu favorito)
4. System Prompt: Copia de [`OPENWEBUI.md`](OPENWEBUI.md) → sección "SYSTEM PROMPT"
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
