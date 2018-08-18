#!/bin/bash

INIT_FILE=INIT_FILE
USER_FILE=USER_FILE

add_client_access_user() {
    local username="$1"
    local password="$2"
    local level="${3:-10}"
    if [ ! -z "$username" ] && [ ! -z "$password" ]
    then
        echo "$username:$password:$level" >> ${DELUGED_DIR}/config/auth
    fi
}

if [ ! -e "$INIT_FILE" ]
then
    cd $DELUGED_DIR
    add_client_access_user "$DELUGED_CLIENT_USERNAME" "$DELUGED_CLIENT_PASSWORD"

    if [ ! -z "$DELUGED_UID" ]
    then
        uid=$(id -u $DELUGED_UID 2>/dev/null)
        if [ $? -ne 0 ]
        then
            usermod -u $DELUGED_UID $DELUGED_USER
            echo change $DELUGED_USER\'s UID to $DELUGED_UID
        else
            DELUGED_USER=$(getent passwd $DELUGED_UID | egrep -o '^[^:]*')
            echo change daemon user to $DELUGED_USER
        fi
    fi
    chown -R $DELUGED_USER ${DELUGED_DIR}/config ${DELUGED_DIR}/plugins
    printf "$DELUGED_USER" > $USER_FILE

    touch "$INIT_FILE"
else
    DELUGED_USER=$(cat $USER_FILE)
fi

export DELUGED_USER=$DELUGED_USER
/bin/su $DELUGED_USER -s /bin/bash -c "$@"
