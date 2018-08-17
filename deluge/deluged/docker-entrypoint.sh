#!/bin/bash

FIRST_RUN_MARK_FILE=FIRST_RUN_MARK_FILE

add_user() {
    local username="$1"
    local password="$2"
    local level="${3:-10}"
    if [ ! -z "$username" ] && [ ! -z "$password" ]
    then
        echo "$username:$password:$level" >> ${DELUGED_DIR}/config/auth
    fi
}

if [ ! -e "$FIRST_RUN_MARK_FILE" ]
then
    add_user "$DELUGED_CLIENT_USERNAME" "$DELUGED_CLIENT_PASSWORD"
    touch "$FIRST_RUN_MARK_FILE"
fi

/usr/bin/deluged -d -c /var/lib/deluged/config
