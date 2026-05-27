# LanguageTool Docker

🚀 Proyecto para ejecutar LanguageTool en un contenedor Docker.

## 📦 Qué incluye

- `Dockerfile` para construir la imagen de LanguageTool
- `docker-compose.yml` para iniciar el servicio fácilmente
- `server.properties` con configuración de servidor y rendimiento
- `.env.example` para personalizar variables de entorno

## ⚙️ Requisitos

- Docker
- Docker Compose

## ▶️ Cómo usar

1. Copia el archivo de ejemplo:

   ```bash
   cp .env.example .env
   ```

2. Ajusta variables si es necesario.

3. Inicia el servicio:

   ```bash
   docker compose up -d
   ```

4. Verifica que el contenedor esté en funcionamiento:

   ```bash
   docker compose ps
   ```

## 🌐 Acceso

El servicio se construye usando el `Dockerfile` y se ejecuta con `docker-compose`. Usa la imagen `devidence-languagetool` y la versión definida por `LT_VERSION`.

## 📝 Configuración

- `LT_VERSION`: versión de LanguageTool (por defecto `6.7`)
- `TZ`: zona horaria (por defecto `UTC`)

La configuración del servidor está en `server.properties`.

## 💡 Notas

- El contenedor está configurado para reiniciar automáticamente con `restart: unless-stopped`
- El proyecto está pensado para correr de forma sencilla en entornos Docker

## 📚 Extras

Si quieres modificar la configuración, edita `server.properties` o ajusta el `.env`.
