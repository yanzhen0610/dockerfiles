FROM debian:stretch-slim

ENV DELUGED_DIR=/var/lib/deluged
ENV DELUGED_USER=debian-deluged

ADD build-setup.sh ${DELUGED_DIR}/build-setup.sh

RUN apt-get update \
      && apt-get install -y deluge-common
      
RUN apt-get install -y deluged deluge-console \
      && ${DELUGED_DIR}/build-setup.sh \
      && rm -f ${DELUGED_DIR}/build-setup.sh \
      && mkdir -p ${DELUGED_DIR}/Downloads ${DELUGED_DIR}/plugins ${DELUGED_DIR}/config/state \
      && apt clean \
      && rm -fr /var/lib/apt/lists/*

WORKDIR /var/lib/deluged

VOLUME ${DELUGED_DIR}/config/state
VOLUME ${DELUGED_DIR}/Downloads

EXPOSE 58846

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/bin/sh", "-c", "/usr/bin/deluged -d -c $DELUGED_DIR/config -L ${DELUGED_LOG_LEVEL:-info}"]
