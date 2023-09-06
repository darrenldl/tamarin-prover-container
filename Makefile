.PHONY: build-1.8.0
build-1.8.0:
	podman build . --build-arg UBUNTU_TAG="jammy" \
		--build-arg TAG="1.8.0" -t localhost/tamarin-prover:1.8.0

.PHONY: push-1.8.0
push-1.8.0:
	podman tag localhost/tamarin-prover:1.8.0 docker.io/darrenldl/tamarin-prover:1.8.0
	podman push docker.io/darrenldl/tamarin-prover:1.8.0

.PHONY: build-1.6.1
build-1.6.1:
	podman build . --build-arg UBUNTU_TAG="kinetic" \
		--build-arg TAG="1.6.1" -t localhost/tamarin-prover:1.6.1

.PHONY: build-1.4.1
build-1.4.1:
	podman build . --build-arg UBUNTU_TAG="focal" \
		--build-arg TAG="1.4.1" -t localhost/tamarin-prover:1.4.1
