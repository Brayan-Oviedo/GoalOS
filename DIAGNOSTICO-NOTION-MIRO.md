# 🔍 DIAGNÓSTICO COMPLETO: Por Qué Notion/Miro Aparecen "Vacíos"

## ❌ EL PROBLEMA REAL

Tu roadmap.json **NO tiene** los campos `description`, `assigned_skill`, ni `tools_needed`.

### Verificación en tu roadmap:

```bash
cd /Users/fantasma/Documents/PROYECTOS/RiseOS/plugins/GoalOS/output
jq '.phases[0].tasks[0]' roadmap.json
```

**Resultado:**
```json
{
  "title": "Definir nicho y propuesta de valor única (PVU)",
  "description": null,           ← ❌ NULL
  "assigned_skill": null,        ← ❌ NULL
  "tools_needed": null           ← ❌ NULL
}
```

---

## ✅ LOS SCRIPTS SÍ FUNCIONAN

Probé con `test-roadmap.json` que SÍ tiene todos los campos:

```json
{
  "title": "User interviews (20 clientes potenciales)",
  "description": "Realizar entrevistas en profundidad...",  ← ✅ EXISTE
  "assigned_skill": "discovery-interview",                  ← ✅ EXISTE
  "tools_needed": ["Calendly", "Zoom", "Notion"]           ← ✅ EXISTE
}
```

**Y goalos-notion/goalos-miro SÍ exportan TODA esa información.**

---

## 🐛 ERROR DE MIRO (YA ARREGLADO)

### El Error:
```
Línea 355: ${TASK_PRIORITY^^}  ← Solo funciona en bash 4+
Estás usando zsh → "bad substitution"
```

### La Solución (YA APLICADA):
```bash
# ANTES (solo bash 4+):
${TASK_PRIORITY^^}

# AHORA (compatible con zsh, bash, sh):
PRIORITY_UPPER=$(echo "$TASK_PRIORITY" | tr '[:lower:]' '[:upper:]')
```

**✅ Miro ya NO debería dar error de "bad substitution"**

---

## 🛠️ SOLUCIÓN PARA NOTION "VACÍO"

### Opción 1: Regenera el Roadmap con @GoalOS

**EN COPILOT:**
```
@GoalOS quiero aprender francés en 2 meses

IMPORTANTE: Cada tarea DEBE tener:
- description (2-3 oraciones explicando QUÉ y POR QUÉ)
- assigned_skill (si aplica, ej: learning-fundamentals)
- tools_needed (array de herramientas, ej: ["Duolingo", "Anki"])
- steps (array detallado con order, action, duration)
- priority (high/medium/low)
- deliverable (resultado concreto)
```

**EN CLAUDE:**
```
Quiero aprender francés en 2 meses

Genera el roadmap siguiendo EXACTAMENTE el template de goal-architect.agent.md
con TODOS los 10 campos obligatorios:
- title, description, estimated_hours, steps, priority, dependencies,
  deliverable, assigned_skill, tools_needed, status
```

### Opción 2: Edita roadmap.json Manualmente

Abre `/Users/fantasma/Documents/PROYECTOS/RiseOS/plugins/GoalOS/output/roadmap.json` y agrega:

```json
{
  "id": "task-1-1",
  "title": "Dominar alfabeto francés y sonidos fonéticos básicos",
  "description": "Aprender el alfabeto francés completo y dominar la pronunciación de sonidos nasales (on, an, en, in) que NO existen en español. Esto es la base para hablar correctamente.",
  "estimated_hours": 4,
  "steps": [
    {
      "order": 1,
      "action": "Ver video 'French Alphabet & Pronunciation' (YouTube)",
      "duration": "30min"
    },
    {
      "order": 2,
      "action": "Practicar sonidos nasales con ejercicios de FrenchPod101",
      "duration": "1h"
    },
    {
      "order": 3,
      "action": "Grabar audio pronunciando el alfabeto y comparar",
      "duration": "30min"
    },
    {
      "order": 4,
      "action": "Flashcards Anki: alfabeto + sonidos nasales (50 repeticiones)",
      "duration": "2h"
    }
  ],
  "priority": "high",
  "dependencies": [],
  "deliverable": "Pronunciar correctamente el alfabeto + sonidos nasales (on, an, en, in)",
  "assigned_skill": "learning-fundamentals",
  "tools_needed": ["YouTube", "FrenchPod101", "Anki", "Voice Recorder"],
  "status": "pending"
}
```

Luego exporta de nuevo:
```bash
cd /Users/fantasma/Documents/PROYECTOS/RiseOS/export/GoalOS
./goalos-notion /Users/fantasma/Documents/PROYECTOS/RiseOS/plugins/GoalOS/output/roadmap.json
./goalos-miro /Users/fantasma/Documents/PROYECTOS/RiseOS/plugins/GoalOS/output/roadmap.json
```

---

## 📋 CAMPOS OBLIGATORIOS (10)

**Cada tarea DEBE tener:**

1. `title` — Título de la tarea
2. `description` — Explicación detallada (2-3 oraciones de QUÉ y POR QUÉ)
3. `estimated_hours` — Horas estimadas (número)
4. `steps` — Array de pasos con `order`, `action`, `duration`
5. `priority` — `high` / `medium` / `low`
6. `dependencies` — Array de IDs de tareas previas (puede ser `[]`)
7. `deliverable` — Resultado concreto y verificable
8. `assigned_skill` — Skill relevante (puede ser `null`)
9. `tools_needed` — Array de herramientas (puede ser `[]`)
10. `status` — `pending` / `in-progress` / `done` / `blocked`

---

## ✅ VERIFICACIÓN FINAL

```bash
cd /Users/fantasma/Documents/PROYECTOS/RiseOS/export/GoalOS

# 1. Verifica sintaxis de scripts
bash -n goalos-notion && bash -n goalos-miro
# Debe decir nada (silencio = OK)

# 2. Verifica que tu roadmap tenga TODOS los campos
jq '.phases[0].tasks[0] | {title, description, assigned_skill, tools_needed, steps: (.steps | length)}' /Users/fantasma/Documents/PROYECTOS/RiseOS/plugins/GoalOS/output/roadmap.json

# 3. Exporta con roadmap completo
./goalos-notion /Users/fantasma/Documents/PROYECTOS/RiseOS/plugins/GoalOS/output/roadmap.json
./goalos-miro /Users/fantasma/Documents/PROYECTOS/RiseOS/plugins/GoalOS/output/roadmap.json
```

---

## 🎯 RESUMEN

1. **Error de Miro (bad substitution)** → ✅ YA ARREGLADO (línea 355)
2. **Notion "vacío"** → ❌ Tu roadmap.json NO tiene description/skill/tools
3. **Solución** → Regenera con @GoalOS pidiendo TODOS los campos O edita el JSON manualmente
4. **Los scripts funcionan 100%** → Solo pueden exportar lo que existe en el JSON

---

## 💡 Prueba Rápida

```bash
cd /Users/fantasma/Documents/PROYECTOS/RiseOS/export/GoalOS

# Exporta el test-roadmap.json (que SÍ tiene todos los campos)
./goalos-notion test-roadmap.json
./goalos-miro test-roadmap.json

# Verás que SÍ exporta TODA la información
```

Si con `test-roadmap.json` funciona perfecto, confirma que el problema es tu `roadmap.json`, no los scripts.
