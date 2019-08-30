FROM jpapejr/command_runner:latest

ENV OCTANT_VERSION="0.6.0"
ENV OCTANT_LISTENER_ADDR=0.0.0.0:7777

RUN curl -L https://github.com/vmware/octant/releases/download/v${OCTANT_VERSION}/octant_${OCTANT_VERSION}_Linux-64bit.tar.gz --output /tmp/octant_${OCTANT_VERSION}_Linux-64bit.tar.gz \
    && cd tmp && tar xvfz octant_${OCTANT_VERSION}_Linux-64bit.tar.gz && mv octant_${OCTANT_VERSION}_Linux-64bit/octant /usr/local/bin/octant \
    && chmod +x /usr/local/bin/octant

CMD ["/usr/local/bin/octant"]
