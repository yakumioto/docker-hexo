FROM: alpine:latest

MAINTAINER iyannik0215 , <admin@mashiro.io>

RUN set -ex \
    && apk add --no-cache --virtual git \
        bash \
        curl \
        nodejs \
    && npm install npm -g \


CMD ["/bin/bash"]
