# 🔌 GoalOS MCP Server

> **Exportación automática ultra-rápida para GitHub Copilot**

El MCP (Model Context Protocol) Server permite que GoalOS exporte roadmaps **3x más rápido** mediante invocación directa de funciones en lugar de scripts bash.

---

## ✨ ¿Por Qué MCP?

### **Sin MCP (Bash Scripts)**
```
@GoalOS genera plan → Bash ejecuta ./goalos-notion → Bash ejecuta ./goalos-miro
Tiempo: ~15-20 segundos
```

### **Con MCP**
```
@GoalOS genera plan → MCP invoca export_all() → Notion + Miro en paralelo
Tiempo: ~5-7 segundos
```

**Ventajas:**
- ⚡ **3x más rápido**: Invocación directa vs procesos bash
- 📊 **Mejor feedback**: Respuestas estructuradas en tiempo real
- 🎯 **Un comando**: `export_all` vs 2-3 scripts separados
- 🔄 **Exports en paralelo**: Notion y Miro al mismo tiempo

**Limitación:**  
✅ Solo GitHub Copilot (VS Code)  
❌ Claude Projects y Open WebUI usan bash (funciona igual, solo más lento)

---

## 🚀 Instalación (2 minutos)

### Requisitos Previos

- ✅ Node.js **v18 o superior** (verifica con `node -v`)
- ✅ GitHub Copilot instalado en VS Code
- ✅ GoalOS ya configurado (ejecutaste `./setup.sh`)

### Paso 1: Instalar MCP Server

```bash
cd GoalOS
./install-mcp.sh
```

El script:
1. Instala `@modelcontextprotocol/sdk`
2. Configura el MCP server
3. Muestra la configuración para VS Code

### Paso 2: Configurar VS Code

El script te mostrará algo así:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📋 COPIA ESTO EN TU settings.json DE VS CODE:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Ubicación: /Users/tu-usuario/Library/Application Support/Code/User/settings.json
```

**Abre settings.json:**
- macOS: `Cmd + Shift + P` → "Preferences: Open User Settings (JSON)"
- Windows/Linux: `Ctrl + Shift + P` → "Preferences: Open User Settings (JSON)"

**Agrega esta configuración:**

```json
{
  "github.copilot.advanced": {
    "mcpServers": {
      "goalos": {
        "command": "node",
        "args": ["/ruta/completa/a/GoalOS/mcp-server-goalos.mjs"],
        "env": {
          "NOTION_API_TOKEN": "${env:NOTION_API_TOKEN}",
          "NOTION_PARENT_PAGE_ID": "${env:NOTION_PARENT_PAGE_ID}",
          "MIRO_ACCESS_TOKEN": "${env:MIRO_ACCESS_TOKEN}"
        }
      }
    }
  }
}
```

**⚠️ IMPORTANTE:**  
Reemplaza `/ruta/completa/a/GoalOS/mcp-server-goalos.mjs` con la ruta absoluta que te mostró el instalador.

### Paso 3: Reiniciar VS Code

```bash
# Cierra VS Code completamente
Cmd+Q (macOS) / Ctrl+Q (Windows/Linux)

# Vuelve a abrir
code .
```

### Paso 4: Verificar

1. Abre Command Palette (`Cmd/Ctrl + Shift + P`)
2. Busca: **"Developer: Show Running MCP Servers"**
3. Deberías ver:
   ```
   ✅ goalos - Connected
   ```

Si ves el servidor conectado, ¡todo listo! 🎉

---

## 🎯 Uso

### Comandos Disponibles

El MCP server expone 4 funciones que el agente puede invocar:

#### 1. `export_all` (RECOMENDADO)
Exporta a todas las plataformas con tokens disponibles.

```javascript
// El agente lo invoca automáticamente después de generar el roadmap
{
  roadmap_file: "output/roadmap.json",
  open_browser: true  // Abre boards automáticamente
}
```

**Exporta a:**
- ✅ HTML (siempre)
- ✅ Notion (si hay NOTION_API_TOKEN + NOTION_PARENT_PAGE_ID)
- ✅ Miro (si hay MIRO_ACCESS_TOKEN)

#### 2. `export_to_html`
Solo genera el board HTML interactivo.

```javascript
{
  roadmap_file: "output/roadmap.json"
}
```

#### 3. `export_to_notion`
Solo exporta a Notion (requiere tokens).

```javascript
{
  roadmap_file: "output/roadmap.json"
}
```

#### 4. `export_to_miro`
Solo exporta a Miro (requiere token).

```javascript
{
  roadmap_file: "output/roadmap.json"
}
```

### Invocación en Chat

El agente Goal Architect **invoca automáticamente** `export_all` después de generar tu roadmap.

**No necesitas hacer nada especial.** Solo usa GoalOS normalmente:

```
@GoalOS quiero lanzar mi SaaS en 90 días
```

Verás en el output:
```
🚀 Exportando a todas las plataformas...

