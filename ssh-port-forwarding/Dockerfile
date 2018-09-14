FROM alpine:edge

RUN apk add --no-cache openssh-client expect

EXPOSE 6666

ENV SSH_PORT=22 \
             USER=user \
             HOST=host \
             PORT=0 \
             ALIVE_INTERVAL=5 \
             ALIVE_COUNT_MAX=2

COPY connect.exp /

CMD ["/connect.exp"]

