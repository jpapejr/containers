# Setting up public endpoints for air-gapped Kubernetes clusters on IBM Cloud

For customers who want to reach their Kube API on Internal-Only IKS Private Clusters and disable the public service endpoint, create a separate LoadBalancer type service that is not managed and expose the kubernetes API endpoint manually with the following YAML:

```
kind: Service  
apiVersion: v1  
metadata:  
  name: kube-api-via-nlb  
  annotations:  
    service.kubernetes.io/ibm-load-balancer-cloud-provider-ip-type: private  
  namespace: default  
spec:  
  ports:  
  - protocol: TCP  
    port: 443  
    targetPort: 443  
  type: LoadBalancer  
---  
kind: Endpoints  
apiVersion: v1  
metadata:  
  name: kube-api-via-nlb  
subsets:  
  - addresses:  
      - ip: 172.20.0.1  
    ports:  
      - port: 2040  
```