📁 HTML: Generado en output/visual-board.html
   ✅ Abierto en navegador

🚀 Exportando a Notion...
   ✅ Database creado: https://notion.so/...

🚀 Exportando a Miro...
   ✅ Board creado: https://miro.com/app/board/...

✅ Exportación completa
```

---

## 🛠️ Troubleshooting

### ❌ "goalos" no aparece en MCP Servers

**Causa:** VS Code no encontró el MCP server.

**Solución:**
1. Verifica la ruta absoluta en `settings.json`:
   ```json
   "args": ["/Users/tu-usuario/ruta/completa/a/GoalOS/mcp-server-goalos.mjs"]
   ```
2. Verifica que el archivo sea ejecutable:
   ```bash
   chmod +x mcp-server-goalos.mjs
   ```
3. Reinicia VS Code completamente (`Cmd+Q` / `Ctrl+Q`)

### ❌ MCP server conectado pero exports fallan

**Causa:** Tokens no configurados o rutas incorrectas.

**Solución:**
1. Verifica que ejecutaste `./setup.sh` y tienes `.env` con tokens
2. Verifica que las variables de entorno estén disponibles:
   ```bash
   echo $NOTION_API_TOKEN
   echo $NOTION_PARENT_PAGE_ID
   echo $MIRO_ACCESS_TOKEN
   ```
3. Si usas `.env`, asegúrate de cargar las variables:
   ```bash
   source .env
   code .
   ```

### ❌ "Node.js v18+ required"

**Causa:** Node.js desactualizado.

**Solución:**
1. Actualiza Node.js: https://nodejs.org
2. Verifica versión: `node -v` (debe ser >= v18.0.0)
3. Reinstala MCP: `./install-mcp.sh`

### ❌ "@modelcontextprotocol/sdk" no encontrado

**Causa:** Dependencies no instaladas.

**Solución:**
```bash
cd GoalOS
npm install
```

---

## 🔄 Desinstalar MCP

Si quieres volver a usar bash scripts:

1. **Elimina la configuración de VS Code:**
   ```json
   // Borra esta sección de settings.json:
   {
     "github.copilot.advanced": {
       "mcpServers": {
         "goalos": { ... }  // ← BORRA ESTO
       }
     }
   }
   ```

2. **Reinicia VS Code**

GoalOS volverá a usar bash scripts automáticamente (funciona igual, solo más lento).

---

## 📊 Comparación: MCP vs Bash

| Característica | MCP Server | Bash Scripts |
|:---:|:---:|:---:|
| **Velocidad** | ⚡ 5-7 seg | 🐌 15-20 seg |
| **Feedback** | 📊 Estructurado | 📝 Texto plano |
| **Exports** | 🔄 Paralelos | ⏸️ Secuenciales |
| **Plataformas** | ✅ Copilot only | ✅ Todas |
| **Setup** | ⚙️ 2 min | ✅ Auto |
| **Funcionalidad** | ✅ 100% | ✅ 100% |

**Recomendación:**  
- 🚀 **MCP** si usas GitHub Copilot (VS Code) exclusivamente
- 🛠️ **Bash** si usas múltiples plataformas (Copilot + Claude + OpenWebUI)

Ambos exportan la **misma información** a las **mismas plataformas**. MCP solo es más rápido.

---

## 🤝 Contribuir

¿Encontraste un bug o tienes ideas para mejorar el MCP server?

- 🐛 [Reportar Issue](https://github.com/Brayan-Oviedo/GoalOS/issues)
- 💬 [Discusiones](https://github.com/Brayan-Oviedo/GoalOS/discussions)
- ⭐ [Star en GitHub](https://github.com/Brayan-Oviedo/GoalOS)

---

## 📚 Más Información

- 📖 [README principal](README.md)
- ⚡ [Quick Start](QUICKSTART.md)
- 💡 [Ejemplos de uso](EXAMPLES.md)
- 🔍 [Troubleshooting Notion](TROUBLESHOOTING_NOTION.md)
- 🎨 [Para Claude Projects](CLAUDE.md)
- 🌐 [Para Open WebUI](OPENWEBUI.md)

---

<div align="center">

**Hecho con ❤️ por RiseOS**

[GitHub](https://github.com/Brayan-Oviedo/GoalOS) · [Issues](https://github.com/Brayan-Oviedo/GoalOS/issues) · [Discusiones](https://github.com/Brayan-Oviedo/GoalOS/discussions)

</div>
