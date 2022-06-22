FROM docker.io/ubuntu:kinetic

ENV TAG="1.6.1"
ENV LANG="en_US.UTF-8"

WORKDIR /root
RUN apt-get update --yes
RUN apt-get install --yes wget
RUN apt-get install --yes haskell-stack
RUN stack upgrade
RUN wget https://github.com/tamarin-prover/tamarin-prover/archive/refs/tags/${TAG}.tar.gz
RUN tar xzf ${TAG}.tar.gz
WORKDIR /root/tamarin-prover-${TAG}
RUN stack setup
RUN stack install
RUN echo "export PATH=$HOME/.local/bin:~/.$PATH" >> "$HOME/.bashrc"
