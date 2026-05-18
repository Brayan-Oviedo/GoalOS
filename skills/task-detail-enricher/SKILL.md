---
name: task-detail-enricher
description: >
  Enriquece roadmap.json con detalle completo por tarea y secciones top-level.
  Se invoca automáticamente al final de FASE 4 de goal-architect para garantizar
  que TODOS los campos estén presentes antes de exportar a Notion y Miro.
triggers:
  - "enriquecer roadmap"
  - "faltan campos"
  - "roadmap incompleto"
  - "completar detalle"
  - invoked by goal-architect after FASE 4
---

# 🔍 Task Detail Enricher — Skill de Enriquecimiento Completo

**Propósito**: Garantizar que `output/roadmap.json` tiene TODOS los campos necesarios para export completo a Notion y Miro — sin excepción.

**Principio**: Si está en el plan, se exporta. Si no hay dato, se genera uno relevante. NUNCA null, NUNCA vacío.

---

## 🎯 Cuándo Se Activa

1. **Automático**: goal-architect lo invoca al final de FASE 4 como validación obligatoria
2. **Manual**: Usuario escribe "enriquecer roadmap" o "faltan campos"
3. **Preventivo**: Antes de ejecutar `./goalos-miro` o `./goalos-notion`

---

## 📋 Proceso de Enriquecimiento

### PASO 1 — Leer y diagnosticar

```javascript
const roadmap = JSON.parse(fs.readFileSync('output/roadmap.json', 'utf8'));
```

Para cada tarea, verificar si tiene estos campos (TODOS obligatorios):
- `description` — no null, no vacío, mínimo 2 oraciones
- `steps` — array con mínimo 3 items `{order, action, duration}`
- `priority` — "high" | "medium" | "low"
- `tools_needed` — array con mínimo 1 herramienta

Para top-level, verificar:
- `tips` — array con 5-7 strings
- `daily_schedule` — object con campos requeridos
- `honest_assessment` — object con 6 campos

### PASO 2 — Enriquecer CADA tarea faltante

**Procesa tarea POR TAREA** (no todo en bloque). Para cada tarea con campos faltantes:

#### Campo: `description`
```
Genera: 2-3 oraciones que expliquen:
1. QUÉ se hace exactamente en esta tarea
2. POR QUÉ importa para el objetivo final
3. CÓMO contribuye al siguiente paso (si aplica)

Ejemplo para "Auditoría de tiempo: tracking 3 días":
"Registrar detalladamente todas las actividades realizadas durante 3 días 
consecutivos usando un método de time-tracking (Toggl, Clockify o incluso una 
hoja de papel). Esto es crítico para tener datos reales, no percepciones, de 
dónde se pierde el tiempo. Sin esta auditoría, el sistema de automatización se 
construirá sobre suposiciones incorrectas."
```

#### Campo: `steps`
```
Genera: 3-5 pasos accionables con duración estimada.
Formato EXACTO:
[
  {"order": 1, "action": "Acción específica y concreta (verbo + objeto)", "duration": "Xh"},
  {"order": 2, "action": "Siguiente acción específica", "duration": "Xh"},
  {"order": 3, "action": "Acción final que completa el deliverable", "duration": "Xh"}
]

Reglas:
- Cada acción inicia con verbo (Instalar, Configurar, Mapear, Crear, Definir...)
- La duración debe sumar aproximadamente estimated_hours de la tarea
- El último paso debe producir el deliverable de la tarea
- NO usar pasos vagos como "trabajar en X" o "revisar Y"

Ejemplo para "Auditoría de tiempo" (4h):
[
  {"order": 1, "action": "Instalar Toggl Track en móvil y desktop, configurar categorías: deep work, comunicación, admin, distracciones", "duration": "0.5h"},
  {"order": 2, "action": "Trackear TODAS las actividades 3 días consecutivos — incluyendo descansos, redes, interrupciones", "duration": "3h"},
  {"order": 3, "action": "Exportar reporte Toggl, calcular % por categoría y listar los 5 procesos más lentos/repetitivos", "duration": "0.5h"}
]
```

#### Campo: `priority`
```
Asignar según estas reglas:
- "high": Tarea crítica que bloquea otras o tiene deadline urgente, o es fundacional
- "medium": Tarea importante pero no bloquea el plan completo
- "low": Tarea nice-to-have o con dependencias lejanas

Usar el campo `dependencies` para ayudar: tareas sin dependencias que otras bloquean → high
```

#### Campo: `tools_needed`
```
Genera: 1-5 herramientas CONCRETAS y ESPECÍFICAS para esta tarea.
Incluir: software, plataformas, frameworks — lo que se usará REALMENTE.

Ejemplos:
- ✅ ["Toggl Track", "Google Sheets", "Notion"]  ← Específico
- ❌ ["herramientas de productividad"]             ← Vago, inútil

Si la tarea es manual o cognitiva: ["Notion", "papel/bolígrafo"] es válido.
Si usa AI: incluir ["Claude", "ChatGPT", "Copilot"] según el contexto.
```

### PASO 3 — Generar secciones top-level faltantes

#### `tips` (5-7 tips)
```
Genera tips relevantes AL OBJETIVO ESPECÍFICO, no genéricos.
Formato: string con emoji + insight accionable

Template:
[
  "💡 [Tip estratégico] — [Insight no obvio específico a este objetivo]",
  "⚡ [Quick win] — [Acción que genera resultado visible en 48h]",
  "🎯 [Foco] — [El error más común que comete la gente con este objetivo]",
  "🔧 [Herramienta] — [Tool o método específico que acelera 2x el progreso]",
  "🧠 [Mindset] — [Cambio de perspectiva que desbloquea el avance]",
  "📊 [Métrica] — [Cómo medir si vas por buen camino]",
  "⚠️ [Trampa] — [La distracción más común que hace fallar este objetivo]"
]
```

