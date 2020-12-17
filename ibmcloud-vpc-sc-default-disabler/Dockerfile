FROM alpine:latest

RUN apk add --update curl
RUN curl -sLO https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz && tar xvfz ./oc.tar.gz && mv oc /usr/local/bin/oc && chmod ugo+x /usr/local/bin/oc

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT "/entrypoint.sh"