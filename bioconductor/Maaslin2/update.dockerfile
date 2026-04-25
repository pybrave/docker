FROM registry.cn-hangzhou.aliyuncs.com/wybioinfo/maaslin2:1.22
# RUN R -e "install.packages('circlize')"
# RUN R -e "BiocManager::install('ComplexHeatmap')"
# RUN R -e "install.packages('ggforce')"
# RUN R -e "install.packages('Hmisc')"
RUN R -e "install.packages('networkD3')"
# docker build -t registry.cn-hangzhou.aliyuncs.com/wybioinfo/maaslin2:1.22  -f update.dockerfile .
# docker run --rm -it registry.cn-hangzhou.aliyuncs.com/wybioinfo/maaslin2:1.22  bash