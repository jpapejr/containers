#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

FROM golang:1

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# This Dockerfile adds a non-root 'vscode' user with sudo access. However, for Linux,
# this user's GID/UID must match your local user UID/GID to avoid permission issues
# with bind mounts. Update USER_UID / USER_GID if yours is not 1000. See
# https://aka.ms/vscode-remote/containers/non-root-user for details.
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Configure apt, install packages and tools
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    #
    # Verify git, process tools, lsb-release (common in install instructions for CLIs) installed
    && apt-get -y install git iproute2 procps lsb-release \
    #
    # Install gocode-gomod
    && go get -x -d github.com/stamblerre/gocode 2>&1 \
    && go build -o gocode-gomod github.com/stamblerre/gocode \
    && mv gocode-gomod $GOPATH/bin/ \
    #
    # Install Go tools
    && go get -u -v \
        github.com/mdempsky/gocode \
        github.com/uudashr/gopkgs/cmd/gopkgs \
        github.com/ramya-rao-a/go-outline \
        github.com/acroca/go-symbols \
        github.com/godoctor/godoctor \
        golang.org/x/tools/cmd/guru \
        golang.org/x/tools/cmd/gorename \
        github.com/rogpeppe/godef \
        github.com/zmb3/gogetdoc \
        github.com/haya14busa/goplay/cmd/goplay \
        github.com/sqs/goreturns \
        github.com/josharian/impl \
        github.com/davidrjenni/reftools/cmd/fillstruct \
        github.com/fatih/gomodifytags \
        github.com/cweill/gotests/... \
        golang.org/x/tools/cmd/goimports \
        golang.org/x/lint/golint \
        golang.org/x/tools/cmd/gopls \
        github.com/alecthomas/gometalinter \
        honnef.co/go/tools/... \
        github.com/golangci/golangci-lint/cmd/golangci-lint \
        github.com/mgechev/revive \
        github.com/derekparker/delve/cmd/dlv 2>&1 \
    #
    # Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # [Optional] Add sudo support
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

########################
### Start customization
########################
RUN apt update && apt install -y zsh curl unzip wget software-properties-common iputils-ping dnsutils openssh-server apt-transport-https gnupg2 \
    && apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

ADD entry.sh /
RUN chmod +x /entry.sh

RUN add-apt-repository -y ppa:projectatomic/ppa
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
RUN sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

RUN wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
RUN tar xvfz openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz \
    && mv ./openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc /usr/local/bin/oc

RUN curl -sL https://ibm.biz/idt-installer | bash
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
RUN cp /root/.oh-my-zsh/templates/zshrc.zsh-template /root/.zshrc
RUN git clone https://github.com/denysdovhan/spaceship-prompt.git "/root/.oh-my-zsh/custom/themes/spaceship-prompt"
RUN ln -s "/root/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "/root/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
RUN sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"spaceship\"/g" /root/.zshrc

ADD https://github.com/wercker/stern/releases/download/1.10.0/stern_linux_amd64 /usr/local/bin/stern
ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /usr/local/bin/jq
ADD https://github.com/sharkdp/bat/releases/download/v0.10.0/bat-musl_0.10.0_amd64.deb /root/bat.deb
ADD https://github.com/derailed/k9s/releases/download/0.6.5/k9s_0.6.5_Linux_x86_64.tar.gz /usr/local/bin/k9s.tgz
ADD https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip /usr/local/bin/ngrok.zip
ADD https://raw.githubusercontent.com/jpapejr/docker/master/ibmcloud/get-iks-configs.sh /usr/local/bin/get-iks-configs.sh
ADD https://raw.githubusercontent.com/helm/helm/master/scripts/completions.bash /root/helm.bash
RUN cd /usr/local/bin && unzip -d . ngrok.zip
RUN cd /usr/local/bin/ && tar xvfz /usr/local/bin/k9s.tgz && cd -

RUN dpkg -i /root/bat.deb \
    && chmod -R +x /usr/local/bin/* \
    && echo "autoload -Uz compinit" >> /root/.zshrc \
    && echo "compinit" >> /root/.zshrc \
    && echo "source <(kubectl completion zsh)" >> /root/.zshrc \
    &&  echo "source /usr/local/ibmcloud/autocomplete/zsh_autocomplete " >> /root/.zshrc \
    && mkdir -p /root/.kube

ENTRYPOINT [ "/entry.sh" ]
########################
### END customization
########################
