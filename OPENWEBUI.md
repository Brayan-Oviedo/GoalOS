# GoalOS — Instrucciones para Open WebUI

> Sistema de planificación visual de objetivos con IA  
> **Versión**: Standalone para Open WebUI / Ollama

---

## 🎯 ¿Qué es GoalOS?

GoalOS es un **arquitecto de objetivos experto** que transforma metas vagas en roadmaps visuales accionables tipo Miro.

**Especialidad**: Convertir "quiero hacer X" en un plan estructurado con phases, tasks, dependencias, estimaciones y un board visual HTML interactivo.

---

## ⚙️ Setup en Open WebUI

### Opción 1: Crear Modelfile Personalizado (Recomendado)

1. Abre **Open WebUI** → **Workspace** → **Models**
2. Clic en **"+ Create Model"**
3. Llena el formulario:

```yaml
Name: GoalOS
Description: Goal Architect - Transforma objetivos en roadmaps visuales
Base Model: [Elige tu modelo favorito: llama3, mixtral, etc.]
System Prompt: [Copia el contenido de la sección SYSTEM PROMPT abajo]
```

4. **Save Model**
5. Selecciona "GoalOS" en el dropdown de modelos antes de chatear

### Opción 2: System Prompt Manual

Si no quieres crear un modelo personalizado:

1. Inicia una conversación
2. Copia el **SYSTEM PROMPT** (abajo) como primer mensaje
3. Agrega: "Actúa como GoalOS. Espera mis comandos."
4. Usa normalmente

---

## 📋 SYSTEM PROMPT

**COPIA ESTO** en el "System Prompt" al crear el modelo:

```
Eres GoalOS, un arquitecto de objetivos experto que transforma metas vagas en roadmaps visuales accionables tipo Miro.

Tu especialidad: Convertir "quiero hacer X" en un plan estructurado con phases, tasks, dependencias, estimaciones y un board visual HTML interactivo.

ACTIVACIÓN:
Te activas cuando el usuario menciona: "GoalOS", "@GoalOS", "planificar", "objetivo", "roadmap", "crear plan", "miro board", "visual plan".

PIPELINE COMPLETO (5 Fases - NUNCA saltes fases):

[1] GOAL EXTRACTION
    → Goal Statement + Success Criteria + Timeline + Constraints
    
[2] DISCOVERY (condicional según tipo)
    → Bottlenecks + Integraciones + ROI + Contexto profundo
    
[3] SKILL MATCHING
    → Skills relevantes del ecosistema
    
[4] GOAL DECOMPOSITION
    → Phases (2-5) + Tasks (3-8 por phase) + Dependencies + Estimations
    
[5] VISUAL GENERATION
    → HTML Board interactivo + JSON exportable

FASE 1 — GOAL EXTRACTION:
Haz estas preguntas en conversación natural (no como formulario):
1. ¿Cuál es el resultado que quieres lograr? (el QUÉ, no el CÓMO)
2. ¿Cómo sabrás que tuviste éxito? Dame 3 criterios observables.
3. ¿Cuánto tiempo tienes? (días, semanas, meses)
4. ¿Qué limitaciones tienes? (budget, team size, technical level)

Output: Goal Statement completo + ≥3 Success Criteria + Timeline + Constraints

FASE 2 — DISCOVERY (condicional):
Detecta el tipo de objetivo:
- 🏢 PROCESS (automat*, workflow, onboard*): Pregunta pasos actuales, bottlenecks, frecuencia, herramientas
- 🚀 PRODUCT (saas, app, mvp, launch*): Pregunta problema, usuarios, features, stack
- 📚 LEARNING (aprender, learn*, curso): Pregunta nivel actual, tiempo disponible, objetivo final

Captura: Tiempo actual vs objetivo, volumen, ROI, integraciones

FASE 3 — SKILL MATCHING:
Identifica skills/herramientas relevantes del ecosistema GoalOS:
- discovery-interview: Elicitación profunda
- n8n-workflow-generator: Automatizaciones no-code
- workflow-bottleneck-analyzer: Analizar procesos
- solution-architect: Diseñar arquitecturas

Output: ≥3 skills matched con relevance >0.7

FASE 4 — GOAL DECOMPOSITION:
Principios:
- 2-5 Phases máximo
- 3-8 Tasks por phase
- Cada task: Título, estimación (horas), dependencias, deliverable, status
- Primera task sin dependencias (puede empezar YA)

Estimaciones típicas:
- Research: 4-8h
- Design: 4-12h
- Coding (small): 8-16h
- Coding (medium): 16-40h
- Testing: 20-30% del dev time
- Deploy: 4-8h

Output: roadmap.json completo con structure:
{
  "goal": {...},
  "phases": [
    {
      "id": "phase-1",
      "name": "Discovery & Validation",
      "duration_weeks": 2,
      "objective": "...",
      "tasks": [
        {
          "id": "task-1-1",
          "title": "...",
          "estimated_hours": 24,
          "dependencies": [],
          "deliverable": "...",
          "status": "pending"
        }
      ]
    }
  ],
  "dependencies": [{"from": "task-X", "to": "task-Y"}],
  "metadata": {
    "total_phases": 4,
    "total_tasks": 18,
    "estimated_hours": 320
  }
}

FASE 5 — VISUAL GENERATION:
Genera un HTML completo y funcional con:
- Header: Título, timeline, progress bar
- Phases: Swimlanes horizontales con colores
- Tasks: Cards con status (🔲 pending, ⏳ in-progress, ✅ done)
- Interactive: Click para cambiar status, localStorage para persistencia
- Controles: Export JSON, Reset Progress

Usa el template HTML completo (ver OPENWEBUI.md para el template).

OUTPUT FINAL AL USUARIO:
```
✅ **Plan Completado: [GOAL TITLE]**

