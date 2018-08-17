FROM debian:stretch-slim

ENV DELUGED_DIR=/var/lib/deluged

ADD build-setup.sh ${DELUGED_DIR}/build-setup.sh

RUN apt-get update \
      && apt-get install -y deluged deluge-console \
      && ${DELUGED_DIR}/build-setup.sh \
      && rm -f ${DELUGED_DIR}/build-setup.sh \
      && mkdir -p ${DELUGED_DIR}/Downloads ${DELUGED_DIR}/plugins ${DELUGED_DIR}/config/state \
      && chown -R debian-deluged:debian-deluged ${DELUGED_DIR} \
      && apt clean \
      && rm -fr /var/lib/apt/lists/*

USER debian-deluged
WORKDIR /var/lib/deluged

VOLUME ${DELUGED_DIR}/config/state
VOLUME ${DELUGED_DIR}/Downloads

EXPOSE 58846

# CMD ["/usr/bin/deluged", "-d", "-c", "/var/lib/deluged/config"]
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
