FROM alpine:latest

RUN apk add --no-cache \
	bash \
	git \
        curl

RUN adduser -D ci

ADD *.sh /home/ci/

RUN chmod 555 /home/ci/*.sh 

ENTRYPOINT ["/home/ci/entrypoint.sh"]
