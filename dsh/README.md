# DeepSeek Harness (`dsh`)

Runs the [deepseek-harness](https://github.com/deepseek-ai/deepseek-harness) Web UI on top of
`lscr.io/linuxserver/baseimage-ubuntu:jammy`.

## Build

```sh
docker build -t dsh .
# pin a release instead of the `latest` npm dist-tag:
docker build --build-arg DSH_VERSION=0.1.5-rc.3 -t dsh .
```

## Run

```sh
docker run --rm -it \
  -p 3080:3080 \
  -e PUID=$(id -u) -e PGID=$(id -g) \
  -e DEEPSEEK_API_KEY=sk-your-key-here \
  -v dsh-config:/config \
  -v "$PWD":/workspace \
  dsh
```

The startup URL carries a one-time process token, so read it from the logs rather than guessing it:

```sh
docker logs <container> | grep 'dsh web:'
```

## Environment variables

| Variable | Default | Meaning |
|---|---|---|
| `PUID` / `PGID` | `1000` | Ownership of `/config` and `/workspace`. |
| `DSH_HOME` | `/config/.dsh` | Harness home: profiles, sessions, credentials, skills. Lives under the `/config` volume so it survives a rebuild. |
| `DSH_WORKSPACE` | `/workspace` | Directory the agent and the Web UI operate in. |
| `DSH_PORT` | `3080` | Port bound inside the container. |
| `DSH_TRUSTED_HOSTS` | empty | Space-separated extra authorities accepted by the `/api` trust fence, for a deployment reached through a name that is neither `localhost` nor a LAN IP, e.g. `dsh.example.com dsh.internal:3080`. |
| `DEEPSEEK_API_KEY` | — | Model credential. `DEEPSEEK_BASE_URL` overrides the API endpoint. |

## Notes on the design

- **Node 22 + pnpm 11.** deepseek-harness pins Node.js `^22.19 || >=24` and pnpm 11; Ubuntu jammy
  ships neither, so Node comes from NodeSource and pnpm is installed globally — `dsh plugin` and
  the Web plugin manager shell out to `pnpm`.
- **Installed from npm, not built from source.** `npm i -g @deepseek-ai/dsh` is the documented
  end-user path and ships the frontend dist. Building the monorepo instead would need
  `pnpm install && pnpm run build` across a large pnpm workspace.
- **The bind address comes from a patch, not a flag.** The shipped `dsh web` command deliberately
  binds `127.0.0.1` and *rejects* `--host 0.0.0.0` so a local launch cannot expose remote code
  execution by accident. A container must be reachable through its published port, so
  `/etc/cont-init.d/10-workspace` writes `/etc/dsh/webserver.patch.yml` and the service passes it
  with `--patch`. Since a patch replaces the addressed row's *whole* config, the shipped gzip
  policy (level 1, 1024-byte threshold) is restated there.
- **`--no-open` is always passed**, because the default-browser handoff cannot work in a container.
- **Binding all interfaces is a real exposure.** The Host carries no TLS of its own; the `/api`
  trust fence plus browser-session authentication are the only controls. Terminate TLS in a
  reverse proxy and list its hostname in `DSH_TRUSTED_HOSTS`.
