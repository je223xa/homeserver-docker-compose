# Use the LinuxServer Code Server as the base image
FROM lscr.io/linuxserver/code-server:latest

# Install essential packages and LaTeX with support for English and German
RUN apt-get update && \
    apt-get install -y \
	latexmk \
	texlive texstudio \
	texlive-full \
	xzdec \
	python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    python3 -m pip install setuptools &&\
    python3 -m pip install pygments

# Set the default working directory
WORKDIR /workspace
