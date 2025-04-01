FROM alpine:3.8

ENV KUBECTL_VERSION "v1.30.11"
ENV OC_VERSION "4.17.23"


WORKDIR "/home/user"

RUN apk update && \
    apk add --no-cache bash curl git && \
    mkdir /home/user/bin && \
    curl -fsSL https://clis.cloud.ibm.com/install/linux | sh && \ 
    ibmcloud plugin install container-service -r Bluemix && \
    ibmcloud plugin update container-registry -r Bluemix && \
    ibmcloud plugin update vpc-infrastructure -r Bluemix && \
    ibmcloud plugin update cos -r Bluemix && \
    ibmcloud plugin update projects -r Bluemix && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    mv kubectl /root/bin && \
    chmod +x /home/user/bin/kubectl && \
    curl -L https://mirror.openshift.com/pub/openshift-v4/amd64/clients/ocp/${OC_VERSION}/openshift-client-amd64-linux.tar.gz | tar xz oc && \
    chmod +x ./oc && \
    mv oc /home/user/bin
    

ENTRYPOINT ["bash"]
EXPOSE 8080-8085
