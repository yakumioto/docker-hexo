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

WORKDIR /Hexo

RUN npm install hexo-cli -g
RUN hexo init . && npm install
RUN npm install hexo-generator-sitemap --save
RUN npm install hexo-generator-feed --save
RUN npm install hexo-deployer-git --save
RUN npm install --save hexo-generator-index
RUN npm install --save hexo-generator-archive
RUN npm install --save hexo-generator-tag

VOLUME ["/Hexo/source"]
VOLUME ["/Hexo/scaffolds"]
VOLUME ["/Hexo/scaffolds"]
VOLUME ["/root/.ssh"]

EXPOSE 80
EXPOSE 4000

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ['/bin/bash']
