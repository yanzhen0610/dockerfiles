FROM ubuntu

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends certbot; \
	rm -rf /var/lib/apt/lists/*;

VOLUME /etc/letsencrypt
COPY docker-entrypoint.sh /usr/local/bin/
CMD ["docker-entrypoint.sh"]

