#! /bin/sh

env \
          DELUGED_CLIENT_USERNAME=rnl31wcbk7agf0vhqq2ld46e0w75q3m5s03lu3k6 \
          DELUGED_CLIENT_PASSWORD=sdxds2vrjy6h4fng72hd93xj8tj2huov3t6lz1ew \
          LOCAL_DOWNLOADS_DIR=~/Downloads \
          DELUGED_UID=$(id -u $(whoami)) \
      docker-compose "$@"

