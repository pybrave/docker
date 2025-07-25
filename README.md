+ <https://hub.docker.com/r/jupyter/datascience-notebook/tags>

```
docker pull jupyter/datascience-notebook:x86_64-ubuntu-22.04
docker tag jupyter/datascience-notebook:x86_64-ubuntu-22.04 registry.cn-hangzhou.aliyuncs.com/wybioinfo/datascience-notebook:x86_64-ubuntu-22.04
```
```
docker run -it -p 8888:8888 registry.cn-hangzhou.aliyuncs.com/wybioinfo/datascience-notebook:x86_64-ubuntu-22.04
```
```
docker run -it \
    -e NB_UID=$(id -u) \
    -e NB_GID=$(id -g) \
     -p 8888:8888 registry.cn-hangzhou.aliyuncs.com/wybioinfo/datascience-notebook:x86_64-ubuntu-22.04
```
```
docker run -it \
    --user "$(id -u)" --group-add users \
     -p 8888:8888 registry.cn-hangzhou.aliyuncs.com/wybioinfo/datascience-notebook:x86_64-ubuntu-22.04 \
      jupyter notebook --NotebookApp.password='' --NotebookApp.token='' --NotebookApp.base_url='/jupyter' --allow-root

```
> <https://jupyter-docker-stacks.readthedocs.io/en/latest/using/troubleshooting.html>

