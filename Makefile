.PHONY: all
all: build-1.6.1 build-1.4.1

.PHONY: build-1.6.1
build-1.6.1:
	podman build . --build-arg=TAG="1.6.1" -t tamarin:1.6.1

.PHONY: build-1.4.1
build-1.4.1:
	podman build . --build-arg=TAG="1.4.1" -t tamarin:1.4.1
