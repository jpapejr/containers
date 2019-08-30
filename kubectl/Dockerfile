FROM jpapejr/command_runner:latest

ENV KUBECTL_VERSION="v1.13.0"

RUN apk add --update ca-certificates openssh-client \
  jq curl bash git gcc g++ make libffi-dev openssl-dev \
  && curl -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
  && chmod +x /usr/local/bin/kubectl \
  && apk add python python-dev py-pip build-base \
  && rm /var/cache/apk/* \
  && pip install --upgrade pip \
  && pip install requests pytest pykube


RUN curl -fsSLO "https://storage.googleapis.com/krew/v0.2.1/krew.{tar.gz,yaml}" && tar zxvf krew.tar.gz \
    && ./krew-linux_amd64 install krew  && mv /root/.krew/store/krew/*/krew /usr/local/bin/kubectl-krew


EXPOSE 8000
EXPOSE 8001

CMD ["/usr/local/bin/kubectl version --client"]
