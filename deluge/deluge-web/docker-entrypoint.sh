#!/bin/bash

random_40c() {
    tr -cd 'a-z0-9' < /dev/urandom | fold -w40 | head -n1
}

INIT_FILE=INIT_FILE

if [ ! -e "$INIT_FILE" ]
then
    host_key=$(random_40c)
    host=${DELUGED_HOST:-'127.0.0.1'}
    port=${DELUGED_PORT:-58846}
    username=${DELUGED_CLIENT_USERNAME:-}
    password=${DELUGED_CLIENT_PASSWORD:-}

    printf "{\"file\":1,\"format\":1}{\"hosts\":[[\"$host_key\",\"$host\",$port,\"$username\",\"$password\"]]}" > $DELUGE_WEB_DIR/hostlist.conf.1.2

    touch $INIT_FILE
fi

exec "$@"
