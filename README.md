# tamarin-prover-container

Dockerfile for Tamarin prover

## Pulling from Docker Hub

For Tamarin prover 1.8.0

- `podman pull docker.io/darrenldl/tamarin-prover:1.8.0`

For Tamarin prover 1.6.1

- `podman pull docker.io/darrenldl/tamarin-prover:1.6.1`

For Tamarin prover 1.4.1

- `podman pull docker.io/darrenldl/tamarin-prover:1.4.1`

## Starting the container

```
./start-container.sh PROJECT_DIR
```

where `PROJECT_DIR` is the target project directory in user home directory, i.e. `~/PROJECT_DIR`.

## Running Tamarin

`tamarin-prover` is in `PATH` for normal commands.

To run Tamarin in interactive mode, we'll need Tamarin to listen on
not just the localhost interface via `--interface="*4"` argument.
To simplify this workflow, `interactive.sh` is also available in `PATH`,
which runs Tamarin in interactive mode using said interface argument
with the provided theory files.

Running `interactive.sh file0.spthy file1.spthy ...` is same as:

```
tamarin-prover interactive --interface="*4" file0.spthy file1.spthy ...
```
