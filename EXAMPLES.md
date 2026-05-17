# 🎯 GoalOS — Ejemplos de Uso Completo

> **💡 Tip Rápido:** Puedes pedirle que exporte directamente al generar el roadmap:
> 
> ```
> @GoalOS quiero [objetivo] y exporta a Notion
> @GoalOS quiero [objetivo] y exporta a Miro  
> @GoalOS quiero [objetivo] y exporta a Notion y Miro
> ```
> 
> **Requisito:** Haber configurado los tokens con `./setup.sh` primero.

---

## Ejemplo 1: Roadmap de Aprendizaje (Sin tokens)

### Setup
```bash
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS
code .
```

### En Copilot Chat
```
Usuario: @GoalOS quiero aprender Python para data science en 3 meses

GoalOS: ¡Perfecto! Para armar el mejor plan personalizado, cuéntame:

1. ¿Cuál es tu nivel actual en Python?
   (Nunca lo has usado / Lo usaste hace tiempo / Beginner pero activo)

Usuario: Lo usé hace 2 años pero está oxidado. Sé lo básico de loops y funciones.

GoalOS: Perfecto, entonces tienes base. 

2. ¿Cuánto tiempo puedes dedicarle por día o por semana?

Usuario: 1 hora al día entre semana, los fines de semana puedo 2-3 horas

GoalOS: Excelente. Eso es ~10 horas por semana, suficiente para avanzar bien.

3. ¿Para qué necesitas aprender data science?
   (Cambio de carrera / Proyecto específico / Hobby / Certificación)

Usuario: Quiero cambiar de carrera a data analyst

GoalOS: Perfecto! Entonces el enfoque será profesional con portfolio.

✅ Fase 1/5: Goal extraído
🔄 Fase 2/5: Analizando tu contexto... (30 seg)
✅ Fase 3/5: Skills matched
🔄 Fase 4/5: Generando roadmap... (1 min)
✅ Fase 5/5: Creando board visual...

✅ **Plan Completado: Python para Data Science — Career Change**

📊 **Roadmap:**
- 4 phases / 24 tasks
- 90 días (12 semanas)
- 180h estimadas total

📁 **Files generados:**
- output/goal-spec.json
- output/roadmap.json
- output/visual-board.html (se abrió en navegador)

🎯 **Próximos pasos:**
1. Revisa el board visual que se abrió
2. Click en tasks para marcar progreso
3. Descarga el JSON si necesitas editarlo

💡 **Comandos útiles:**
- "@GoalOS regenera con más detalle" → Más tasks específicas
- "@GoalOS agrega fase de preparación para entrevistas"
```

### Output Visual

El browser abre `output/visual-board.html`:

```
┌────────────────────────────────────────────────────────────┐
│  Python para Data Science — Career Change                  │
│  ⏱️ 90 días  📊 24 tasks en 4 phases  ⚡ 180h estimadas   │
│  ▓▓▓░░░░░░░░░░░░░░░ 10% completado                         │
└────────────────────────────────────────────────────────────┘

┌──────────────────┐ ┌──────────────────┐ ┌──────────────────┐
│ Phase 1          │ │ Phase 2          │ │ Phase 3          │
│ Python Refresh   │ │ Data Wrangling   │ │ Visualization    │
│ 2 semanas        │ │ 3 semanas        │ │ 2 semanas        │
├──────────────────┤ ├──────────────────┤ ├──────────────────┤
│ 🔲 Review basics │ │ 🔲 NumPy basics  │ │ 🔲 Matplotlib    │
│    ⏱️ 8h         │ │    ⏱️ 12h        │ │    ⏱️ 10h        │
│                  │ │                  │ │                  │
│ 🔲 List/Dict     │ │ 🔲 Pandas basics │ │ 🔲 Seaborn       │
│    ⏱️ 6h         │ │    ⏱️ 16h        │ │    ⏱️ 10h        │
│                  │ │                  │ │                  │
│ 🔲 Functions     │ │ 🔲 Data cleaning │ │ 🔲 Portfolio viz │
│    ⏱️ 8h         │ │    ⏱️ 20h        │ │    ⏱️ 16h        │
│                  │ │                  │ │                  │
│ 🔲 First project │ │ 🔲 Pandas proj   │ │                  │
│    ⏱️ 12h        │ │    ⏱️ 24h        │ │                  │
└──────────────────┘ └──────────────────┘ └──────────────────┘
```

Click en cualquier task para cambiar status:
- 🔲 Pending → ⏳ In Progress → ✅ Done → 🔲 (ciclo)

