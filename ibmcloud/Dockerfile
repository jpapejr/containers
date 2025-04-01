FROM quay.io/devfile/universal-developer-image:ubi9-latest

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
