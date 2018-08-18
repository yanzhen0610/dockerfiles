# Intro

About [deluge](https://deluge-torrent.org/)

# Env Vars

`DELUGED_CLIENT_USERNAME` new username
`DELUGED_CLIENT_PASSWORD` password for the new user

> *Note*: both `DELUGED_CLIENT_USERNAME` and `DELUGED_CLIENT_PASSWORD` need to be set or there will be no daemon access user created

# Example

```
docker run -d -p 58846:58846 -v "~/Downloads:/var/lib/deluged/Downloads" yanzhen0610/deluged
```

or create a new daemon access user with username `test` and passowrd `1234`

```
docker run -d -p 58846:58846 -e DELUGED_CLIENT_USERNAME=test -e DELUGED_CLIENT_PASSWORD=1234 -v "~/Downloads:/var/lib/deluged/Downloads" yanzhen0610/deluged
```
