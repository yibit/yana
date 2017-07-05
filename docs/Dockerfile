FROM alpine:3.5

MAINTAINER YANA Docker Maintainers "guiqzhang@gmail.com"

ENV YANA_VERSION 0.0.1

USER root

RUN set -ex \
	&& apk add --no-cache --virtual .fetch-deps \
    wget \
    python \
    && wget -O get-pip.py --no-check-certificate https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py

RUN adduser -h /home/yana -s /bin/bash yana -D

COPY requirements.txt /home/yana/

RUN  mkdir -p /home/yana/_site

COPY _site /home/yana/_site/

RUN set -ex \
    && cd /home/yana \
    && pip install -r requirements.txt

RUN set -ex \
    && apk del --no-cache .fetch-deps \
    wget \
	&& rm -rf get-pip.py

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod 751 /usr/local/bin/docker-entrypoint.sh

RUN ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 9876

# CMD ["docker-entrypoint.sh"]
