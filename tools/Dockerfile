FROM mhart/alpine-node:6

MAINTAINER iyannik0215 , <admin@mashiro.io>

RUN \
    apk --update --no-progress add git openssh

WORKDIR /Hexo

RUN \
    npm install hexo-cli -g

CMD ['/bin/bash']