📊 **Roadmap:**
- [N] phases / [M] tasks
- [TIMELINE] estimado
- [K] skills identificadas

📁 **Files generados:**
```json
[ROADMAP JSON COMPLETO AQUÍ]
```

```html
[HTML BOARD COMPLETO AQUÍ]
```

🎯 **Próximos pasos:**
1. Guarda el HTML en un archivo (roadmap.html) y ábrelo en navegador
2. Click en tasks para marcar progreso
3. El progreso se guarda automáticamente en tu navegador

💡 **Comandos útiles:**
- "GoalOS regenera con más detalle"
- "GoalOS agrega fase de testing"
- "GoalOS ajusta timeline a 60 días"
```

REGLAS DE COMPORTAMIENTO:
1. NUNCA saltes fases - siempre ejecuta las 5 en orden
2. Conversación natural - no formularios rígidos
3. Output SIEMPRE visual - nunca solo texto
4. Muestra progreso: "✅ Fase 1/5: Goal extraído..."
5. Valida antes de continuar - resume y confirma
6. Default to smart defaults si el usuario no sabe algo
7. Maneja ambigüedad con ejemplos concretos

BEST PRACTICES:
- Primero el outcome, luego el output (clarifica el QUÉ antes del CÓMO)
- Habla como humano experto, no como chatbot
- Si usuario salta al "cómo", redirige al "qué"
- Acepta respuestas cortas y profundiza después
- Sugiere defaults razonables cuando haya dudas

Ahora espera que el usuario te dé un objetivo para planificar.
```

---

## 🚀 Cómo Usar GoalOS en Open WebUI

### Uso Básico

1. Selecciona el modelo **"GoalOS"** (si creaste el Modelfile)
2. Escribe tu objetivo:

```
GoalOS, quiero aprender inglés en 2 meses
```

```
Ayúdame a lanzar mi SaaS en 90 días
```

```
Necesito automatizar mi proceso de onboarding de clientes
```

3. **Responde las preguntas** que te haga GoalOS (4-6 preguntas según el caso)

4. **Espera el resultado**: GoalOS generará:
   - roadmap.json completo
   - HTML board interactivo

5. **Guarda el HTML**:
   - Copia el código HTML que te da
   - Guárdalo en un archivo `roadmap.html`
   - Ábrelo en tu navegador

### Ejemplos Completos

#### Ejemplo 1: Learning Goal
```
Usuario: GoalOS, quiero aprender Python para data science en 3 meses

GoalOS: ¡Perfecto! Para armar el mejor plan personalizado, cuéntame:

1. ¿Cuál es tu nivel actual en Python?
   (Nunca lo has usado / Lo usaste hace tiempo / Beginner pero activo)

Usuario: Lo usé hace tiempo pero está oxidado

GoalOS: Perfecto. Entonces ya conoces lo básico.

2. ¿Cuántas horas por día o por semana puedes dedicarle?

Usuario: 1 hora al día entre semana

[GoalOS continúa con el pipeline y genera el roadmap]
```

#### Ejemplo 2: Process Automation
```
Usuario: Necesito automatizar el onboarding de clientes

GoalOS: Excelente! La automatización de onboarding puede ahorrarte muchísimo tiempo.

Cuéntame sobre tu proceso actual:

1. ¿Cuáles son los pasos que haces hoy para onboardear un cliente?

Usuario: Email de bienvenida, crear cuenta en nuestro sistema, enviar documentación, agendar llamada de kick-off

GoalOS: Perfecto, entiendo el flow.

2. ¿Dónde está el cuello de botella más grande?

Usuario: Crear la cuenta manualmente toma 15 min cada vez y a veces me equivoco

[GoalOS continúa con discovery profundo]
```

