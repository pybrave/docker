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

# Make the colourful prompt apply to *every* interactive shell, not just
# `abc`'s login shell.  /etc/profile.d/*.sh covers login shells, and the
# line appended to /etc/bash.bashrc covers interactive non-login shells
# (e.g. `docker exec -it <container> bash`, the JupyterLab terminal).
RUN printf '\n# Global colourful prompt (see /etc/profile.d/20-gobrave-prompt.sh)\n[ -n "$PS1" ] && . /etc/profile.d/20-gobrave-prompt.sh\n' >> /etc/bash.bashrc

WORKDIR ${JUPYTER_WORKSPACE}

EXPOSE 8888

# docker build -t registry.cn-hangzhou.aliyuncs.com/wybioinfo/gobrave-jupyter .
# docker run --rm -p 8888:8888  -e PUID=$(id -u) -e PGID=$(id -g)  registry.cn-hangzhou.aliyuncs.com/wybioinfo/gobrave-jupyter
