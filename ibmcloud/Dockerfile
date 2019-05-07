FROM ubuntu:18.04 
LABEL maintainer="jpapejr@icloud.com"
ENV TERM xterm-256color
RUN apt update && apt install curl bash-completion vim -y && apt clean
RUN curl -sL https://ibm.biz/idt-installer | bash
ADD https://github.com/wercker/stern/releases/download/1.10.0/stern_linux_amd64 /usr/local/bin/stern
ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /usr/local/bin/jq
ADD https://github.com/sharkdp/bat/releases/download/v0.10.0/bat-musl_0.10.0_amd64.deb /root/bat.deb
RUN dpkg -i /root/bat.deb
RUN mkdir -p /root/.bluemix/plugins/container-service/clusters
COPY bash_aliases /root/.bash_aliases
RUN echo "source /usr/share/bash-completion/bash_completion" >> /root/.bashrc \
    && echo 'source <(kubectl completion bash)' >> /root/.bashrc \
    && echo "export KUBECONFIG=\$(/usr/local/bin/iks-merged-config.sh)" >> /root/.bashrc
RUN kubectl completion bash >/etc/bash_completion.d/kubectl \
    && helm completion bash >/etc/bash_completion.d/helm \ 
    && cp /usr/local/ibmcloud/autocomplete/bash_autocomplete /etc/bash_completion.d/ibmcloud
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
RUN ibmcloud plugin install -f infrastructure-service
COPY get-iks-configs.sh /usr/local/bin/get-iks-configs.sh
COPY iks-merged-config.sh /usr/local/bin/iks-merged-config.sh
RUN chmod -R +x /usr/local/bin/*
ENTRYPOINT ["tail","-f","/dev/null"]
EXPOSE 8001 20001 3000
#docker run -d -v $HOME:/Users/jtpape -P --name ibmcloud --hostname ibmcloud ibmcloud:latest
