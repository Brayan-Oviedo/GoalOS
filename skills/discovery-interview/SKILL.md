---
name: discovery-interview
description: Deep interview para transformar ideas vagas en specs detallados. Se activa automáticamente cuando GoalOS detecta procesos, workflows o proyectos complejos.
---

# 🔍 Discovery Interview — Deep Elicitation Skill

**Propósito**: Transformar respuestas superficiales en specs ultra-detallados mediante preguntas contextuales inteligentes.

**Filosofía**: No aceptar respuestas vagas. Profundizar según el contexto del objetivo.

---

## 🎯 Cuándo Activar

GoalOS invoca este skill automáticamente cuando detecta:

- **Procesos/workflows**: `automat*`, `workflow`, `process`, `onboard*`, `operacion*`
- **Proyectos técnicos**: `saas`, `app`, `product`, `launch`, `api`, `mvp`
- **Aprendizaje complejo**: `learn*`, `curso`, `certificacion*`, `skill`, `estud*`

---

## 📋 Qué Hace

1. **Analiza las respuestas básicas** del usuario (outcome, criteria, timeline)
2. **Identifica gaps de información** críticos (bottlenecks, errores, integraciones)
3. **Hace 2-6 preguntas contextuales** específicas según el tipo de objetivo
4. **Genera spec enriquecido** con insights accionables

---

## 🏢 Discovery para PROCESS (Automatización/Workflow)

### Preguntas Base (2-4)

```
1. ¿Cuáles son los pasos actuales del proceso?
   → Enuméralos brevemente (no necesito detalles todavía)

2. ¿Dónde están los bottlenecks o pain points?
   → Qué es lo más lento, tedioso o propenso a errores

3. ¿Con qué frecuencia se ejecuta este proceso?
   → Veces por día/semana/mes

4. ¿Qué herramientas usas actualmente?
   → Sheets, email, manual, CRM, etc.
```

### Preguntas Follow-up (si aplica)

```
5. ¿Qué volumen de datos/transacciones maneja?
   → Para entender escalabilidad

6. ¿Cuál es la tasa de errores actual?
   → Para calcular ROI de automatización

7. ¿Qué integraciones necesitarías?
   → APIs, webhooks, bases de datos
```

### Output Esperado

```json
{
  "type": "process",
  "context": {
    "current_steps": [
      "Manual data entry from email",
      "Copy to Google Sheets",
      "Send notification",
      "Update CRM"
    ],
    "bottlenecks": [
      "Manual data entry takes 2h/day",
      "15% error rate in copying",
      "Notification delays"
    ],
    "frequency": "20 times per day",
    "tools": ["Gmail", "Google Sheets", "Salesforce"],
    "volume": "~400 transactions/month"
  },
  "insights": {
    "time_saved": "40 hours/month",
    "error_reduction": "15% → <1%",
    "roi_monthly": "$2000 in labor cost",
    "integration_needs": ["Gmail API", "Sheets API", "Salesforce API"],
    "automation_complexity": "medium",
    "recommended_tool": "n8n or Zapier"
  }
}
```

---

## 🚀 Discovery para PRODUCT (SaaS/App/MVP)

### Preguntas Base (2-4)

```
1. ¿Qué problema específico resuelve tu producto?
   → Pain point del usuario en 1-2 oraciones

2. ¿Quiénes son tus usuarios objetivo?
   → Persona, industria, tamaño de empresa

3. ¿Cuáles son las 3-5 features CORE?
   → Sin estas features, el producto no tiene sentido

4. ¿Stack técnico preferido o restricciones?
   → ej: React + Node, no-code, Python + Django
```

### Preguntas Follow-up (si aplica)

```
5. ¿Validaste el problema con usuarios reales?
   → Para entender si es assumption o validated

6. ¿Existe competencia directa?
   → Para identificar diferenciadores

7. ¿Modelo de monetización?
   → Freemium, subscription, one-time, etc.

8. ¿Estrategia de GTM inicial?
   → Cómo planeas conseguir los primeros usuarios
```

### Output Esperado

```json
{
  "type": "product",
  "context": {
    "problem": "Small teams can't collaborate effectively when remote",
    "users": "Remote teams of 5-50 people, tech companies",
    "core_features": [
      "Real-time collaboration board",
      "Task assignment with notifications",
      "Integration with Slack/Teams"
    ],
    "nice_to_have": [
      "Mobile app",
      "Advanced analytics",
      "Custom branding"
    ],
    "stack": "React + Node.js + PostgreSQL"
  },
  "insights": {
    "problem_validated": "Yes - 15 interviews done",
    "competition": ["Miro", "Notion", "Asana"],
    "differentiator": "Focused on simplicity, not feature bloat",
    "monetization": "$10/user/month subscription",
    "gtm": "Product Hunt launch + LinkedIn outreach",
    "mvp_timeline": "6-8 weeks realistic",
    "technical_risk": "low - standard CRUD app"
  }
}
```

