# Intro

About [deluge](https://deluge-torrent.org/)

# Env Vars

 - `DELUGED_CLIENT_USERNAME` new username
 - `DELUGED_CLIENT_PASSWORD` password for the new user

> *Note*: both `DELUGED_CLIENT_USERNAME` and `DELUGED_CLIENT_PASSWORD` need to be set or there will be no daemon access user created

# Run

```
docker run -d -p 58846:58846 -v "/home/$(whoami)/Downloads:/var/lib/deluged/Downloads" yanzhen0610/deluged
```

or create a new daemon access user with username `example` and password `1234`

```
docker run -d -p 58846:58846 -e DELUGED_CLIENT_USERNAME=example -e DELUGED_CLIENT_PASSWORD=1234 -v "/home/$(whoami)/Downloads:/var/lib/deluged/Downloads" yanzhen0610/deluged
```

# Docker Compose

better run with the docker compose file

[docker-compose.yml](https://github.com/yanzhen0610/dockerfiles/tree/master/deluge)

