FROM ubuntu:18.04 
LABEL maintainer="jpapejr@icloud.com"
ENV TERM xterm-256color
RUN apt update && apt install curl -y && apt clean
#RUN ln -s /lib/ /lib64 # FIXME: Remove for Alpine >= 3.6
RUN curl -L "https://clis.ng.bluemix.net/download/bluemix-cli/latest/linux64" | tar -zx -C /usr/local/bin && chmod +x /usr/local/bin/Bluemix_CLI/bin/ibmcloud && chmod +x /usr/local/bin/Bluemix_CLI/bin/cfcli/cf
RUN curl -L 'https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64' -o /usr/local/bin/jq && chmod +x /usr/local/bin/jq
ENTRYPOINT ["/usr/local/bin/Bluemix_CLI/bin/ibmcloud"]
