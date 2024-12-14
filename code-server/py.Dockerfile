FROM lscr.io/linuxserver/code-server:latest

RUN sudo apt update

RUN sudo apt install python3-pip -y
RUN sudo apt install python3-venv -y
RUN eval "$(ssh-agent -s)"
RUN ssh-add ~/.ssh/fhw_github
RUN adduser pythonuser
USER pythonuser
RUN sudo apt install sagemath -y
