FROM lscr.io/linuxserver/code-server:latest

RUN apt-get update && \
	apt-get upgrade -y && \
        apt-get install -y \
		sl \
		curl \
		git \
		subversion \
		build-essential && \
	apt-get clean \
