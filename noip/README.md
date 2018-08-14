# Example
```
docker run -d -e NOIP_USERNAME=username -e NOIP_PASSWORD=passowrd -e NOIP_HOSTNAME=hostname yanzhen0610/noip
```

or with specified period

```
docker run -d -e NOIP_USERNAME=username -e NOIP_PASSWORD=passowrd -e NOIP_HOSTNAME=hostname -e PERIOD=10 yanzhen0610/noip
```

# Environment Variables
 - `NOIP_USERNAME` (required) for username
 - `NOIP_PASSWORD` (required) for password
 - `NOIP_HOSTNAME` (required) for hostname
 - `PERIOD` (optional) used to set the period(`$PERIOD` seconds) between each request to No-IP server

# Supports
`amd64` and `arm` (raspberry pi) currently

# src
check my [repo](https://github.com/yanzhen0610/dockerfiles/tree/master/noip)
