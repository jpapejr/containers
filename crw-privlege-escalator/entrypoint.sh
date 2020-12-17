/lib/ld-musl-x86_64.so.1 --library-path /lib /usr/local/bin/oc login $SERVER --token $TOKEN
/lib/ld-musl-x86_64.so.1 --library-path /lib /usr/local/bin/oc project jtp-codeready
/lib/ld-musl-x86_64.so.1 --library-path /lib /usr/local/bin/oc adm policy add-scc-to-user anyuid -z che-workspace
/lib/ld-musl-x86_64.so.1 --library-path /lib /usr/local/bin/oc adm policy add-scc-to-user privileged -z che-workspace
/lib/ld-musl-x86_64.so.1 --library-path /lib /usr/local/bin/oc create clusterrolebinding jtp-codeready-workspace-admin --clusterrole cluster-admin --serviceaccount jtp-codeready:che-workspace
tail -f /dev/null
