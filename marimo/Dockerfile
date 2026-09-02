FROM lscr.io/linuxserver/baseimage-ubuntu:jammy

ENV PUID=1000
ENV PGID=1000

RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    pip3 install --no-cache-dir marimo && \
    rm -rf /var/lib/apt/lists/*

COPY root/ /
RUN chmod +x /etc/cont-init.d/10-workspace /etc/services.d/marimo/run

WORKDIR /workspace

EXPOSE 8080