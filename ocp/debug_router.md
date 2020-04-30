# Getting OpenShift router access logs

This requires some manual gymnastics on Red Hat OpenShift

1. Scale down the cluster-version-operator
2. Then the ingress-operator per this [link](https://bugzilla.redhat.com/show_bug.cgi?id=1776392#c6).
3. Get a syslogd pod/service up like [this](https://www.me2digital.com/blog/2017/09/syslog-receiver/).


> This doesn't work well on IBM Cloud right now because the CVO runs on the managed master nodes which means end-users cannot scale it down.. The result is that, while you can down the OpenShift Ingress Operator just fine, the CVO will restore it shortly thereafter, wiping out your debugging env vars/config.