Progress bar se actualiza automáticamente.

---

## Ejemplo 2: Automatización de Proceso (Con Notion)

### Setup
```bash
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS

# Configurar Notion
export NOTION_API_TOKEN="secret_abc123..."
export NOTION_PARENT_PAGE_ID="123abc456def"

# Validar
./validate-tokens.sh
# ✅ NOTION_API_TOKEN configurado
# ✅ Token de Notion VÁLIDO

code .
```

### En Copilot Chat
```
Usuario: @GoalOS necesito automatizar el onboarding de nuevos clientes

GoalOS: Excelente! La automatización puede ahorrarte muchísimo tiempo. 
        Cuéntame sobre tu proceso actual:

1. ¿Cuáles son los pasos que haces hoy para onboardear un cliente?

Usuario: 
1. Recibo email con info del cliente
2. Creo cuenta manualmente en nuestro sistema
3. Copio datos a CRM (Salesforce)
4. Envío email de bienvenida con docs
5. Agendo llamada de kick-off

GoalOS: Perfecto, entiendo el flow. 

2. ¿Dónde está el cuello de botella o pain point más grande?

Usuario: Crear la cuenta y copiar datos al CRM me toma 20-30 min por cliente 
         y a veces me equivoco en los datos

GoalOS: Uf, eso duele. Y errores en datos pueden ser costosos.

3. ¿Con qué frecuencia onboardeas clientes nuevos?

Usuario: Entre 5-10 por semana

GoalOS: Ok, entonces son ~2-5 horas por semana solo en tareas manuales.

4. ¿Qué herramientas usan actualmente?

Usuario: Gmail para recibir info, sistema custom (tiene API), Salesforce, Gmail para enviar

GoalOS: Perfecto! Esto es muy automatizable con las APIs.

✅ Fase 1/5: Goal extraído
✅ Fase 2/5: Discovery completado
    💡 ROI estimado: $1200/mes en tiempo ahorrado
    💡 Reducción de errores: 15% → <1%
    💡 Herramienta recomendada: n8n (no-code automation)
✅ Fase 3/5: Skills matched
✅ Fase 4/5: Roadmap generado
✅ Fase 5/5: Board creado

✅ **Plan Completado: Automatizar Onboarding de Clientes**

📊 **Roadmap:**
- 3 phases / 12 tasks
- 45 días
- Skills: n8n-workflow-generator, api-integration

💾 **¿Quieres guardar en Notion?**

Usuario: @GoalOS exporta output/roadmap.json a Notion

GoalOS: 🔄 Exportando a Notion...

✅ **Roadmap exportado a Notion!**

📝 **Página creada**: [Ver en Notion](https://notion.so/...)

**Contenido:**
- Página: "Automatizar Onboarding de Clientes"
- Database: "Tasks" con 12 rows
- Propiedades: Phase, Status, Estimated Hours, Deliverable

🎯 **Próximos pasos:**
1. Abre la página en Notion (link arriba)
2. Edita/agrega notas según necesites
3. Asigna owners a cada task
4. Usa filters para ver tasks por phase

💡 También puedes colaborar con tu equipo directamente en Notion!
```

---

## Ejemplo 3: Lanzamiento de Producto (Con Miro + GitHub)

### Setup
```bash
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS

# Configurar Miro
export MIRO_ACCESS_TOKEN="abc123xyz..."

# Validar
./validate-tokens.sh
# ✅ MIRO_ACCESS_TOKEN configurado
# ✅ Token de Miro VÁLIDO

code .
```

