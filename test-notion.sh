#!/bin/bash
# Test rápido de validación Notion

echo "Ingresa tu NOTION_API_TOKEN para probar:"
read test_token

echo ""
echo "Probando con endpoint /v1/users/me..."
response=$(curl -s -w "\nHTTP_CODE:%{http_code}" -X GET 'https://api.notion.com/v1/users/me' \
  -H "Authorization: Bearer $test_token" \
  -H "Notion-Version: 2022-06-28")

http_code=$(echo "$response" | grep "HTTP_CODE" | cut -d: -f2)
body=$(echo "$response" | sed '/HTTP_CODE/d')

echo "HTTP Code: $http_code"
echo ""
echo "Response body:"
echo "$body" | head -20

if [ "$http_code" -eq "200" ]; then
    echo ""
    echo "✅ Token válido"
else
    echo ""
    echo "❌ Token inválido o sin permisos"
fi
