# 🔍 Troubleshooting: Notion no valida

## ❌ Problema Reportado

```
Validando conexión con Notion...
✗ Validación falló
```

---

## ✅ Solución Paso a Paso

### 1️⃣ **Verifica que el token sea correcto**

El token de Notion puede tener estos formatos:
- `secret_xxxxxxxxxxxxxxxxxxxxx` (internal integration)
- `ntn_xxxxxxxxxxxxxxxxxxxxx` (nuevo formato)
- Alfanumérico largo (formato antiguo)

**⚠️ NUNCA debe tener:**
- Espacios al inicio o final
- Comillas (`"` o `'`)
- Saltos de línea

**✅ Cómo verificar:**
```bash
# Ejecuta esto en tu terminal dentro de /export/GoalOS
./test-notion.sh
```

Pega tu token cuando te lo pida. Verás:
- **HTTP Code: 200** → Token válido ✅
- **HTTP Code: 401** → Token inválido o expirado ❌
- **HTTP Code: 403** → Token sin permisos ❌

---

### 2️⃣ **PASO CRÍTICO: Conecta la integración a tu página**

**Este es el error más común.** Aunque tu token sea válido, si no conectas la integración a la página específica, NO FUNCIONA.

#### Pasos exactos:

1. Abre tu página de Notion en el navegador
2. Click en los **3 puntos (···)** arriba a la derecha
3. Busca la opción **"Connect to"** o **"Conectar a"**
4. En el menú que aparece, busca **"GoalOS"** (o el nombre de tu integración)
5. Click en "GoalOS" para conectarla

**Verificación:**
- Después de conectarla, verás "GoalOS" en la lista de integraciones conectadas
- Si no aparece "GoalOS" en la lista, significa que no has creado la integración correctamente

---

### 3️⃣ **Permisos de la integración**

Tu integración debe tener estos permisos:

✅ **Content capabilities:**
- Read content: **SÍ**
- Insert content: **SÍ**  
- Update content: **SÍ**

❌ **NO necesitas:**
- Comment capabilities
- User information

**Cómo verificar:**
1. Ve a https://www.notion.so/my-integrations
2. Click en tu integración "GoalOS"
3. Pestaña "Capabilities"
4. Verifica que los 3 permisos de Content estén activos

---

### 4️⃣ **El Page ID es correcto**

El Page ID se extrae automáticamente de la URL de tu página:

**URL de ejemplo:**
```
https://www.notion.so/GoalOS-361536bdba9780e1ac90e6b0410271c1
                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                              Esto es el Page ID (32 caracteres)
```

El setup.sh lo extrae automáticamente. Si ves:
```
✓ Page ID extraído: 361536bdba9780e1ac90e6b0410271c1
```

Entonces el Page ID está correcto.

---

## 🧪 Test Manual

Si quieres probar manualmente desde la terminal:

```bash
cd /Users/fantasma/Documents/PROYECTOS/RiseOS/export/GoalOS

# Configura las variables
export NOTION_API_TOKEN="tu_token_aqui"
export NOTION_PARENT_PAGE_ID="tu_page_id_aqui"

# Ejecuta la validación
./validate-tokens.sh
```

Deberías ver:
```
📝 Validando Notion...
✅ NOTION_API_TOKEN configurado
✅ Token de Notion VÁLIDO
✅ NOTION_PARENT_PAGE_ID configurado
```

---

## 📋 Checklist Completo

Marca cada paso que hayas verificado:

- [ ] Token copiado sin espacios ni comillas
- [ ] Token válido (HTTP 200 en test-notion.sh)
- [ ] Integración "GoalOS" creada en https://www.notion.so/my-integrations
- [ ] Permisos Content (Read/Insert/Update) activos
- [ ] **Integración conectada a la página específica** (paso ···  → Connect to)
- [ ] Page ID extraído correctamente de la URL
- [ ] Página no está en el Trash/Papelera

---

## 🆘 Si Sigue Fallando

1. **Regenera el token:**
   - Ve a https://www.notion.so/my-integrations
   - Click en tu integración
   - Click en "Regenerate token"
   - Copia el nuevo token (solo se muestra una vez)

2. **Crea una página nueva de prueba:**
   - Crea una página vacía en Notion
   - Conéctale la integración "GoalOS"
   - Usa la URL de esa página en el setup

3. **Verifica la versión de la API:**
   - El validate-tokens.sh usa `Notion-Version: 2022-06-28`
   - Esto es correcto y compatible con todos los tokens actuales

---

## 📞 Contacto

Si después de todos estos pasos sigue fallando, ejecuta:

```bash
./test-notion.sh
```

Y comparte:
- El HTTP Code que te da
- El mensaje de error (sin mostrar tu token completo)
- Si ves "GoalOS" en la lista de integraciones conectadas a tu página
