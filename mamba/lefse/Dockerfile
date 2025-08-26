FROM   jupyter/base-notebook
# https://forum.biobakery.org/t/no-taxa-labels-after-lefse-plot-cladogram-py/5868/3
RUN mamba create -n lefse -c bioconda rpy2==3.5.10 numpy==1.24.3 lefse  -y   && conda clean -afy
RUN pip install pandas
ENV PATH=/opt/conda/envs/lefse/bin:$PATH
RUN rm -rf /home/jovyan/.cache
COPY  lefse /tmp/lefse 
USER root
RUN cd /tmp/lefse && \
    conda run -n lefse pip install . && \
    rm -rf /tmp/lefse

# RUN mamba create -n myenv python=3.11 -y \
#     && conda clean -afy
# 


# docker build -t registry.cn-hangzhou.aliyuncs.com/wybioinfo/lefse  .

# Sys.setenv(MAKEFLAGS = "-j6") 
# https://github.com/conda-forge/miniforge
#  docker  build  -t miniforge .
# docker run --rm -it  miniforge bash
# docker build -t registry.cn-hangzhou.aliyuncs.com/wybioinfo/lefse  .
#  docker run --rm  -e NB_UID=$(id -u)  -p 8888:8888  -it -v $PWD:$PWD -w $PWD  registry.cn-hangzhou.aliyuncs.com/wybioinfo/lefse start.sh jupyter notebook --notebook-dir=/workspace/docker/bioconductor --NotebookApp.password='' --NotebookApp.token='' 
#  docker run --rm  --user $(id -u)  -p 8888:8888  -it -v $PWD:$PWD -w $PWD  registry.cn-hangzhou.aliyuncs.com/wybioinfo/lefse
#  docker run --rm -it -p 8888:8888 -v $PWD:$PWD -w $PWD  registry.cn-hangzhou.aliyuncs.com/wybioinfo/lefse bash
# lefse_format_input.py hmp_small_aerobiosis.txt hmp_small_aerobiosis.in -c 1 -s 2 -u 3 -o 1000000
#  lefse_run.py hmp_small_aerobiosis.in hmp_small_aerobiosis.res
# lefse_plot_res.py hmp_small_aerobiosis.res hmp_aerobiosis_small1.png
# lefse_plot_cladogram.py hmp_small_aerobiosis.res hmp_aerobiosis_small.cladogram.png --format png