# 🚨 IMPORTANTE: Por Qué Notion/Miro Pueden Aparecer "Vacíos"

## ❓ El Problema

Generaste un roadmap y cuando lo exportas a Notion/Miro:
- ✅ Las tareas SÍ aparecen
- ❌ Pero les FALTA información (descripción, pasos, tools, skill)

## 🔍 La Causa

**El roadmap.json NO tiene todos los campos necesarios.**

Los scripts `goalos-notion` y `goalos-miro` funcionan PERFECTO, pero **solo pueden exportar lo que existe en el JSON**. Si el JSON no tiene `description`, Notion/Miro no pueden mostrarla.

## ✅ Verificación Rápida

```bash
# Ver si una tarea tiene TODOS los campos
jq '.phases[0].tasks[0] | {title, description, assigned_skill, tools_needed, steps: .steps | length}' output/roadmap.json
```

**Resultado esperado:**
```json
{
  "title": "User interviews (20 clientes potenciales)",
  "description": "Realizar entrevistas en profundidad...",  ← DEBE existir
  "assigned_skill": "discovery-interview",                  ← DEBE existir
  "tools_needed": ["Calendly", "Zoom", "Notion"],          ← DEBE existir
  "steps": 4                                                ← DEBE ser > 0
}
```

**Si falta algún campo:**
```json
{
  "title": "User interviews",
  "description": null,           ← ❌ FALTA
  "assigned_skill": null,        ← ❌ FALTA
  "tools_needed": [],            ← ❌ VACÍO
  "steps": 0                     ← ❌ SIN PASOS
}
```

## 🛠️ La Solución

### Opción 1: Regenera el Roadmap (Recomendado)

Si usas `@GoalOS` en GitHub Copilot, Claude o Open WebUI, el agente **DEBE** generar todos los campos automáticamente. Si no lo hace:

**En GitHub Copilot:**
```
@GoalOS quiero lanzar un SaaS en 90 días

IMPORTANTE: Cada tarea debe tener:
- description (2-3 oraciones de QUÉ y POR QUÉ)
- assigned_skill (si aplica)
- tools_needed (array de herramientas)
- steps (array de pasos con order, action, duration)
```

**En Claude Projects:**
Copia el contenido de `CLAUDE.md` en las instrucciones del proyecto, luego:
```
Quiero lanzar un SaaS en 90 días

Genera el roadmap con TODOS los campos:
- description
- assigned_skill
- tools_needed
- steps
```

### Opción 2: Edita el roadmap.json Manualmente

Abre `output/roadmap.json` y agrega los campos faltantes:

```json
{
  "id": "task-1-1",
  "title": "User interviews",
  "description": "Realizar entrevistas para validar el problema real",
  "estimated_hours": 24,
  "steps": [
    {"order": 1, "action": "Crear script de entrevista", "duration": "2h"},
    {"order": 2, "action": "Reclutar 20 participantes", "duration": "4h"}
  ],
  "priority": "high",
  "dependencies": [],
  "deliverable": "Problem validation doc",
  "assigned_skill": "discovery-interview",
  "tools_needed": ["Calendly", "Zoom", "Notion"],
  "status": "pending"
}
```

Luego exporta de nuevo:
```bash
./goalos-notion output/roadmap.json
./goalos-miro output/roadmap.json
```

## 📋 Campos OBLIGATORIOS

Cada tarea DEBE tener estos 10 campos:

1. `title` — Título de la tarea
2. `description` — Explicación detallada (2-3 oraciones)
3. `estimated_hours` — Horas estimadas (número)
4. `steps` — Array de pasos con `order`, `action`, `duration`
5. `priority` — `high` / `medium` / `low`
6. `dependencies` — Array de IDs de tareas previas
7. `deliverable` — Resultado concreto y verificable
8. `assigned_skill` — Skill relevante (puede ser `null`)
9. `tools_needed` — Array de herramientas (puede ser `[]`)
10. `status` — `pending` / `in-progress` / `done` / `blocked`

## 🧪 Prueba con Roadmap Completo

Incluimos `test-roadmap.json` (si existe) como ejemplo de un roadmap CON todos los campos. Puedes probarlo:

```bash
./goalos-notion test-roadmap.json
./goalos-miro test-roadmap.json
```

Verás que SÍ exporta toda la información: descripción, pasos, skills, tools, prioridad.

## ✅ Verificación Final

Antes de exportar, verifica que tu roadmap tenga TODOS los campos:

```bash
./validate-export.sh
```

Si muestra:
```
✅ PERFECTO — TODO FUNCIONA 100%
```

Entonces goalos-notion y goalos-miro DEBERÍAN exportar toda la información.

---

## 💡 Resumen

1. **Los scripts goalos-notion y goalos-miro SÍ funcionan** ✅
2. **Solo exportan lo que existe en el JSON** ✅
3. **Si el JSON no tiene description, NO pueden mostrarla** ✅
4. **Solución: Regenera el roadmap con todos los campos** ✅

Si después de regenerar con todos los campos **TODAVÍA** falta información en Notion/Miro, entonces SÍ es un bug de los scripts y hay que revisar.
