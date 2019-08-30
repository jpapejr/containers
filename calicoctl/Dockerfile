FROM jpapejr/command_runner:latest

ENV CALICO_VERSION="3.7.5"

RUN apk add --update ca-certificates openssh-client \
  jq curl bash git gcc g++ make libffi-dev openssl-dev \
  && curl -L  https://github.com/projectcalico/calicoctl/releases/download/v${CALICO_VERSION}/calicoctl -o /usr/local/bin/calicoctl \
  && chmod +x /usr/local/bin/calicoctl \
  && apk add python python-dev py-pip build-base \
  && rm /var/cache/apk/* \
  && pip install --upgrade pip \
  && pip install requests pytest pykube


CMD ["/usr/local/bin/calicoctl"]
