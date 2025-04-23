FROM registry.redhat.io/ubi9-minimal@sha256:ac61c96b93894b9169221e87718733354dd3765dd4a62b275893c7ff0d876869

USER 0


RUN curl -fsSL https://clis.cloud.ibm.com/install/linux | sh && \ 
    ibmcloud plugin install container-service -r Bluemix && \
    ibmcloud plugin update container-registry -r Bluemix && \
    ibmcloud plugin update vpc-infrastructure -r Bluemix && \
    ibmcloud plugin update cos -r Bluemix && \
    ibmcloud plugin update projects -r Bluemix && \

USER 10001

ENTRYPOINT ["bash"]
EXPOSE 8080-8085
