# Gemini

Gemini es un proyecto que automatiza el inicio de varios servidores MCP (Model Context Protocol) definidos en un archivo de configuración y luego ejecuta el comando principal `gemini`. El propósito es facilitar la gestión y el arranque de entornos de servidores MCP para desarrollo o pruebas.

## ¿Cómo funciona?

El script principal es `gemini.sh`, que realiza lo siguiente:

1. Verifica que la herramienta `jq` esté instalada (necesaria para procesar JSON en bash).
2. Lee el archivo `settings.json` para obtener la lista de servidores MCP y sus comandos de inicio.
3. Inicia cada servidor MCP en segundo plano según la configuración.
4. Finalmente, ejecuta el comando `gemini`.

## Configuración

1. Asegúrate de tener instalado `jq`:
   ```bash
   sudo apt-get install jq
   ```
2. Edita el archivo `settings.json` para definir los servidores MCP que deseas iniciar. Ejemplo:
   ```json
   {
     "mcpServers": {
       "context7": {
         "command": "npx",
         "args": ["-y", "@upstash/context7-mcp"]
       },
       "filesystem": {
         "command": "npx",
         "args": ["-y", "@modelcontextprotocol/server-filesystem"]
       }
     }
   }
   ```
3. Ejecuta el script:
   ```bash
   bash gemini.sh
   ```

## Archivos principales

- `gemini.sh`: Script bash que automatiza el arranque de servidores y el comando principal.
- `settings.json`: Archivo de configuración con la lista de servidores MCP y sus comandos.

## Notas

- Todos los servidores se inician en segundo plano.
- El script está pensado para entornos de desarrollo o pruebas.
- Puedes personalizar los servidores MCP modificando `settings.json`.

---
Responde siempre en español.