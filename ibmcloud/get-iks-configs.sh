#!/bin/bash

# Loop through all IBM Cloud regions issuing a download of the
# IBM Cloud Kubernetes Service cluster configuration for each cluster
# within each region.

# for region in us-east us-south uk-south eu-central ap-north ap-south; do 
#   ibmcloud ks region-set $region; 
  for i in `ibmcloud ks clusters -s | awk '!/Name|OK|^ /{print $1}'`; do 
    ibmcloud ks cluster-config --export $i | awk -F "=" '{print $NF}'; 
  done; 
# done
