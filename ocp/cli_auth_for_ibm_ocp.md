# CLI authentication for IBM Cloud OpenShift clusters

There are a few methods for authenticating the oc CLI against IBM Cloud OpenShift clusters 

### API Key

* Create an IAM API key: `ibmcloud  iam  api-key-create <name>`
* Then get your cluster master URL: `ibmcloud  ks  cluster get --cluster <cluster_name_or_ID>`
* Use this to log in to the cluster: `oc  login -u  apikey  -p <API_key> --server=<master_URL>`

### One-time passcode

* Browse to https://iam.cloud.ibm.com/identity/passcode
* Login as needed, copy passcode
* Run `oc  login -u passcode -p <copied passcode> --server=<master_URL>`