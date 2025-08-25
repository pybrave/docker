FROM   ubuntu:questing-20250721
RUN apt-get update && apt-get install wget  libz-dev -y
RUN wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
RUN bash Miniforge3-$(uname)-$(uname -m).sh  -b  -p /opt/miniforge3
RUN rm Miniforge3-$(uname)-$(uname -m).sh 

ENV PATH=/opt/miniforge3/bin:$PATH
SHELL ["bash", "-c"]

# sudo apt-get install libz-dev

# RUN mamba  install -c bioconda lefse   rpy2==3.5.10 numpy==1.24.3 -y
RUN mamba create -n lefse -c bioconda rpy2==3.5.10 numpy==1.24.3 lefse  -y   && conda clean -afy
# RUN echo "conda init && conda activate lefse" >> ~/.bashrc
ENV PATH=/opt/miniforge3/envs/lefse/bin:$PATH
# RUN mamba create -n myenv python=3.11 -y \
#     && conda clean -afy
# 

CMD ["bash"]

# docker build -t registry.cn-hangzhou.aliyuncs.com/wybioinfo/lefse  .

# Sys.setenv(MAKEFLAGS = "-j6") 
# https://github.com/conda-forge/miniforge
#  docker  build  -t miniforge .
# docker run --rm -it  miniforge bash
# docker build -t registry.cn-hangzhou.aliyuncs.com/wybioinfo/lefse  .
#  docker run --rm --user $(id -u ) -it -v $PWD:$PWD -w $PWD  registry.cn-hangzhou.aliyuncs.com/wybioinfo/lefse bash
#  docker run --rm -it -v $PWD:$PWD -w $PWD  registry.cn-hangzhou.aliyuncs.com/wybioinfo/lefse bash
# lefse_format_input.py hmp_small_aerobiosis.txt hmp_small_aerobiosis.in -c 1 -s 2 -u 3 -o 1000000
#  lefse_run.py hmp_small_aerobiosis.in hmp_small_aerobiosis.res
# lefse_plot_res.py hmp_small_aerobiosis.res hmp_aerobiosis_small.png
# lefse_plot_cladogram.py hmp_small_aerobiosis.res hmp_aerobiosis_small.cladogram.png --format png