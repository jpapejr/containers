FROM jpapejr/command_runner:latest

ENV JX_VERSION="2.0.692"
ENV KUBECTL_VERSION="v1.14.0"
ENV HELM_VERSION="2.14.3"

RUN apk add --update ca-certificates openssh-client \
  jq curl bash git gcc g++ make libffi-dev openssl-dev \
  && curl -L -o /tmp/jx.tar.gz https://github.com/jenkins-x/jx/releases/download/v${JX_VERSION}/jx-linux-amd64.tar.gz \
  && cd /tmp && tar xvfz jx.tar.gz \
  && mv jx /usr/local/bin/jx \
  && chmod +x /usr/local/bin/jx \
  && curl -o /tmp/helm.tar.gz https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
  && cd /tmp && tar xvfz helm.tar.gz \
  && mv /tmp/linux-amd64/helm /usr/local/bin/helm \
  && chmod +x /usr/local/bin/helm \
  && curl -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
  && chmod +x /usr/local/bin/kubectl \
  && apk add python python-dev py-pip build-base \
  && rm /var/cache/apk/* \
  && pip install --upgrade pip \
  && pip install requests pytest pykube

RUN chmod -R ugo+rwx /tmp

EXPOSE 8000
EXPOSE 8001

CMD ["/usr/local/bin/jx --help"]
