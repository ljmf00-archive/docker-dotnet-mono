ARG base_image=alpine:3.10
FROM $base_image

LABEL maintainer="Codacy <team@codacy.com>"

ARG add_packages=""

RUN apk add --no-cache mono $add_packages --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
	apk add --no-cache --virtual=.build-dependencies ca-certificates && \
	cert-sync /etc/ssl/certs/ca-certificates.crt && \
	apk del .build-dependencies \
	rm /tmp/* \
	rm -rf /var/cache/apk/*
