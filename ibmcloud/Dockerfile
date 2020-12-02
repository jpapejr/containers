FROM ibmcom/ibm-cloud-developer-tools-amd64

RUN sed -i -e 's/dl-cdn/dl-4/' /etc/apk/repositories && apk add --update bash

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY get-iks-configs.sh /usr/local/bin/get-iks-configs.sh
RUN chmod +x /usr/local/bin/get-iks-configs.sh

CMD ["/entrypoint.sh"]
