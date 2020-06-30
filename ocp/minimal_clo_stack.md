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


## [secure-forward.conf](https://docs.openshift.com/container-platform/4.3/logging/config/cluster-logging-external.html#cluster-logging-collector-fluentd_cluster-logging-external)
``` xml
<store>
  @type forward
  transport tcp 
  <buffer>
    @type file
    path '/var/lib/fluentd/secureforwardlegacy'
    queued_chunks_limit_size "#{ENV['BUFFER_QUEUE_LIMIT'] || '1024' }"
    chunk_limit_size "#{ENV['BUFFER_SIZE_LIMIT'] || '1m' }"
    flush_interval "#{ENV['FORWARD_FLUSH_INTERVAL'] || '5s'}"
    flush_at_shutdown "#{ENV['FLUSH_AT_SHUTDOWN'] || 'false'}"
    flush_thread_count "#{ENV['FLUSH_THREAD_COUNT'] || 2}"
    retry_max_interval "#{ENV['FORWARD_RETRY_WAIT'] || '300'}"
    retry_forever true
    # the systemd journald 0.0.8 input plugin will just throw away records if the buffer
    # queue limit is hit - 'block' will halt further reads and keep retrying to flush the
    # buffer to the remote - default is 'exception' because in_tail handles that case
    overflow_action "#{ENV['BUFFER_QUEUE_FULL_ACTION'] || 'exception'}"
  </buffer>
  <server>
    host x.x.x.x
    port xxxxxx 
  </server>
</store>

```
