# Jupyter Docker Image

To install and run JupyterLab locally, follow these steps:
```zsh
uv pip venv .venv
source .venv/bin/activate
uv pip install pip --upgrade
uv pip install jupyterlab --upgrade
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --ServerApp.token='' --ServerApp.password=''
```
In order to retrieve the docker image, type:
```zsh
docker pull abmhamdi/jupyter
```
The steps below can be used to rebuild the docker image:
```zsh
docker build -t jupyter:local .
docker run --rm -p 8888:8888 jupyter:local
```
+ The server is accessible via port 8888;
+ No password is required.

By default, JupyterLab opens `/workspace`. Set `JUPYTER_WORKSPACE` to use a
different working directory; the directory is created and assigned to the
container user when the container starts:

```zsh
docker run --rm -p 8888:8888 \
	-e JUPYTER_WORKSPACE=/data/notebooks \
	-v "$PWD/notebooks:/data/notebooks" \
	jupyter:local
```

## Serving under a sub-path

Set `JUPYTER_BASE_URL` to serve Jupyter under a URL prefix (e.g. behind a
reverse proxy). It defaults to `/`:

```zsh
docker run --rm -p 8888:8888 \
	-e JUPYTER_BASE_URL=/jupyter/ \
	jupyter:local
```
+ The server is then accessible at `http://localhost:8888/jupyter/`.
