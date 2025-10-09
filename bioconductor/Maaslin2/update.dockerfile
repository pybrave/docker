FROM registry.cn-hangzhou.aliyuncs.com/wybioinfo/maaslin2:1.22
RUN R -e "install.packages('circlize')"
RUN R -e "BiocManager::install('ComplexHeatmap')"

# RUN R -e "install.packages('Hmisc')"

# docker build -t registry.cn-hangzhou.aliyuncs.com/wybioinfo/maaslin2:1.22  -f update.dockerfile .
# docker run --rm -it registry.cn-hangzhou.aliyuncs.com/wybioinfo/maaslin2:1.22  bash