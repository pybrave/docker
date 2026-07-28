FROM registry.cn-hangzhou.aliyuncs.com/wybioinfo/rocker-tidyverse-r:4.6.0
# RUN apt-get update && apt install  cmake -y
# RUN apt-get install libnlopt-dev -y
# RUN apt-get update && apt install  libglpk-dev -y
RUN apt-get update && apt install  libgsl-dev  -y


