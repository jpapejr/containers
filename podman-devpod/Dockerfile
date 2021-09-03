FROM docker.io/library/ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt install -y golang curl dirmngr apt-transport-https lsb-release ca-certificates gcc g++ make tmux python3-pip bat vim \
    && curl -sL https://raw.githubusercontent.com/IBM-Cloud/ibm-cloud-developer-tools/master/linux-installer/idt-installer | bash \
    && ln -s /usr/bin/batcat /usr/local/bin/bat \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt update && apt install -y yarn && apt install -y nodejs && npm install -g ungit \
    && npm install -g typescript-language-server \
    && npm i @ibmgaragecloud/cloud-native-toolkit-cli \
    && git credential-cache start && pip install black python-lsp-server \
    && add-apt-repository ppa:ultradvorka/ppa && apt-get update &&  apt-get install hstr && hstr --show-configuration >> ~/.bashrc && . ~/.bashrc \
    && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && mkdir -p ~/projects

RUN curl -vvv https://gist.githubusercontent.com/jpapejr/4c437d71511ec7c44e00302b33d8575f/raw/119c9d8585f30614b8bb218e1c050adc315ff7e4/.tmux.conf -o ~/.tmux.conf
RUN curl -vvv https://gist.githubusercontent.com/jpapejr/7ad2aba0ea3e270dc99129bd7ca764f0/raw/a839a689535d9f897d3e890e3ce3e25dde5b8245/.vimrc -o ~/.vimrc

ENTRYPOINT ["/usr/bin/ungit"]
CMD ["--ungitBindIp", "0.0.0.0"]