---

## 📚 Discovery para LEARNING (Cursos/Certificaciones)

### Preguntas Base (2-3)

```
1. ¿Cuál es tu nivel actual en este tema?
   → Beginner / Intermediate / Advanced pero rusty

2. ¿Cuánto tiempo puedes dedicar por día/semana?
   → Horas REALES, sé honesto

3. ¿Para qué necesitas aprenderlo?
   → Job change, certificación, hobby, proyecto específico
```

### Preguntas Follow-up (si aplica)

```
4. ¿Estilo de aprendizaje preferido?
   → Video, texto, hands-on projects, combinado

5. ¿Tienes presupuesto para cursos/certificaciones?
   → Para recomendar recursos adecuados

6. ¿Necesitas mentor o puedes autodidacta?
   → Afecta el tipo de roadmap
```

### Output Esperado

```json
{
  "type": "learning",
  "context": {
    "topic": "Python for Data Science",
    "current_level": "Beginner - knows basic Python syntax",
    "time_available": "1 hour/day weekdays, 3 hours weekends",
    "goal_reason": "Career change to data analyst",
    "deadline": "3 months"
  },
  "insights": {
    "learning_path": [
      "Python fundamentals (2 weeks)",
      "NumPy + Pandas (3 weeks)",
      "Data visualization (2 weeks)",
      "Statistics basics (2 weeks)",
      "ML fundamentals (3 weeks)",
      "Portfolio projects (2 weeks)"
    ],
    "learning_style": "Hands-on projects preferred",
    "resources_budget": "$200 available",
    "recommended_resources": [
      "DataCamp (subscription $25/month)",
      "Kaggle free datasets",
      "YouTube (free supplementary)"
    ],
    "mentor_needed": false,
    "milestones": [
      "Week 4: First data analysis project",
      "Week 8: Visualization portfolio piece",
      "Week 12: Full ML project deployed"
    ],
    "realistic_assessment": "Achievable with 1h/day commitment"
  }
}
```

---

## 🎯 Técnicas de Elicitación

### 1. The Five Whys
Si la respuesta es superficial, pregunta "¿Por qué?" hasta llegar a la raíz:

```
Usuario: "Quiero automatizar mi proceso"
Tú: "¿Por qué quieres automatizarlo?"
Usuario: "Porque me toma mucho tiempo"
Tú: "¿Por qué te toma tanto tiempo?"
Usuario: "Porque tengo que copiar datos manualmente"
Tú: "¿Por qué no se puede integrar directamente?"
[Ahora descubriste el bottleneck real: falta de integración API]
```

### 2. Concrete Examples
Si el usuario es vago, pide ejemplos concretos:

```
Usuario: "Muchos usuarios"
Tú: "¿Cuántos aproximadamente? ¿10, 100, 1000?"

Usuario: "Es complicado"
Tú: "Dame un ejemplo de qué lo hace complicado"
```

### 3. Forced Choice
Presenta opciones para facilitar la respuesta:

```
Tú: "¿Tu nivel de Python es...
     A) Nunca lo has usado
     B) Lo usaste hace tiempo pero está oxidado
     C) Beginner activo
     D) Intermediate"
```

### 4. Validate Assumptions
No asumas — verifica:

```
Usuario: "Quiero lanzar un SaaS"
Tú: "Entiendo. ¿Ya validaste que el problema existe con usuarios reales, 
     o todavía es una hipótesis?"
```

---

## 💡 Cálculo de Insights Automáticos

### ROI para Procesos

```javascript
// Tiempo ahorrado
const current_time_hours = frequency_per_day * time_per_execution_hours * 20; // 20 working days
const automated_time_hours = frequency_per_day * 0.1 * 20; // 10% del tiempo actual
const time_saved_monthly = current_time_hours - automated_time_hours;

// ROI monetario
const hourly_rate = 25; // Default if not specified
const roi_monthly = time_saved_monthly * hourly_rate;

// ROI anual
const roi_annual = roi_monthly * 12;

// Payback period (si hay costo de automatización)
const automation_cost = 2000; // Estimado para tool + setup
const payback_months = automation_cost / roi_monthly;
```

### Feasibility para Productos

```javascript
// Technical risk
const risk_score = {
  standard_crud: 'low',
  apis_integration: 'medium',
  real_time: 'medium-high',
  ml_ai: 'high',
  blockchain: 'very-high'
};

// MVP timeline estimado
const base_weeks = 4;
const complexity_multiplier = {
  simple: 1,
  medium: 1.5,
  complex: 2.5,
  very_complex: 4
};

const mvp_weeks = base_weeks * complexity_multiplier[complexity];
```

