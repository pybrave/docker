# Marimo Docker Image

To install and run Marimo, follow these steps:
```zsh
uv pip venv .venv
source .venv/bin/activate
uv pip install pip --upgrade
uv pip install -r requirements.txt --upgrade
marimo edit --port 1357 --headless --no-token
```
In order to retrieve the docker image, type:
```zsh
docker pull abmhamdi/marimo
```
The steps below can be used to rebuild the docker image:
```zsh
docker build -t marimo:local .
docker run --rm -p 1357:1357 marimo:local
```
+ The server is accessible via port 1357;
+ No password is required.

By default, Marimo opens `/workspace`. Set `MARIMO_WORKSPACE` to use a different
working directory; the directory is created and assigned to the container user
when the container starts:

```zsh
docker run --rm -p 8080:8080 \
	-e MARIMO_WORKSPACE=/data/notebooks \
	-v "$PWD/notebooks:/data/notebooks" \
	marimo:local
```
