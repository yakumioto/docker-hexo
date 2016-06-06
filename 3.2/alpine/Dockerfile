FROM mhart/alpine-node:6

MAINTAINER iyannik0215 , <admin@mashiro.io>

WORKDIR /Hexo

RUN \
    apk update \
    && add --no-cache --virtual git \
    && openssh \
    && npm install hexo-cli -g \
    && hexo init . \
    && npm install \
    && npm install hexo-generator-sitemap --save \
    && npm install hexo-generator-feed --save \
    && npm install hexo-deployer-git --save

VOLUME ["/Hexo/source", "/Hexo/themes", "/root/.ssh"]

EXPOSE 80

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ['/bin/bash']
