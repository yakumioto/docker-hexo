FROM ubuntu:14.04

MAINTAINER iyannik0215 , <iyannik0215@gmail.com>

RUN \
    apt-get update && \
    apt-get install -y git && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && \
    apt-get install -y nodejs && \
    npm install npm -g && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN \
    mkdir Hexo && cd Hexo && \
    npm install hexo-cli -g && \
    hexo init && npm install && \
    npm install hexo-generator-sitemap --save && \
    npm install hexo-generator-feed --save && \
    npm install hexo-deployer-git --save && \
    npm un hexo-renderer-marked --save && \
    npm i hexo-renderer-markdown-it --save

WORKDIR /Hexo/

VOLUME ["/Hexo/source"]
VOLUME ["/Hexo/blog/themes"]

EXPOSE 4000

CMD ["/bin/bash"]