#### `daily_schedule`
```
Genera basado en el timeline y estimated_hours del roadmap.

Estructura EXACTA:
{
  "minimum_required": "Xh/día — lo mínimo real para completarlo en [timeline]",
  "ideal": "Xh/día — si quieres terminarlo antes o con más calidad",
  "total_hours_estimate": "[N] horas totales en [N] semanas",
  "morning": "Actividad concreta para mañana (ej: '30min — revisar progreso del día anterior')",
  "afternoon": "Actividad concreta para tarde (ej: '1h — trabajo deep en tarea actual')",
  "evening": "Actividad concreta para noche (ej: '15min — actualizar Notion dashboard')",
  "weekday_breakdown": {
    "actividad_1": "Xmin — descripción específica",
    "actividad_2": "Xmin — descripción específica"
  },
  "weekend_breakdown": {
    "actividad_1": "Xmin — descripción específica",
    "actividad_2": "Xmin — descripción específica"
  }
}

Regla: minimum_required * 5 días * semanas ≈ total_hours_estimate
```

#### `honest_assessment`
```
Genera análisis HONESTO y DIRECTO. Sin optimismo falso.

Estructura EXACTA:
{
  "achievable": "SÍ/NO — [1-2 oraciones directas sobre si el plan es realista dado el contexto]",
  "expected_result": "[Qué lograrán REALMENTE al completar el plan — específico, sin exagerar]",
  "will_NOT_achieve": [
    "[Expectativa irreal 1 que la gente asume pero no ocurrirá]",
    "[Expectativa irreal 2]"
  ],
  "key_factor": "[El único factor que más determina éxito o fracaso — ser muy específico]",
  "biggest_risk": "[El riesgo más probable que podría hacer fallar el plan]",
  "mitigation": "[Acción concreta para mitigar ese riesgo — no vaga]"
}

Tono: Como un mentor honesto, no un coach motivacional.
Ejemplo achievable: "SÍ pero requiere consistencia diaria. Con el nivel técnico descrito y 2h/día, el objetivo es alcanzable en el timeline. El mayor riesgo es perder momentum en semana 3-4."
```

### PASO 4 — Guardar roadmap.json enriquecido

```javascript
// Merge enrichments into roadmap (no reemplazar todo, solo añadir campos faltantes)
// Preservar todos los campos existentes
fs.writeFileSync('output/roadmap.json', JSON.stringify(enrichedRoadmap, null, 2));
console.log('✅ roadmap.json enriquecido con todos los campos');
```

### PASO 5 — Validar antes de entregar

Verificar que el roadmap enriquecido tiene:

```
POR CADA TAREA (N tasks verificadas):
✅ description — string, mínimo 50 chars
✅ steps — array, mínimo 3 items con {order, action, duration}
✅ priority — "high" | "medium" | "low"
✅ tools_needed — array, mínimo 1 item

TOP-LEVEL:
✅ tips — array, 5-7 items
✅ daily_schedule.minimum_required — string
✅ daily_schedule.ideal — string
✅ daily_schedule.weekday_breakdown — object
✅ daily_schedule.weekend_breakdown — object
✅ honest_assessment.achievable — string
✅ honest_assessment.expected_result — string
✅ honest_assessment.will_NOT_achieve — array
✅ honest_assessment.key_factor — string
✅ honest_assessment.biggest_risk — string
✅ honest_assessment.mitigation — string
```

Si falta alguno → generarlo antes de continuar.

---

## 📊 Lo que Se Exporta (mapping completo)

| Campo en roadmap.json | Dónde aparece en Miro | Dónde aparece en Notion |
|---|---|---|
| `task.title` | Título de tarjeta Kanban | Título de página de tarea |
| `task.description` | Texto principal de tarjeta | Callout 💡 en body de página |
| `task.steps[]` | Lista "📋 Cómo hacerlo" | Checkboxes interactivos |
| `task.priority` | Badge de color (rojo/amarillo/verde) | Property "Prioridad" |
| `task.tools_needed[]` | "🛠️ Tools:" en tarjeta | Property "Herramientas" |
| `task.deliverable` | "🎯 Entrega:" en tarjeta | Property "Deliverable" |
| `task.estimated_hours` | "⏱️ Xh" en tarjeta | Property "Horas" |
| `task.assigned_skill` | "🧩 skill-name" en tarjeta | Property "Skill" |
| `tips[]` | Sidebar "💡 TIPS CLAVE" (sticky notes verdes) | Sección "💡 Tips Clave" |
| `daily_schedule` | Sidebar "📅 CALENDARIO DIARIO" | Sección "📅 Dedicación Diaria" |
| `honest_assessment` | Sidebar "🎯 VEREDICTO HONESTO" | Sección "🎯 Veredicto Honesto" |
| **Cualquier campo extra** | Sidebar "📌 [nombre]" (dinámico) | — |

**Garantía**: Si un campo está en `roadmap.json`, se exporta. Si no está, se ignora graciosamente.

---

## 🚨 Reglas Absolutas

1. **NUNCA dejar null**: Si no hay dato real, generar uno aproximado/razonable
2. **NUNCA array vacío `[]`** para steps o tools_needed
3. **Tarea por tarea**: Enriquecer una tarea a la vez para no perder campos
4. **Preservar datos existentes**: Solo añadir campos faltantes, no sobreescribir
5. **Especificidad**: Tips y schedule deben ser específicos al objetivo, no genéricos
6. **Honestidad**: honest_assessment debe ser realista, no optimista falso
