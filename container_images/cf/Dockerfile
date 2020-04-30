FROM alpine:latest
LABEL maintainer="jpapejr@icloud.com"
ENV CF_CLI_VERSION 6.37.0
ENV PACKAGES "unzip curl openssl ca-certificates git ruby ruby-json libc6-compat"
ENV TERM xterm-256color
RUN apk add --update $PACKAGES && rm -rf /var/cache/apk/*
#RUN ln -s /lib/ /lib64 # FIXME: Remove for Alpine >= 3.6
RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&version=${CF_CLI_VERSION}" | tar -zx -C /usr/local/bin
RUN curl -L 'https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64' -o /usr/local/bin/jq && chmod +x /usr/local/bin/jq

ENTRYPOINT ["/usr/local/bin/cf"]
