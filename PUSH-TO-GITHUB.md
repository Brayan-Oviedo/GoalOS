# 🚀 Subir GoalOS a GitHub

## Opción 1: Script Automático (Recomendado)

```bash
cd /Users/fantasma/Documents/PROYECTOS/RiseOS/export/GoalOS
./push-to-github.sh
```

✅ **Hace todo automáticamente**:
- Inicializa Git
- Agrega archivos
- Hace commit con mensaje descriptivo
- Conecta con GitHub
- Push a main

---

## Opción 2: Comandos Manuales

### Paso 1: Inicializar Git

```bash
cd /Users/fantasma/Documents/PROYECTOS/RiseOS/export/GoalOS
git init
git add .
git commit -m "GoalOS v1.0 - Visual Goal Planning AI

- Setup en 1 minuto con instrucciones detalladas
- Compatible con GitHub Copilot, Claude, Open WebUI
- Exportación opcional a Notion/Miro
- Board HTML funciona offline sin tokens
- Script de validación incluido"
```

### Paso 2: Configurar Branch

```bash
git branch -M main
```

### Paso 3: Conectar con GitHub

```bash
git remote add origin https://github.com/Brayan-Oviedo/GoalOS.git
```

### Paso 4: Push

**IMPORTANTE**: GitHub pedirá autenticación. Tienes 3 opciones:

#### Opción A: Token Personal (Recomendado)

1. **Generar token** (si no tienes):
   - Ve a: https://github.com/settings/tokens
   - Click en **"Generate new token"** → **"Generate new token (classic)"**
   - Nombre: `GoalOS Push`
   - Scopes: ✅ `repo` (todos los sub-scopes)
   - Click **"Generate token"**
   - **COPIA EL TOKEN** (solo se muestra una vez)

2. **Push con token**:
```bash
git push -u origin main
```

Cuando pida credenciales:
- **Username**: `Brayan-Oviedo`
- **Password**: `TU_TOKEN_AQUI` (pega el token, NO tu password de GitHub)

#### Opción B: GitHub CLI (Más fácil)

```bash
# 1. Instalar GitHub CLI (si no lo tienes)
brew install gh

# 2. Autenticarte
gh auth login
# Selecciona: GitHub.com → HTTPS → Yes (authenticate) → Login via browser

# 3. Push
git push -u origin main
```

#### Opción C: SSH Key

Si ya tienes SSH key configurada:
```bash
# Cambiar remote a SSH
git remote set-url origin git@github.com:Brayan-Oviedo/GoalOS.git

# Push
git push -u origin main
```

---

## Troubleshooting

### Error: "remote origin already exists"

```bash
# Ver remote actual
git remote -v

# Cambiar URL si es necesario
git remote set-url origin https://github.com/Brayan-Oviedo/GoalOS.git
```

### Error: "failed to push some refs"

El repo puede tener commits en GitHub que no tienes localmente:

```bash
# Pull primero (si el repo ya existe)
git pull origin main --allow-unrelated-histories

# Luego push
git push -u origin main
```

### Error: "Authentication failed"

- **Si usas HTTPS + Password**: GitHub ya NO acepta passwords. **Debes usar un token**.
- **Generar token**: https://github.com/settings/tokens
- **Usar token** como password cuando hagas push

---

## Verificación Post-Push

```bash
# Ver que el push funcionó
git remote -v
git branch -a
git log --oneline -3
```

Deberías ver:
```
origin  https://github.com/Brayan-Oviedo/GoalOS.git (fetch)
origin  https://github.com/Brayan-Oviedo/GoalOS.git (push)
* main
```

---

## Configurar el Repo en GitHub (Después del Push)

### 1. Agregar Descripción

Ve a: https://github.com/Brayan-Oviedo/GoalOS

Click en ⚙️ (Settings del repo, arriba derecha) y agrega:

```
🎯 Goal Architect AI — Transform vague goals into visual Miro-style roadmaps
Works with GitHub Copilot, Claude & Open WebUI
```

### 2. Agregar Topics

En la misma página, en "Topics" agrega:

```
ai
copilot
claude
open-webui
roadmap
planning
miro
notion
productivity
automation
goal-setting
```

### 3. (Opcional) Crear Release

- Ve a **Releases** → **"Create a new release"**
- Tag: `v1.0.0`
- Title: `GoalOS v1.0 - First Release`
- Description:
```markdown
## 🎯 GoalOS v1.0 — Visual Goal Planning AI

### Features
- ✅ Setup en 1 minuto
- ✅ Compatible con GitHub Copilot, Claude, Open WebUI
- ✅ Board HTML interactivo (funciona offline)
- ✅ Exportación opcional a Notion/Miro
- ✅ Script de validación de tokens
- ✅ Documentación completa

### Quick Start
```bash
git clone https://github.com/Brayan-Oviedo/GoalOS.git
cd GoalOS
code .
# @GoalOS quiero [tu objetivo]
```

### Documentation
- [README.md](README.md) - Complete guide
- [QUICKSTART.md](QUICKSTART.md) - 3-minute setup
- [EXAMPLES.md](EXAMPLES.md) - Real use cases

### Support
- 🐛 [Report issues](https://github.com/Brayan-Oviedo/GoalOS/issues)
- 📖 [Full documentation](https://github.com/Brayan-Oviedo/GoalOS)
```

---

## Actualizaciones Futuras

Cuando hagas cambios:

```bash
cd /Users/fantasma/Documents/PROYECTOS/RiseOS/export/GoalOS

# Ver cambios
git status

# Agregar cambios
git add .

# Commit
git commit -m "Descripción del cambio"

# Push
git push
```

---

## ✅ Checklist Final

Después de hacer push, verifica:

- [ ] Repo visible en https://github.com/Brayan-Oviedo/GoalOS
- [ ] Todos los archivos se subieron (README.md, skills/, etc.)
- [ ] README.md se ve bien en GitHub
- [ ] Links funcionan (QUICKSTART.md, EXAMPLES.md, etc.)
- [ ] Descripción del repo agregada
- [ ] Topics agregados
- [ ] No hay tokens expuestos (revisa archivos)

---

**¿Listo?** Ejecuta:

```bash
cd /Users/fantasma/Documents/PROYECTOS/RiseOS/export/GoalOS
./push-to-github.sh
```

O sigue los comandos manuales arriba 🚀
