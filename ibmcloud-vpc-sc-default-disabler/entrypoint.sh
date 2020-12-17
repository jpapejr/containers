/lib/ld-musl-x86_64.so.1 --library-path /lib /usr/local/bin/oc login $SERVER --token $TOKEN
while true;
 do /lib/ld-musl-x86_64.so.1 --library-path /lib /usr/local/bin/oc annotate sc/ibmc-vpc-block-10iops-tier storageclass.beta.kubernetes.io/is-default-class="false" --overwrite; sleep 2;
done

