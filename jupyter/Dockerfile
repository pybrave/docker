FROM lscr.io/linuxserver/baseimage-ubuntu:jammy

ENV PUID=1000
ENV PGID=1000
ENV JUPYTER_WORKSPACE=/workspace
ENV JUPYTER_BASE_URL=/
ENV SHELL=/bin/bash

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv vim wget && \
    pip3 install --no-cache-dir jupyterlab && \
    chsh -s /bin/bash root && \
    usermod -s /bin/bash abc && \
    rm -rf /var/lib/apt/lists/*

COPY root/ /
RUN chmod +x /etc/cont-init.d/10-workspace /etc/services.d/jupyter/run

WORKDIR ${JUPYTER_WORKSPACE}

COPY .bashrc /config/.bashrc

EXPOSE 8888

# docker build -t registry.cn-hangzhou.aliyuncs.com/wybioinfo/gobrave-jupyter .
# docker run --rm -p 8888:8888  -e PUID=$(id -u) -e PGID=$(id -g)  registry.cn-hangzhou.aliyuncs.com/wybioinfo/gobrave-jupyter
