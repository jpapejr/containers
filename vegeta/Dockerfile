FROM jpapejr/command_runner:latest

ENV VEGETA_VERSION="12.7.0"

RUN apk add --update ca-certificates openssh-client \
  jq curl bash git gcc g++ make libffi-dev openssl-dev \
  && curl -L -o /tmp/vegeta.tar.gz https://github.com/tsenart/vegeta/releases/download/v${VEGETA_VERSION}/vegeta-${VEGETA_VERSION}-linux-amd64.tar.gz \
  && ls -ltra /tmp \
  && cd /tmp && tar xvfz vegeta.tar.gz \
  && mv /tmp/vegeta /usr/local/bin/vegeta \
  && chmod +x /usr/local/bin/vegeta \
  && apk add python python-dev py-pip build-base \
  && rm /var/cache/apk/* \
  && pip install --upgrade pip \
  && pip install requests pytest pykube

CMD ["/usr/local/bin/vegeta"]
