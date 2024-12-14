FROM lscr.io/linuxserver/code-server:latest

# Set environment variables for non-interactive installation of packages
ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y \
		openjdk-17-jdk-headless \
		maven \
		git \
		curl \
                ant \
		junit \
		subversion && \ 
	apt-get clean

# Set Java environment variables (adjust as needed)
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$PATH:$JAVA_HOME/bin
