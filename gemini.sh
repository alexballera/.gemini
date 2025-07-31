#!/bin/bash

# Ruta al archivo de configuración
SETTINGS_FILE="settings.json"

# Verificar si jq está instalado
if ! command -v jq &> /dev/null
then
    echo "Error: jq no está instalado. Por favor, instálalo para continuar (ej. sudo apt-get install jq)."
    exit 1
fi

# Verificar si el archivo de settings existe
if [ ! -f "$SETTINGS_FILE" ]; then
    echo "Error: No se encuentra el archivo $SETTINGS_FILE en el directorio actual."
    exit 1
fi

echo "Iniciando servidores MCP desde $SETTINGS_FILE..."

# Leer el archivo settings.json, construir los comandos y ejecutarlos en segundo plano
jq -r '.mcpServers | to_entries[] | .value.command + " " + (.value.args | join(" "))' "$SETTINGS_FILE" | while read -r cmd;
do
  if [ -n "$cmd" ]; then
    echo "Iniciando: $cmd"
    eval "$cmd &"
  fi
done

echo "Todos los servidores MCP han sido iniciados en segundo plano."
sleep 2 # Dar un par de segundos para que los servidores se inicien

echo "Iniciando Gemini..."

# COMANDO PARA INICIAR GEMINI
gemini

echo "Proceso de inicio finalizado."
