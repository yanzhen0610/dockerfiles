env \
        DELUGED_CLIENT_USERNAME=$(tr -cd 'a-z0-9' < /dev/urandom | fold -w40 | head -n1) \
        DELUGED_CLIENT_PASSWORD=$(tr -cd 'a-z0-9' < /dev/urandom | fold -w40 | head -n1) \
        LOCAL_DOWNLOADS_DIR=~/Downloads \
        DELUGED_UID=$(id -u $(whoami)) \
      docker-compose kill
