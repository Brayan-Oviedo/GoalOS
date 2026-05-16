# ✅ GoalOS — Checklist de Validación

Usa este checklist antes de compartir el repo o para validar tu instalación.

---

## 📦 Estructura de Archivos

- [ ] `.github/copilot-instructions.md` existe (config para Copilot)
- [ ] `.github/agents/goal-architect.agent.md` existe (agente principal)
- [ ] `skills/discovery-interview/SKILL.md` existe
- [ ] `output/.gitkeep` existe (carpeta para roadmaps)
- [ ] `README.md` existe y tiene instrucciones completas
- [ ] `QUICKSTART.md` existe (setup en 3 min)
- [ ] `EXAMPLES.md` existe (ejemplos de uso)
- [ ] `CLAUDE.md` existe (instrucciones para Claude)
- [ ] `OPENWEBUI.md` existe (instrucciones para Open WebUI)
- [ ] `validate-tokens.sh` existe y es ejecutable
- [ ] `.gitignore` existe (ignora output/)
- [ ] `LICENSE` existe (MIT)

---

## 🔧 Funcionalidad Básica (Sin tokens)

- [ ] Clonas el repo: `git clone https://github.com/Brayan-Oviedo/GoalOS.git`
- [ ] Abres en VS Code: `code GoalOS/`
- [ ] Copilot detecta el agente `@GoalOS`
- [ ] Dices: `@GoalOS quiero aprender Python en 2 meses`
- [ ] GoalOS te hace 4-6 preguntas
- [ ] Genera `output/roadmap.json`
- [ ] Genera `output/visual-board.html`
- [ ] El board HTML se abre en el navegador
- [ ] El board es interactivo (click en tasks cambia status)
- [ ] El progreso se guarda en localStorage

---

## 🔐 Validación de Tokens (Opcional)

### Notion

- [ ] Obtuviste token de `notion.so/my-integrations`
- [ ] Token empieza con `secret_`
- [ ] Obtuviste Page ID de una página de Notion
- [ ] Compartiste la página con la integración "GoalOS"
- [ ] Configuraste: `export NOTION_API_TOKEN="secret_..."`
- [ ] Configuraste: `export NOTION_PARENT_PAGE_ID="..."`
- [ ] Ejecutaste: `./validate-tokens.sh`
- [ ] Script dice: "✅ Token de Notion VÁLIDO"

### Miro

- [ ] Obtuviste token de `miro.com/app/settings/user-profile/apps`
- [ ] Creaste app "GoalOS" en Miro
- [ ] Copiaste Access token
- [ ] **Compartiste un board con la app "GoalOS"** (paso crítico)
- [ ] Diste permisos de edición al board
- [ ] Configuraste: `export MIRO_ACCESS_TOKEN="..."`
- [ ] Ejecutaste: `./validate-tokens.sh`
- [ ] Script dice: "✅ Token de Miro VÁLIDO"

---

## 🚀 Exportación (Con tokens configurados)

### Notion

- [ ] Generaste un roadmap: `@GoalOS quiero [objetivo]`
- [ ] Dijiste: `@GoalOS exporta output/roadmap.json a Notion`
- [ ] GoalOS responde con link a página de Notion
- [ ] Abres la página en Notion
- [ ] Ves el database con todas las tasks
- [ ] Propiedades: Phase, Status, Estimated Hours, Deliverable
- [ ] Puedes editar tasks directamente en Notion

### Miro

- [ ] Generaste un roadmap: `@GoalOS quiero [objetivo]`
- [ ] Dijiste: `@GoalOS exporta output/roadmap.json a Miro`
- [ ] GoalOS responde con link a board de Miro
- [ ] Abres el board en Miro
- [ ] Ves frames por cada phase
- [ ] Ves sticky notes por cada task
- [ ] Ves conexiones entre tasks con dependencies
- [ ] Puedes mover y editar en Miro

---

## 🎨 Claude Projects

- [ ] Creaste un Project en Claude
- [ ] Copiaste TODO el contenido de `CLAUDE.md` en Custom Instructions
- [ ] Guardaste las instrucciones
- [ ] Dijiste: `GoalOS quiero [objetivo]`
- [ ] Claude ejecuta el pipeline completo (5 fases)
- [ ] Genera el HTML usando Artifacts
- [ ] Te muestra el board directamente en Claude
- [ ] Puedes copiar el código HTML y guardarlo como `.html`

---

## 🔴 Open WebUI

