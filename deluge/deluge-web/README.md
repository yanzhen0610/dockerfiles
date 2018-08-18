# Intro

Deluge web Interface(deluge-web)

About [deluge](https://deluge-torrent.org/)

# Env Vars

 - `DELUGED_HOST` remote host
 - `DELUGED_PORT` (default: 58846)
 - `DELUGED_CLIENT_USERNAME` remote host access username
 - `DELUGED_CLIENT_PASSWORD` remote host access passowrd

# Run

```
docker run -d -e DELUGED_HOST=example-deluged-host -e DELUGED_CLIENT_USERNAME=example -e DELUGED_CLIENT_PASSWORD=1234 yanzhen0610/deluge-web
```

# Docker Compose

better run with the docker compose file

[docker-compose.yml](https://github.com/yanzhen0610/dockerfiles/tree/master/deluge)
