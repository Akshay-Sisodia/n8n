FROM n8nio/n8n:latest

USER root

# Install ffmpeg, Python3, and yt-dlp
:contentReference[oaicite:2]{index=2} \
    :contentReference[oaicite:3]{index=3} \
      ffmpeg \
      python3 \
      yt-dlp  \
      curl

USER node
