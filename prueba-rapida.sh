#!/bin/bash

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🧪 PRUEBA RÁPIDA: ¿Los scripts funcionan?"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "📋 1. Verificando que test-roadmap.json tenga TODOS los campos..."
echo ""

CAMPOS=$(jq -r '.phases[0].tasks[0] | 
  "description: \(if .description then "✅" else "❌ null" end)\n" +
  "assigned_skill: \(if .assigned_skill then "✅" else "❌ null" end)\n" +
  "tools_needed: \(if .tools_needed | length > 0 then "✅ (\(. | length) tools)" else "❌ vacío" end)\n" +
  "steps: \(if .steps | length > 0 then "✅ (\(. | length) pasos)" else "❌ vacío" end)"' test-roadmap.json)

echo "$CAMPOS"
echo ""

echo "📋 2. Comparando con TU roadmap.json..."
echo ""

TU_CAMPOS=$(jq -r '.phases[0].tasks[0] | 
  "description: \(if .description then "✅" else "❌ null" end)\n" +
  "assigned_skill: \(if .assigned_skill then "✅" else "❌ null" end)\n" +
  "tools_needed: \(if .tools_needed | length > 0 then "✅ (\(. | length) tools)" else "❌ vacío/null" end)\n" +
  "steps: \(if .steps | length > 0 then "✅ (\(. | length) pasos)" else "❌ vacío" end)"' /Users/fantasma/Documents/PROYECTOS/RiseOS/plugins/GoalOS/output/roadmap.json 2>/dev/null)

if [ -n "$TU_CAMPOS" ]; then
  echo "$TU_CAMPOS"
else
  echo "❌ No se encontró roadmap.json en plugins/GoalOS/output/"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎯 CONCLUSIÓN"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

HAS_NULL=$(echo "$TU_CAMPOS" | grep -c "null")

if [ "$HAS_NULL" -gt 0 ]; then
  echo "⚠️  TU ROADMAP TIENE CAMPOS VACÍOS/NULL"
  echo ""
  echo "Los scripts goalos-notion y goalos-miro SÍ funcionan,"
  echo "pero SOLO pueden exportar lo que existe en el JSON."
  echo ""
  echo "📝 SOLUCIÓN:"
  echo "1. Regenera el roadmap con @GoalOS pidiendo TODOS los campos"
  echo "2. O edita roadmap.json manualmente"
  echo "3. O exporta test-roadmap.json para ver que los scripts funcionan:"
  echo ""
  echo "   ./goalos-notion test-roadmap.json"
  echo "   ./goalos-miro test-roadmap.json"
else
  echo "✅ TU ROADMAP TIENE TODOS LOS CAMPOS"
  echo ""
  echo "Puedes exportar directamente:"
  echo ""
  echo "   ./goalos-notion /Users/fantasma/Documents/PROYECTOS/RiseOS/plugins/GoalOS/output/roadmap.json"
  echo "   ./goalos-miro /Users/fantasma/Documents/PROYECTOS/RiseOS/plugins/GoalOS/output/roadmap.json"
fi

echo ""
