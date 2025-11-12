FROM registry.cn-hangzhou.aliyuncs.com/wybioinfo/maaslin2:1.22
# RUN R -e "install.packages('circlize')"
# RUN R -e "BiocManager::install('ComplexHeatmap')"
<<<<<<< HEAD
# RUN R -e "install.packages('ggforce')"
=======
RUN R -e "BiocManager::install('clusterProfiler')"
RUN R -e "BiocManager::install('pathview')"

>>>>>>> 7e5df8b5c34979cc78400c1ef9d649a41fe23b4e
# RUN R -e "install.packages('Hmisc')"
RUN R -e "install.packages('networkD3')"
# docker build -t registry.cn-hangzhou.aliyuncs.com/wybioinfo/maaslin2:1.22  -f update.dockerfile .
# docker run --rm -it registry.cn-hangzhou.aliyuncs.com/wybioinfo/maaslin2:1.22  bash