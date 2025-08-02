# Entorno de Configuración de Gemini CLI

Este directorio (`~/.gemini`) contiene la configuración de usuario para la CLI de Gemini. La CLI lee automáticamente los archivos de este directorio en cada inicio para personalizar su comportamiento y cargar herramientas adicionales.

No se necesita ningún script para iniciar el entorno; la CLI de Gemini gestiona la configuración de forma nativa.

## Archivo de Configuración: `settings.json`

El archivo principal de configuración es `settings.json`. Permite una personalización profunda de la CLI, desde la apariencia visual hasta la integración de herramientas avanzadas.

### Estructura y Opciones

A continuación se detallan las secciones principales encontradas en tu `settings.json` y otras opciones comunes disponibles.

#### `mcpServers` (Protocolo de Contexto de Modelo)

Esta sección es fundamental para ampliar las capacidades de la CLI. Permite definir una lista de servidores MCP que se iniciarán automáticamente en segundo plano cuando se ejecute la CLI de Gemini. Estos servidores pueden añadir nuevas herramientas y contextos al modelo.

Cada clave dentro del objeto `mcpServers` es un nombre que tú eliges para el servidor. La estructura para cada servidor es:

-   `command`: El comando a ejecutar (ej. `npx`, `python`, `node`).
-   `args`: Un array de strings que representan los argumentos para el comando.

**Ejemplo de tu configuración:**

```json
"mcpServers": {
  "context7": {
    "command": "npx",
    "args": ["-y", "@upstash/context7-mcp"]
  },
  "filesystem": {
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-filesystem", "/home/alexballera"]
  },
  "memory": {
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-memory"]
  },
  "everything": {
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-everything"]
  }
}
```

En este ejemplo, se inician cuatro servidores MCP diferentes usando `npx`, que es el ejecutor de paquetes de Node.js.

#### `selectedAuthType`

Esta clave especifica el método de autenticación que la CLI debe utilizar.

**Ejemplo de tu configuración:**

```json
"selectedAuthType": "gemini-api-key"
```

Esto indica a la CLI que se autentique utilizando una clave de API de Gemini.

### Otras Opciones de Configuración Comunes

Puedes añadir otras claves a tu `settings.json` para personalizar aún más la experiencia, según la documentación oficial:

-   `"theme"`: Personaliza el tema de color de la CLI.
-   `"autoAccept"`: Si se establece en `true`, aprueba automáticamente las llamadas a herramientas seguras y de solo lectura.
-   `"sandbox"`: Permite aislar la ejecución de herramientas. Puede ser `true`, `"docker"` o `"podman"`.
-   `"checkpointing"`: Habilita el comando `/restore` para deshacer cambios en los archivos.
-   `"fileFiltering"`: Controla cómo se filtran los archivos, por ejemplo, para respetar las reglas de `.gitignore`.
-   `"usageStatisticsEnabled"`: Establécelo en `false` para desactivar el envío de estadísticas de uso anónimas.

## Archivo de Contexto: `GEMINI.md`

Este archivo (`GEMINI.md`) se utiliza para proporcionar instrucciones, hechos o contexto persistente al modelo de Gemini en cada sesión. Puedes editar este archivo para darle al modelo una "memoria" a largo plazo sobre tus preferencias, el proyecto actual o cualquier otra información relevante.

### Casos de Uso y Ejemplos para `GEMINI.md`

Aquí tienes algunos ejemplos de cómo puedes usar este archivo para mejorar tu interacción con Gemini:

#### 1. Definir una Personalidad o Rol
Puedes instruir a Gemini para que adopte una personalidad específica, lo que ajustará su tono y estilo de respuesta.

**Ejemplo:**
```markdown
Eres un asistente de programación experto en Python y desarrollo web. Tus respuestas deben ser claras, concisas y con ejemplos de código prácticos. Prioriza siempre las mejores prácticas de desarrollo.
```

#### 2. Establecer el Contexto de un Proyecto
Si trabajas en un proyecto específico, puedes proporcionar información clave para que Gemini no necesite que se la repitas.

**Ejemplo:**
```markdown
## Contexto del Proyecto "Phoenix"

- **Objetivo**: Crear una tienda online de libros.
- **Tecnologías**:
  - Frontend: React con Next.js
  - Backend: API REST con FastAPI (Python)
  - Base de datos: PostgreSQL
- **URL Repositorio**: https://github.com/user/phoenix
- **Comando para ejecutar tests**: `pytest -v`
```

#### 3. Fijar Guías de Estilo de Código
Define reglas de formato o convenciones de código para que las sugerencias de Gemini sean consistentes con tu proyecto.

**Ejemplo:**
```markdown
## Guía de Estilo

- Usa `snake_case` para variables y funciones en Python.
- Documenta todas las funciones públicas con docstrings estilo Google.
- Limita las líneas de código a 88 caracteres.
- Prefiere el uso de f-strings para formatear cadenas.
```

#### 4. Guardar Preferencias Personales y de Idioma
Usa el archivo para recordarle a Gemini tus preferencias personales.

**Ejemplo:**
```markdown
- Responde siempre en español.
- Mi nombre es Alex.
- Prefiero explicaciones técnicas detalladas en lugar de analogías.
- Al generar código, incluye comentarios explicando la lógica compleja.
```

---
*Este documento ha sido actualizado para reflejar el funcionamiento nativo de la CLI de Gemini y su configuración a través de `settings.json`.*
