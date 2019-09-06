#!/bin/bash

# Loop through all IBM Cloud regions issuing a download of the
# IBM Cloud Kubernetes Service cluster configuration for each cluster
# within each region.

# CHANGE VALUE
# Note the value is the IBM ID used to log into ibmcloud. This is the same
# value that appears in the downloaded IKS cluster config files for the 
# context user field.
username="jtpape@us.ibm.com" #set to IBM ID used with ibmcloud login

# IBM Cloud Kubernetes Service cluster config dir
clustersdir=~/.bluemix/plugins/container-service/clusters

rm -fr $clustersdir
rm -f ~/.kube/*.pem
for i in `ibmcloud ks clusters -s | awk '!/Name|OK|^ /{print $1}'`; do 
    ibmcloud ks cluster-config --export $i | awk -F "=" '{print $NF}'; 
done; 



#Produce a Kubernetes merged config string to be used with the KUBECONF environment variable.
rm -f "$HOME/.kube/config"
while IFS= read -r -d '' file
do 
    clustername=$(awk '/current-context/{print $2}' < $file)
    sed -i.bak "/$clustername-$username/!s/$username/$clustername-$username/g" $file && rm $file.bak
    mergedconfig="$mergedconfig:$file"
done < <(find $clustersdir -type f -name "*.yml" -print0)
export KUBECONFIG=$mergedconfig
kubectl config view > "$HOME/.kube/config"
find ~/.bluemix/plugins/container-service/clusters -name *.pem -exec cp '{}' ~/.kube/ \;