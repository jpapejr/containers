# Upload a new deployable version to Razee

```
curl \
    --url "<razee_api_url>/api/v1/channels/<razee_channel>/version" \
    --header "content-type: text/yaml" \
    --header "razee-org-key: <razee_org_key>" \
    --header "resource-name: <resource_version>" \
    --header "x-api-key: <razee_apikey>" \
    --header "x-user-id: <razee_userID>" \
    --data-binary @./resource.yaml
```

Reference https://github.com/razee-io/Razee/blob/master/README.md#automating-the-deployment-of-kubernetes-resources-across-clusters-and-environments