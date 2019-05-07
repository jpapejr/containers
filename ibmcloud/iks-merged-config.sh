#!/bin/bash

# IBM Cloud Kubernetes Service cluster config dir
clustersdir=~/.bluemix/plugins/container-service/clusters

#Produce a Kubernetes merged config string to be used with the KUBECONF environment variable.

# CHANGE VALUE
# Note the value is the IBM ID used to log into ibmcloud. This is the same
# value that appears in the downloaded IKS cluster config files for the 
# context user field.
username="jtpape@us.ibm.com" #set to IBM ID used with ibmcloud login
mergedconfig="$HOME/.kube/config"
while IFS= read -r -d '' file
do 
    clustername=$(awk '/current-context/{print $2}' < $file)
    sed -i.bak "/$clustername-$username/!s/$username/$clustername-$username/g" $file && rm $file.bak
    mergedconfig="$mergedconfig:$file"
done < <(find $clustersdir -type f -name "*.yml" -print0)
echo $mergedconfig