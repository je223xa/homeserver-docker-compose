# Use the LinuxServer Code Server as the base image
FROM lscr.io/linuxserver/code-server:latest

# Install essential packages and LaTeX with support for English and German
RUN apt-get update && \
    apt-get install -y \
        haskell-platform \
        python3-pip \
        git \
        libtinfo-dev \
        libzmq3-dev \
        libcairo2-dev \
        libpango1.0-dev \
        libmagic-dev \
        libblas-dev \
        liblapack-dev && \
    curl -sSL https://get.haskellstack.org/ | sh && \
    git clone https://github.com/gibiansky/IHaskell && \
    cd IHaskell && \
    pip3 install -r requirements.txt && \
    stack install --fast && \
    ihaskell install --stack

WORKDIR /workspace

