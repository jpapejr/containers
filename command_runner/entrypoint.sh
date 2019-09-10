#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}

if [ ! -z "$DEBUG" ]; then
    echo "Starting with UID : $USER_ID"
fi

adduser -s /bin/bash -u $USER_ID -D user
export HOME=/home/user
chmod ugo+rw -f /var/run/docker.sock

exec /usr/local/bin/gosu user "$@"