FROM alpine:latest 
LABEL maintainer="jpapejr@icloud.com"
ENV TERM xterm-256color
ENV PACKAGES "unzip curl openssl ca-certificates git ruby ruby-json libc6-compat"
ENV STERN_VERSION 1.7.0
RUN apk add --update $PACKAGES && rm -rf /var/cache/apk/*
RUN curl -L "https://github.com/wercker/stern/releases/download/${STERN_VERSION}/stern_linux_amd64" -o "/usr/local/bin/stern" && chmod +x /usr/local/bin/stern

ENTRYPOINT ["/usr/local/bin/stern"]
