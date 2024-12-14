# Use the LinuxServer Code Server as the base image
FROM lscr.io/linuxserver/code-server:latest

# Install essential packages and LaTeX with support for English and German
RUN apt-get update && \
    apt-get install -y \
	latexmk \
	texlive texstudio \
	texlive-full \
	xzdec \
	python3-pip \
	python3-pygments \
	python3-setuptools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the default working directory
WORKDIR /workspace
