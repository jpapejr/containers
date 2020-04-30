# Envoy config model

With regards to Envoy, from the top down, configurations start with:

* Listeners (related to ports and connection errors)
* Routes (hostnames and 404 errors)
* Clusters (503 errors, circuit breaker settings, tls configurations)
* Endpoints (503 errors, check to make sure there are endpoints associated with a cluster)