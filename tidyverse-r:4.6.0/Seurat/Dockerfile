FROM registry.cn-hangzhou.aliyuncs.com/wybioinfo/rocker-tidyverse-r:4.6.0
RUN apt-get update && apt-get install -y  libglpk-dev \
    && rm -rf /var/lib/apt/lists/*
RUN R -e "install.packages('Seurat') "
RUN R -e "setRepositories(ind = 1:3, addURLs = c('https://satijalab.r-universe.dev', 'https://bnprks.r-universe.dev/')); install.packages(c('BPCells', 'presto', 'glmGamPoi'))"

# docker build -t registry.cn-hangzhou.aliyuncs.com/wybioinfo/rocker-tidyverse-r-seurat:4.6.0 .
# docker run --rm -it registry.cn-hangzhou.aliyuncs.com/wybioinfo/rocker-tidyverse-r-seurat:4.6.0 bash
# export HTTP_PROXY=http://198.19.5.216:7890
# export HTTPS_PROXY=http://198.19.5.216:7890