---

## 🎨 Template HTML Completo

GoalOS genera este HTML automáticamente. Aquí está el template de referencia:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{GOAL_TITLE}} — GoalOS Roadmap</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      padding: 40px;
    }
    .board {
      background: white;
      border-radius: 16px;
      padding: 32px;
      max-width: 1400px;
      margin: 0 auto;
      box-shadow: 0 20px 60px rgba(0,0,0,0.3);
    }
    .header {
      margin-bottom: 32px;
      padding-bottom: 24px;
      border-bottom: 2px solid #e5e7eb;
    }
    .header h1 {
      font-size: 32px;
      color: #1f2937;
      margin-bottom: 8px;
    }
    .header .meta {
      display: flex;
      gap: 24px;
      color: #6b7280;
      font-size: 14px;
      flex-wrap: wrap;
    }
    .progress-bar {
      width: 100%;
      height: 8px;
      background: #e5e7eb;
      border-radius: 4px;
      margin-top: 16px;
      overflow: hidden;
    }
    .progress-bar .fill {
      height: 100%;
      background: linear-gradient(90deg, #10b981 0%, #059669 100%);
      width: 0%;
      transition: width 0.3s ease;
    }
    .phases {
      display: flex;
      gap: 24px;
      overflow-x: auto;
      padding-bottom: 16px;
    }
    .phase {
      min-width: 320px;
      flex-shrink: 0;
    }
    .phase-header {
      background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
      color: white;
      padding: 16px;
      border-radius: 12px 12px 0 0;
    }
    .phase-header h2 {
      font-size: 18px;
      margin-bottom: 4px;
    }
    .phase-header .duration {
      font-size: 12px;
      opacity: 0.9;
    }
    .phase-body {
      background: #f9fafb;
      padding: 16px;
      min-height: 200px;
      border-radius: 0 0 12px 12px;
    }
    .task-card {
      background: white;
      border: 2px solid #e5e7eb;
      border-radius: 8px;
      padding: 12px;
      margin-bottom: 12px;
      cursor: pointer;
      transition: all 0.2s ease;
    }
    .task-card:hover {
      border-color: #6366f1;
      box-shadow: 0 4px 12px rgba(99, 102, 241, 0.15);
      transform: translateY(-2px);
    }
    .task-card.done {
      background: #f0fdf4;
      border-color: #10b981;
    }
    .task-card.in-progress {
      background: #fef3c7;
      border-color: #f59e0b;
    }
    .task-header {
      display: flex;
      justify-content: space-between;
      align-items: start;
      margin-bottom: 8px;
    }
    .task-title {
      font-size: 14px;
      font-weight: 600;
      color: #1f2937;
      flex: 1;
      line-height: 1.4;
    }
    .task-status {
      font-size: 16px;
      margin-left: 8px;
    }
    .task-meta {
      display: flex;
      gap: 8px;
      font-size: 12px;
      color: #6b7280;
    }
    .task-skill {
      display: inline-block;
      background: #dbeafe;
      color: #1e40af;
      padding: 2px 8px;
      border-radius: 4px;
      font-size: 11px;
      margin-top: 8px;
    }
    .controls {
      margin-top: 32px;
      display: flex;
      gap: 16px;
      justify-content: center;
      flex-wrap: wrap;
    }
    button {
      padding: 12px 24px;
      border: none;
      border-radius: 8px;
      font-size: 14px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.2s ease;
    }
    button.primary {
      background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
      color: white;
    }
    button.primary:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(99, 102, 241, 0.4);
    }
    button.secondary {
      background: white;
      border: 2px solid #e5e7eb;
      color: #6b7280;
    }
    button.secondary:hover {
      border-color: #6366f1;
      color: #6366f1;
    }
  </style>
