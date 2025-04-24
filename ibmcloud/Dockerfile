FROM ubuntu:latest

USER 0

# default to arm64 since golang binaries will not run on libkrun in podman
# https://github.com/podman-desktop/podman-desktop/issues/11558
ARG ARCH=arm64

RUN apt update && apt install -y  curl tar jq gzip && \
    useradd -G root -u 10001 -g 0 nonroot && \
    mkdir -p /home/nonroot

WORKDIR /home/nonroot

RUN curl -fsSLo ic.tar.gz https://download.clis.cloud.ibm.com/ibm-cloud-cli/2.33.1/IBM_Cloud_CLI_2.33.1_${ARCH}.tar.gz  && \
    tar xvfz ic.tar.gz && \
    Bluemix_CLI/install && \
    ibmcloud plugin install container-service  && \
    ibmcloud plugin install container-registry && \
    ibmcloud plugin install vpc-infrastructure && \
    ibmcloud plugin install cos && \
    ibmcloud plugin install project && \
    rm -fr Bluemix_CLI && \
    rm -fr ic.tar.gz

RUN mv /root/.bluemix /home/nonroot && \
    chown nonroot:root -R /home/nonroot && \
    ibmcloud version

USER 10001

ENTRYPOINT ["sleep"]
CMD ["infinity"]
EXPOSE 8080-8085
