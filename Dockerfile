FROM n8nio/n8n:latest

USER root

# Install ffmpeg, python3, curl, and yt-dlp
RUN apk add --no-cache \
      ffmpeg \
      python3 \
      curl && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

# Set up n8n config directory permissions
RUN mkdir -p /home/node/.n8n && \
    chown node:node /home/node/.n8n && \
    chmod 700 /home/node/.n8n

# Set environment variable for config permissions
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Expose n8n's default port
EXPOSE 5678

USER node

# Use the base image's default entrypoint and command
CMD ["start"]
