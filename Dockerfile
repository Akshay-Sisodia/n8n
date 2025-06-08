FROM n8nio/n8n:latest

USER root

# Install ffmpeg, python3, curl, and yt-dlp
RUN apk add --no-cache \
      ffmpeg \
      python3 \
      curl && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

# Ensure n8n binary is accessible and set correct permissions
RUN chmod +x /usr/local/bin/n8n && \
    mkdir -p /home/node/.n8n && \
    chown node:node /home/node/.n8n && \
    chmod 700 /home/node/.n8n

# Set environment variables for n8n and Render
ENV N8N_PORT=$PORT
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Expose the port (Render will override with PORT env variable, defaults to 8080)
EXPOSE $PORT

USER node

# Use the default n8n entrypoint
CMD ["/usr/local/bin/n8n", "start"]
