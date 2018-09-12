# Build

```
docker build -t <image_name> . 
```

# Use

```
docker run -d --rm -e PORT=<port> -e USER=<user> -e HOST=<host> -e PASSWORD=<password> -p <port>:6666 <image_name>
```

