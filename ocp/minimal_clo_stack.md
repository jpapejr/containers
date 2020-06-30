## ClusterLogging

``` yaml
apiVersion: logging.openshift.io/v1
kind: ClusterLogging
metadata:
  name: instance
  namespace: openshift-logging
spec:
  managementState: Managed
  logStore:
    type: elasticsearch
    elasticsearch:
      nodeCount: 1
      redundancyPolicy: ZeroRedundancy
      resources:
        limits:
          memory: 768Mi
        requests:
          cpu: 200m
          memory: 768Mi
      storage:
        storageClassName: ibmc-vpc-block-general-purpose
        size: 20G
  visualization:
    type: kibana
    kibana:
      replicas: 0
  curation:
    type: curator
    curator:
      schedule: 30 3 * * *
  collection:
    logs:
      type: fluentd
      fluentd: {}
```
