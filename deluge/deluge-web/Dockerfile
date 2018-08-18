FROM debian:stretch-slim

ENV DELUGE_WEB_DIR=/var/lib/deluge-web
ENV DELUGE_WEB_USER=deluge-web

RUN apt-get update \
      && apt-get install -y deluge-web \
      && useradd -r -b ${DELUGE_WEB_DIR} -d ${DELUGE_WEB_DIR} ${DELUGE_WEB_USER} \
      && mkdir -p ${DELUGE_WEB_DIR} \
      && chown -R ${DELUGE_WEB_USER}:${DELUGE_WEB_USER} ${DELUGE_WEB_DIR} \
      && apt clean \
      && rm -fr /var/lib/apt/lists/*

USER deluge-web
WORKDIR /var/lib/deluge-web

EXPOSE 8112

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD ["/bin/sh", "-c", "/usr/bin/deluge-web -c ${DELUGE_WEB_DIR} -L ${DELUGE_WEB_LOG_LEVEL:-info}"]