### Learning Path para Educación

```javascript
// Estimación de horas totales
const topic_hours = {
  programming_basics: 100,
  web_dev: 200,
  data_science: 250,
  ml_ai: 300,
  blockchain: 200
};

// Timeline realista
const hours_per_week = daily_hours * 5 + weekend_hours * 2;
const weeks_needed = Math.ceil(topic_hours[topic] / hours_per_week);

// Milestones cada 25% del progreso
const milestones = [
  `Week ${Math.floor(weeks_needed * 0.25)}: First checkpoint project`,
  `Week ${Math.floor(weeks_needed * 0.50)}: Mid-term portfolio piece`,
  `Week ${Math.floor(weeks_needed * 0.75)}: Advanced project`,
  `Week ${weeks_needed}: Final capstone deployed`
];
```

---

## 🚨 Red Flags a Detectar

### Procesos
- **Frecuencia muy baja** (<5 veces/mes) → Automatizar puede no valer la pena
- **Proceso muy manual** sin APIs disponibles → Requiere RPA costoso
- **Datos muy sensibles** sin infraestructura → Riesgo de compliance

### Productos
- **Problema no validado** → Alto riesgo de build the wrong thing
- **Competencia muy fuerte** sin diferenciador claro → Hard to acquire users
- **Stack muy complejo** para MVP → Slow time to market

### Learning
- **Timeline muy corto** para el nivel → Setup for frustration
- **Tiempo disponible muy bajo** (<3h/week) → Won't make meaningful progress
- **Objetivo vago** sin aplicación → Lack of motivation to finish

---

## ✅ Checklist de Discovery Completo

Antes de pasar a Goal Decomposition, verifica:

### Para PROCESS
- [ ] Pasos actuales claramente enumerados
- [ ] Bottleneck principal identificado
- [ ] Frecuencia de ejecución definida
- [ ] Herramientas actuales listadas
- [ ] Volumen de datos estimado
- [ ] ROI calculado (tiempo + dinero)
- [ ] Integraciones necesarias identificadas

### Para PRODUCT
- [ ] Problema claramente articulado
- [ ] Usuarios objetivo definidos (persona + contexto)
- [ ] Features core vs nice-to-have separadas
- [ ] Stack técnico decidido
- [ ] Competencia analizada
- [ ] Modelo de monetización definido
- [ ] GTM strategy básica outlined

### Para LEARNING
- [ ] Nivel actual evaluado
- [ ] Tiempo disponible realista definido
- [ ] Objetivo final claro (job/cert/hobby)
- [ ] Estilo de aprendizaje identificado
- [ ] Presupuesto para recursos definido
- [ ] Learning path esbozado
- [ ] Milestones intermedios propuestos

---

## 🎓 Mejores Prácticas

### 1. Empathy First
Reconoce el contexto del usuario:
```
"Entiendo que esto puede parecer abrumador. Vamos paso a paso."
"Tiene sentido que no sepas esto todavía — justamente para eso estoy aquí."
```

### 2. Validate Understanding
Resume lo que entendiste antes de continuar:
```
"Déjame validar que entendí bien:
 - Proceso actual: [X pasos]
 - Bottleneck principal: [Y]
 - Frecuencia: [Z veces/día]
 
¿Es correcto?"
```

### 3. Prioritize
Si el usuario da mucha info, prioriza lo crítico:
```
"De todo lo que mencionaste, lo más impactante es [X] porque [razón]. 
 Enfoquémonos ahí primero."
```

### 4. Suggest Defaults
Si no sabe algo, ofrece un default razonable:
```
Usuario: "No sé cuánto tiempo toma"
Tú: "Sin problema. Para este tipo de proceso, típicamente toma 15-30 minutos. 
     ¿Te parece que arranquemos con 20 min como estimación?"
```

---

## 🔄 Integration con Goal Decomposer

El output de Discovery Interview alimenta directamente Goal Decomposer:

```json
{
  "goal_spec": {
    "title": "...",
    "statement": "...",
    "success_criteria": [...]
  },
  "discovery_insights": {
    "type": "process",
    "context": {...},
    "insights": {...}
  }
}
```

Goal Decomposer usa estos insights para:
- Seleccionar skills relevantes (ej: n8n-workflow-generator si es process)
- Calcular estimaciones más precisas
- Identificar dependencies realistas
- Proponer tools específicas

---

**Recuerda**: No es un interrogatorio — es una conversación para ayudar al usuario a clarificar su pensamiento 🤝
