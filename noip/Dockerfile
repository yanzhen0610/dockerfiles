FROM alpine:latest

RUN apk add --no-cache curl

COPY update.sh /

WORKDIR /

CMD ["/bin/sh", "/update.sh"]