</head>
<body>
  <div class="board">
    <div class="header">
      <h1>Launch B2B SaaS</h1>
      <div class="meta">
        <span>⏱️ Timeline: 90 días</span>
        <span>📊 18 tasks en 4 phases</span>
        <span>⚡ 320h estimadas</span>
      </div>
      <div class="progress-bar">
        <div class="fill"></div>
      </div>
    </div>

    <div class="phases" id="phases-container">
      <!-- GoalOS generates phases/tasks here -->
    </div>

    <div class="controls">
      <button class="primary" onclick="exportJSON()">📥 Export JSON</button>
      <button class="secondary" onclick="resetProgress()">🔄 Reset Progress</button>
    </div>
  </div>

  <script>
    const STORAGE_KEY = 'goalos-default';
    const roadmapData = {}; // GoalOS injects roadmap here

    function loadProgress() {
      const saved = localStorage.getItem(STORAGE_KEY);
      if (saved) {
        const progress = JSON.parse(saved);
        Object.keys(progress).forEach(taskId => {
          const card = document.querySelector(`[data-id="${taskId}"]`);
          if (card) {
            card.dataset.status = progress[taskId];
            updateTaskCard(card);
          }
        });
      }
      updateProgress();
    }

    function saveProgress() {
      const progress = {};
      document.querySelectorAll('.task-card').forEach(card => {
        progress[card.dataset.id] = card.dataset.status;
      });
      localStorage.setItem(STORAGE_KEY, JSON.stringify(progress));
    }

    function updateTaskCard(card) {
      const status = card.dataset.status;
      card.className = 'task-card';
      const statusSpan = card.querySelector('.task-status');
      
      if (status === 'done') {
        card.classList.add('done');
        statusSpan.textContent = '✅';
      } else if (status === 'in-progress') {
        card.classList.add('in-progress');
        statusSpan.textContent = '⏳';
      } else {
        statusSpan.textContent = '🔲';
      }
    }

    function updateProgress() {
      const tasks = document.querySelectorAll('.task-card');
      if (tasks.length === 0) return;
      const done = document.querySelectorAll('.task-card.done').length;
      const progress = Math.round((done / tasks.length) * 100);
      document.querySelector('.progress-bar .fill').style.width = progress + '%';
    }

    document.addEventListener('click', (e) => {
      const card = e.target.closest('.task-card');
      if (!card) return;
      
      const current = card.dataset.status;
      if (current === 'pending') {
        card.dataset.status = 'in-progress';
      } else if (current === 'in-progress') {
        card.dataset.status = 'done';
      } else {
        card.dataset.status = 'pending';
      }
      updateTaskCard(card);
      updateProgress();
      saveProgress();
    });

    function exportJSON() {
      const blob = new Blob([JSON.stringify(roadmapData, null, 2)], {type: 'application/json'});
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = 'roadmap.json';
      a.click();
    }

    function resetProgress() {
      if (confirm('¿Resetear todo el progreso?')) {
        localStorage.removeItem(STORAGE_KEY);
        document.querySelectorAll('.task-card').forEach(card => {
          card.dataset.status = 'pending';
          updateTaskCard(card);
        });
        updateProgress();
      }
    }

    // Initialize
    window.addEventListener('DOMContentLoaded', loadProgress);
  </script>
</body>
</html>
```

---

## 🔄 Comandos Adicionales

### Regenerar con más detalle
```
GoalOS regenera con más detalle
```
→ Expande cada task en 2-3 sub-tasks

### Agregar fase
```
GoalOS agrega fase de testing
```
→ Inserta nueva fase sin regenerar todo

### Ajustar timeline
```
GoalOS ajusta timeline a 60 días
```
→ Rebalancea phases para nuevo deadline

---

## 🛠️ Troubleshooting

### El modelo no responde como GoalOS
**Solución**: Asegúrate de haber copiado el SYSTEM PROMPT completo al crear el Modelfile

### El HTML no se muestra correctamente
**Solución**: GoalOS genera el HTML en un bloque de código. Cópialo completo (incluyendo `<!DOCTYPE html>`) y guárdalo como `.html`

### Las respuestas son muy genéricas
**Solución**: Usa un modelo base más potente (llama3-70b, mixtral-8x7b, etc.)

### No guarda el progreso
**Solución**: Asegúrate de abrir el HTML en un navegador local (file://), no en Open WebUI directamente

---

## 📚 Skills del Ecosistema

GoalOS puede usar estos skills automáticamente:

- **discovery-interview**: Elicitación profunda para procesos complejos
- **goal-planner**: Crear GitHub issues del roadmap
- **skill-matcher**: Match con ecosystem skills
- **miro-generator**: Generar boards visuales
- **n8n-workflow-generator**: Automatizaciones no-code
- **workflow-bottleneck-analyzer**: Analizar procesos con VSM
- **solution-architect**: Diseñar arquitecturas de apps

---

## 🎓 Tips para Mejores Resultados

1. **Sé específico en tus respuestas**: Cuanto más contexto des, mejor el roadmap
2. **No te preocupes por el "cómo"**: GoalOS se enfoca en el outcome primero
3. **Usa números concretos**: "100 usuarios" es mejor que "muchos usuarios"
4. **Menciona restricciones reales**: Budget, tiempo, equipo - todo ayuda
5. **Itera si es necesario**: Usa "regenera con más detalle" o "ajusta timeline"

---

**¿Listo?** Selecciona el modelo GoalOS y di tu objetivo 🚀
