FROM docker.io/ubuntu:kinetic

ENV LANG="en_US.UTF-8"
ENV PATH="/root/.local/bin:$PATH"

WORKDIR /root
RUN apt-get update --yes
RUN apt-get install --yes wget
RUN apt-get install --yes libz-dev
RUN apt-get install --yes maude
RUN apt-get install --yes haskell-stack
RUN apt-get install locales
RUN locale-gen "en_US.UTF-8"
RUN stack upgrade
RUN wget https://github.com/tamarin-prover/tamarin-prover/archive/refs/tags/${TAG}.tar.gz
RUN tar xzf ${TAG}.tar.gz
WORKDIR /root/tamarin-prover-${TAG}
RUN stack setup
RUN stack install
