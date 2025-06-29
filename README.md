# .gemini

Repositorio para el proyecto .gemini.

## Descripción
Este repositorio contiene la configuración y archivos fuente del proyecto .gemini.

## Estructura
- `Dockerfile`: Archivo de configuración para Docker.
- `settings.json`: Configuración personalizada del proyecto.
- `.gitignore`: Archivos y carpetas ignorados por git.
- `user_id`: Archivo ignorado, no se sube al repositorio.

## Configuración del entorno
El archivo `.env` necesario para el funcionamiento de este proyecto se genera ejecutando el alias `secrets` (que ejecuta `$HOME/mcp-secrets/add-secrets.sh`). Puedes ejecutarlo desde cualquier ubicación:

```bash
secrets
```

Esto creará o actualizará el archivo `.env` en tu directorio home (`~/.env`). Este archivo será cargado automáticamente al iniciar la terminal si existe.

## Uso

### Construir la imagen de Docker

Desde la carpeta `.gemini`, ejecuta:

```bash
docker build -t gemini-cli-tool .
```

### Levantar .gemini usando Docker (alias)

Puedes iniciar .gemini directamente con el alias:

```bash
gemini
```

Este alias ejecuta el contenedor Docker `gemini-cli-tool` con las variables y volúmenes necesarios, usando la variable `GEMINI_API_KEY` definida en tu `.env` y montando el volumen `~/.gemini`.

---

> Generado automáticamente.
