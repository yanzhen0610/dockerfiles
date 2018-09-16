# Intro

This docker compose file is used for setup deluge(deluged and deluge-web)

About [deluge](https://deluge-torrent.org/)

# Env Vars

 - `DELUGED_CLIENT_USERNAME` and `DELUGED_CLIENT_PASSWORD` are username and password used for communicating between deluged and deluge-web, just pass arbitrary values[a-z0-9] to them
 - `LOCAL_DOWNLOADS_DIR` download destination dir
 - `DELUGED_UID` the owner of the downloads dir's UID

# Example

```
env \
        DELUGED_CLIENT_USERNAME=$(tr -cd 'a-z0-9' < /dev/urandom | fold -w40 | head -n1) \
        DELUGED_CLIENT_PASSWORD=$(tr -cd 'a-z0-9' < /dev/urandom | fold -w40 | head -n1) \
        LOCAL_DOWNLOADS_DIR=~/Downloads \
        DELUGED_UID=$(id -u $(whoami)) \
    docker-compose up -d 
```

or just

```
./start.sh up -d
```

> `tr -cd 'a-z0-9' < /dev/urandom | fold -w40 | head -n1` is for generating random characters[a-z0-9]

> **Note:** the `user` at line 5 needs to be change to the owner of `~/Donwloads`