### En Copilot Chat
```
Usuario: @GoalOS quiero lanzar mi SaaS B2B en 90 días

GoalOS: ¡Ambicioso pero factible! Ayúdame a entender tu producto:

1. ¿Qué problema específico resuelve tu SaaS?

Usuario: Ayuda a equipos remotos a colaborar mejor en proyectos complejos.
         El problema es que Miro es demasiado complejo y Notion muy limitado.

GoalOS: Interesante! Un sweet spot entre ambos.

2. ¿Quiénes son tus usuarios objetivo?

Usuario: Equipos tech de 5-50 personas, startups y scale-ups

GoalOS: Perfecto, mercado bien definido.

3. ¿Cuáles son las 3-5 features CORE sin las cuales el producto no tiene sentido?

Usuario:
1. Board colaborativo en tiempo real
2. Asignación de tasks con notificaciones
3. Integración con Slack/Teams

GoalOS: Claro, esas son las must-have. ¿Y nice-to-have?

Usuario: Mobile app, analytics avanzados, custom branding

GoalOS: Perfecto, esos los dejamos para v2.

4. ¿Stack técnico preferido?

Usuario: React + Node.js + PostgreSQL

GoalOS: Stack sólido y bien conocido.

[Genera roadmap completo: Discovery → Build MVP → Launch]

✅ **Plan Completado: Launch B2B SaaS — Collaboration Tool**

Usuario: @GoalOS exporta output/roadmap.json a Miro

GoalOS: 🎨 Creando board en Miro...

✅ **Board creado en Miro!**

🔗 **Link**: [Abrir board](https://miro.com/app/board/abc123)

**Contenido:**
- 4 frames (phases): Discovery, Build MVP, Testing, Launch
- 18 sticky notes (tasks) con colores por status
- Conexiones visuales entre tasks con dependencies
- Layout horizontal tipo roadmap

💡 **Tip**: Invita a tu equipo al board para colaborar!

Usuario: @GoalOS convierte output/roadmap.json a GitHub issues

GoalOS: 🐙 Creando issues en GitHub...

✅ **Issues creados:**
   #123 — [GOAL] Launch B2B SaaS
   #124 — [Phase 1] Discovery & Validation
   #125 — [Phase 2] Build MVP
   #126 — [Phase 3] Testing
   #127 — [Phase 4] Launch
   + 18 task issues

🔗 **Ver issues**: [github.com/tu-usuario/tu-repo/issues](...)

**Labels aplicados:**
- `goal` (issue #123)
- `phase-1`, `phase-2`, etc.
- `task`

**Dependencies:**
- Task #130 → blocked by #128
- Task #135 → blocked by #130, #132

🎯 **Ahora puedes trackear progreso directamente en GitHub!**
```

---

## Ejemplo 4: Solo Quiero el HTML (Sin configuración)

### Setup
```bash
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS
code .
```

### En Copilot Chat
```
Usuario: @GoalOS quiero crear un podcast en 60 días

[Responde 4-6 preguntas]

GoalOS: ✅ **Plan Completado: Lanzar Podcast Profesional**

📁 **File generado:**
- output/visual-board.html (se abrió en navegador)

🎯 **Próximos pasos:**
1. El board HTML funciona 100% offline
2. Click en tasks para marcar progreso
3. Se guarda automáticamente en tu navegador (localStorage)
4. No requiere tokens ni configuración extra

💡 **Si quieres colaboración cloud, configura Notion/Miro después**
```

El board HTML funciona igual que en Ejemplo 1, totalmente standalone.

---

## Flujo de Trabajo Recomendado

### Día 1: Crear Roadmap
```
@GoalOS quiero [objetivo]
→ Responde preguntas
→ Board HTML se abre automáticamente
→ Revisa y valida el plan
```

### Día 2-N: Ejecutar y Trackear

**Opción A: Solo local**
- Abre `output/visual-board.html` cada día
- Click en tasks completadas
- Progreso se guarda automáticamente

**Opción B: Colaboración (Notion)**
```
@GoalOS exporta a Notion
→ Comparte página con equipo
→ Trackean juntos en Notion
```

**Opción C: Desarrollo (GitHub)**
```
@GoalOS convierte a GitHub issues
→ Asigna issues a developers
→ Track con GitHub Projects
→ Cierra issues conforme completan
```

### Ajustes sobre la marcha
```
@GoalOS regenera con más detalle
@GoalOS agrega fase de testing
@GoalOS ajusta timeline a 45 días
```

---

## Tips Pro

### 1. Combinar Outputs
```
# HTML para ti (tracking personal)
output/visual-board.html

# Notion para equipo (colaboración)
@GoalOS exporta a Notion

# GitHub para developers (tracking técnico)
@GoalOS convierte a GitHub issues

# Miro para workshops (visualización colaborativa)
@GoalOS exporta a Miro
```

### 2. Usar como Template
Una vez que tienes un roadmap bueno, úsalo como template:
```
cp output/roadmap.json templates/mi-template.json
# Edita manualmente para futuros proyectos similares
```

### 3. Iteración Rápida
```
# Primera versión: general
@GoalOS quiero [objetivo]

# Segunda versión: más específica
@GoalOS regenera con más detalle

# Tercera versión: ajustada
@GoalOS ajusta timeline a [X días]
```

---

**¿Más ejemplos?** Abre un [Issue](https://github.com/Brayan-Oviedo/GoalOS/issues) con tu caso de uso 🚀
