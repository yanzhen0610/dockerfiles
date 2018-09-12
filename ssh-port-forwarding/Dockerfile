FROM alpine:edge

RUN apk add --no-cache openssh-client expect

EXPOSE 6666

ENV SSH_PORT=22 \
             USER=user \
             HOST=host \
             PORT=0

COPY connect /

CMD ["/connect"]