- [ ] Abriste Open WebUI → Workspace → Models
- [ ] Creaste modelo "GoalOS"
- [ ] Copiaste System Prompt de `OPENWEBUI.md`
- [ ] Guardaste el modelo
- [ ] Seleccionaste "GoalOS" en el dropdown
- [ ] Dijiste: `GoalOS quiero [objetivo]`
- [ ] Open WebUI ejecuta el pipeline
- [ ] Genera roadmap.json
- [ ] Genera HTML board
- [ ] Copias el HTML y lo guardas localmente

---

## 📝 Documentación

- [ ] `README.md` tiene instrucciones claras de setup
- [ ] Se menciona que Notion/Miro son **opcionales**
- [ ] Se explica cómo obtener tokens (paso a paso)
- [ ] Se incluye script `validate-tokens.sh`
- [ ] `QUICKSTART.md` tiene setup en 3 minutos
- [ ] `EXAMPLES.md` tiene casos de uso reales
- [ ] `CLAUDE.md` tiene instrucciones completas para Claude
- [ ] `OPENWEBUI.md` tiene instrucciones completas para Open WebUI
- [ ] Todos los links apuntan a `github.com/Brayan-Oviedo/GoalOS`

---

## 🐛 Troubleshooting

- [ ] README tiene sección de troubleshooting completa
- [ ] Se explica qué hacer si no detecta `@GoalOS`
- [ ] Se explica qué hacer si falla exportación a Notion
- [ ] Se explica qué hacer si falla exportación a Miro
- [ ] Se menciona que HTML funciona sin tokens
- [ ] Se incluyen comandos curl para validar tokens

---

## 🚀 Antes de Compartir

- [ ] Revisaste todos los archivos `.md`
- [ ] No hay URLs rotas (todos apuntan a `Brayan-Oviedo/GoalOS`)
- [ ] No hay "tu-usuario" sin reemplazar
- [ ] Script `validate-tokens.sh` es ejecutable (`chmod +x`)
- [ ] `.gitignore` ignora `output/` correctamente
- [ ] Probaste el flujo completo al menos una vez
- [ ] Validaste que funciona en al menos una IA (Copilot/Claude/Open WebUI)
- [ ] README tiene sección de setup en 1 minuto al inicio
- [ ] README enfatiza que tokens son **opcionales**

---

## ✅ Validación Final

```bash
# 1. Clonar repo
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS

# 2. Verificar estructura
ls -la
# Debe mostrar: README.md, QUICKSTART.md, EXAMPLES.md, validate-tokens.sh, etc.

# 3. Verificar script es ejecutable
ls -l validate-tokens.sh
# Debe mostrar: -rwxr-xr-x (x = ejecutable)

# 4. Ejecutar script (sin tokens)
./validate-tokens.sh
# Debe mostrar warnings pero no errores

# 5. (Opcional) Configurar un token y validar
export NOTION_API_TOKEN="secret_test"
./validate-tokens.sh
# Debe mostrar si el token es válido o no

# 6. Abrir en VS Code
code .

# 7. Probar en Copilot Chat
# @GoalOS quiero aprender inglés en 2 meses
# Debe funcionar y generar roadmap
```

---

## 🎉 Todo Listo!

Si todos los checkboxes están ✅, tu instalación de GoalOS está lista para:

- ✅ Usar localmente sin configuración
- ✅ Compartir con otros (GitHub)
- ✅ Exportar a Notion (con token configurado)
- ✅ Exportar a Miro (con token configurado)
- ✅ Usar en Copilot, Claude y Open WebUI

**¡Puedes compartir el repo con confianza!** 🚀

---

## 📤 Cómo Compartir

1. **Asegúrate de NO commitear tus tokens**:
```bash
cat .gitignore
# Debe incluir variables de entorno si las guardaste en archivos
```

2. **Push al repo**:
```bash
cd export/GoalOS
git init
git add .
git commit -m "GoalOS v1.0 - Ready to share"
git remote add origin https://github.com/Brayan-Oviedo/GoalOS.git
git push -u origin main
```

3. **Comparte el link**:
```
https://github.com/Brayan-Oviedo/GoalOS
```

4. **Agrega descripción en GitHub**:
```
🎯 Goal Architect AI — Transform vague goals into visual Miro-style roadmaps
Works with GitHub Copilot, Claude & Open WebUI
```

5. **Agrega topics**:
```
ai, copilot, claude, roadmap, planning, miro, notion, productivity
```

---

**¿Algo falla?** Revisa el checklist de nuevo o abre un [Issue](https://github.com/Brayan-Oviedo/GoalOS/issues) 🛠️
