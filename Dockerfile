ARG UBUNTU_TAG="kinetic"
FROM docker.io/ubuntu:${UBUNTU_TAG}

ARG TAG="1.6.1"

ENV LANG="en_US.UTF-8"
ENV PATH="/root/.local/bin:$PATH"

WORKDIR /root
RUN apt-get update --yes
RUN apt-get install --yes wget
RUN apt-get install --yes libz-dev
RUN apt-get install --yes maude
RUN apt-get install --yes haskell-stack
RUN apt-get install --yes locales
RUN apt-get install --yes netbase
RUN locale-gen "en_US.UTF-8"
RUN stack upgrade
RUN wget https://github.com/tamarin-prover/tamarin-prover/archive/refs/tags/${TAG}.tar.gz
RUN tar xzf ${TAG}.tar.gz
RUN rm ${TAG}.tar.gz
WORKDIR /root/tamarin-prover-${TAG}
RUN stack setup
RUN stack install
RUN rm -r /root/tamarin-prover-${TAG}
RUN apt-get install --yes graphviz
RUN apt-get install --yes python3
