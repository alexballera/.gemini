# Usar la imagen oficial de Node como base
FROM node:20-alpine

# Instalar el CLI de Gemini de forma global dentro de la imagen
RUN npm install -g @google/gemini-cli

# Establecer "gemini" como el comando por defecto al ejecutar el contenedor
ENTRYPOINT ["gemini"]
