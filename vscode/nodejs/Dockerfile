#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

FROM node:lts

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Configure apt and install packages
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils 2>&1 \ 
    #
    # Verify git and needed tools are installed
    && apt-get install -y git procps \
    #
    # Remove outdated yarn from /opt and install via package 
    # so it can be easily updated via apt-get upgrade yarn
    && rm -rf /opt/yarn-* \
    && rm -f /usr/local/bin/yarn \
    && rm -f /usr/local/bin/yarnpkg \
    && apt-get install -y curl apt-transport-https lsb-release \
    && curl -sS https://dl.yarnpkg.com/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/pubkey.gpg | apt-key add - 2>/dev/null \
    && echo "deb https://dl.yarnpkg.com/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get -y install --no-install-recommends yarn \
    #
    # Install eslint globally
    && npm install -g eslint \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog

########################
### Start customization
########################
RUN apt update && apt install -y zsh curl unzip wget software-properties-common iputils-ping dnsutils openssh-server
RUN /usr/sbin/update-rc.d ssh defaults

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

########################
### END customization
########################
