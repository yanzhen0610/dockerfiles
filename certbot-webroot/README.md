## Run

```sh
docker run --detach --restart always -v "/etc/letsencrypt:/etc/letsencrypt" -v "/var/www/:/webroot/" --env DOMAIN_NAME=example.com yanzhen0610/certbot-webroot-runner
```
