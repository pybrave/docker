FROM registry.cn-hangzhou.aliyuncs.com/wybioinfo/bowtie2:latest
RUN apt-get update && apt-get install samtools  -y && apt-get clean

