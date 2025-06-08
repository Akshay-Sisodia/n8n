# Use official n8n image as base
FROM n8nio/n8n:latest

USER root

# Install ffmpeg and yt-dlp
RUN apt-get update && \
    apt-get install -y ffmpeg curl python3-pip && \
    pip3 install --no-cache-dir yt-dlp && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Ensure yt-dlp is available globally
RUN ln -s /usr/local/bin/yt-dlp /usr/bin/yt-dlp

USER node
