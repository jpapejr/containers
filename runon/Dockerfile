FROM jpapejr/command_runner:latest

ENV KUBECTL_VERSION="v1.14.0"

RUN apk add --update ca-certificates openssh-client \
  jq curl bash git gcc g++ make libffi-dev openssl-dev \
  && curl -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
  && chmod +x /usr/local/bin/kubectl \
  && apk add python python-dev py-pip build-base \
  && rm /var/cache/apk/* \
  && pip install --upgrade pip \
  && pip install requests pytest pykube

COPY runon /usr/local/bin/runon
RUN chmod +x /usr/local/bin/runon


EXPOSE 8000
EXPOSE 8001

CMD ["/usr/local/bin/runon"]
