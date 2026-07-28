# FROM registry.cn-hangzhou.aliyuncs.com/wybioinfo/maaslin2:1.22
FROM registry.cn-hangzhou.aliyuncs.com/wybioinfo/cellchat:v2
RUN R -e 'devtools::install_github("sqjin/CellChat")'
RUN R -e 'install.packages("Seurat")'
# docker build -t registry.cn-hangzhou.aliyuncs.com/wybioinfo/cellchat-seurat:v2 .