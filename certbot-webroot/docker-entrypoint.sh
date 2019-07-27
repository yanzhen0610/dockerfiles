#! /bin/sh

while :
do
	certbot certonly --agree-tos --register-unsafely-without-email --webroot -w /webroot -d "${DOMAIN_NAME}"
	sleep 86400 # 1 day
done

