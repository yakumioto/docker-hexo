FROM ubuntu:14.04

MAINTAINER iyannik0215 , <admin@mashiro.io>

RUN \
    apt-get update && \
    apt-get install -y git && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && \
    apt-get install -y nodejs && \
    npm install npm -g && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /Hexo

RUN \
    npm install hexo-cli -g && \
    hexo init . && \
    npm install && \
    npm install hexo-generator-sitemap --save && \
    npm install hexo-generator-feed --save && \
    npm install hexo-deployer-git --save

VOLUME ["/Hexo/source", "/Hexo/themes", "/root/.ssh"]

EXPOSE 80

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ['/bin/bash']
