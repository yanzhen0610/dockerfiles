FROM node:10-alpine

WORKDIR /app

RUN set -eux ; \
	apk add --no-cache \
		aria2 \
		libc6-compat \
	; \
	apk add --no-cache --virtual .build-deps \
		curl \
		git \
		build-base \
		gcc \
		g++ \
		python2 \
	; \
	git clone 'https://github.com/ziahamza/webui-aria2.git' . ; \
	npm install --include=dev ; \
	npm run build ; \
	# gosu install latest \
	GITHUB_REPO="https://github.com/tianon/gosu" ; \
	LATEST=`curl -s  $GITHUB_REPO"/releases/latest" | grep -Eo "[0-9].[0-9]*"` ; \
	curl -L $GITHUB_REPO"/releases/download/"$LATEST"/gosu-amd64" > /usr/local/bin/gosu ; \
	chmod +x /usr/local/bin/gosu ; \
	# goreman supervisor install latest \
	GITHUB_REPO="https://github.com/mattn/goreman" ; \
	LATEST=`curl -s  $GITHUB_REPO"/releases/latest" | grep -Eo "v[0-9]*.[0-9]*.[0-9]*"` ; \
	curl -L $GITHUB_REPO"/releases/download/"$LATEST"/goreman_"$LATEST"_linux_amd64.tar.gz" > goreman.tar.gz ; \
	tar -xzvf goreman.tar.gz ; \
	ls -R goreman* ; \
	mv **/goreman /usr/local/bin/goreman ; \
	rm -R goreman* ; \
	apk del --no-cache .build-deps ; \
	# goreman setup \
	( \
		echo "web: gosu root /usr/local/bin/node /app/node-server.js" ; \
		echo "backend: gosu root /usr/bin/aria2c --enable-rpc --rpc-listen-all --rpc-secret \$RPC_TOKEN --dir=/data" \
	) > Procfile

ENV RPC_TOKEN token

EXPOSE 6800 8888

VOLUME /data

CMD ["/usr/local/bin/goreman", "start"]
	
