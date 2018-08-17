#!/bin/bash

# base dir
DELUGED_DIR=/var/lib/deluged

# chown
chown -R debian-deluged:debian-deluged ${DELUGED_DIR}

# start the deluge daemon
su debian-deluged -s /bin/sh -c "deluged -d -c ${DELUGED_DIR}/config" &
# record the PID of the daemon
daemon=$!
# wait for the daemon ready
sleep 1

# settings
deluge-console --config=${DELUGED_DIR}/config config --set allow_remote True
deluge-console --config=${DELUGED_DIR}/config config --set download_location ${DELUGED_DIR}/Downloads
deluge-console --config=${DELUGED_DIR}/config config --set move_completed_path ${DELUGED_DIR}/Downloads
deluge-console --config=${DELUGED_DIR}/config config --set torrentfiles_location ${DELUGED_DIR}/Downloads/torrentfiles
deluge-console --config=${DELUGED_DIR}/config config --set plugins_location ${DELUGED_DIR}/plugins

# show the settings
deluge-console --config=${DELUGED_DIR}/config config

# use SIGTERM to stop the daemon in order to save configs
deluge-console --config=${DELUGED_DIR}/config halt
# wait until the daemon finished
wait $daemon
