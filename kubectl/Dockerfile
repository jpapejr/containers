FROM ubuntu:18.04 
LABEL maintainer="jpapejr@icloud.com"
ENV TERM xterm-256color
RUN apt update &&  apt install -y apt-transport-https curl gnupg \
    && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg |  apt-key add - \ 
    && touch /etc/apt/sources.list.d/kubernetes.list && echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" |  tee -a /etc/apt/sources.list.d/kubernetes.list \
    && apt update && apt install -y kubectl && apt clean


ENTRYPOINT ["/usr/bin/kubectl"]
