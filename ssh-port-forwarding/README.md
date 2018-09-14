# Build

```
docker build -t <image_name> . 
```

# Use

```
docker run -d --rm -e PORT=<port> -e USER=<user> -e HOST=<host> -e PASSWORD=<password> -p <port>:6666 <image_name>
```

# Env Vars

`PORT` **(required)** the port to forward
`USER` **(required)** user to login
`PASSWORD` **(required)** password of the ssh login user
`SSH_PORT` *(optional)* default is `22`
`ALIVE_INTERVAL` *(optional)* ssh ServerAliveInterval option, default is 5
`ALIVE_COUNT_MAX` *(optional)* ssh ServerAliveCountMax option, default is 2

