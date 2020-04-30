FROM ubuntu:latest 
LABEL maintainer="jpapejr@icloud.com"
ENV PACKAGES "git"
RUN apt update && apt install $PACKAGES -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir -p /root/data
WORKDIR /root/data
VOLUME /root/data
ENTRYPOINT ["/usr/bin/git"]

