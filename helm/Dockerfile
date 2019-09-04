FROM jpapejr/command_runner:latest

ENV HELM_VERSION="2.14.3"

RUN apk add --update ca-certificates openssh-client \
  jq curl bash git gcc g++ make libffi-dev openssl-dev \
  && curl -o /usr/local/bin/helm https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
  && chmod +x /usr/local/bin/helm \
  && apk add python python-dev py-pip build-base \
  && rm /var/cache/apk/* \
  && pip install --upgrade pip \
  && pip install requests pytest pykube



CMD ["/usr/local/bin/helm"]
