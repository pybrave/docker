FROM   ubuntu:questing-20250721
RUN apt-get update && apt-get install wget  libz-dev -y
RUN wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
RUN bash Miniforge3-$(uname)-$(uname -m).sh  -b  -p /opt/miniforge3
RUN rm Miniforge3-$(uname)-$(uname -m).sh 

ENV PATH=/opt/miniforge3/bin:$PATH
SHELL ["bash", "-c"]

# sudo apt-get install libz-dev

RUN mamba  install conda-forge::r-base -y
# RUN conda create -n myenv python=3.11 -y \
#     && conda clean -afy
# RUN echo "conda activate myenv" >> ~/.bashrc

CMD ["bash"]

# Sys.setenv(MAKEFLAGS = "-j6") 
# https://github.com/conda-forge/miniforge
#  docker  build  -t miniforge .
# docker run --rm -it  miniforge bash