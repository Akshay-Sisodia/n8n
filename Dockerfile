FROM n8nio/n8n:latest

USER root

# Install ffmpeg, python3, curl, and yt-dlp
RUN apk add --no-cache \
      ffmpeg \
      python3 \
      curl && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

# Set environment variable to configure n8n to use Render's PORT
ENV N8N_PORT=$PORT

# Expose the port (Render will override with PORT env variable, defaults to 8080)
EXPOSE $PORT

USER node

# Use the default n8n entrypoint
CMD ["n8n", "start"]
