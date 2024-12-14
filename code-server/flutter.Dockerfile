FROM lscr.io/linuxserver/code-server:latest

RUN sudo apt-get update -y && sudo apt-get upgrade -y && \
    sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir /config/data
RUN mkdir /config/data/Downloads
RUN mkdir /config/data/development
WORKDIR /config/data
    RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.3-stable.tar.xz -O ./Downloads/flutter_linux_3.24.3-stable.tar.xz && \
    tar -xf ./Downloads/flutter_linux_3.24.3-stable.tar.xz -C ./development/
ENV PATH="$PATH:/config/data/development/flutter/bin"
    # RUN echo 'export PATH="~/development/flutter/bin:$PATH"' >> ~/.profile
RUN wget https://dl-ssl.google.com/linux/linux_signing_key.pub -O /tmp/google.pub && \
    gpg --no-default-keyring \
    --keyring /etc/apt/keyrings/google-chrome.gpg \
    --import /tmp/google.pub && \
    echo 'deb [arch=amd64 signed-by=/etc/apt/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list 
RUN sudo apt-get update -y; sudo apt-get install -y google-chrome-stable