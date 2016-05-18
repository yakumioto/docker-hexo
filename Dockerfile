FROM ubuntu:14.04

MAINTAINER iyannik0215 , <iyannik0215@gmail.com>

RUN \
    sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y git && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && \
    apt-get install -y nodejs && \
    npm install -g cnpm --registry=https://registry.npm.taobao.org && \
    cnpm install npm -g && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /Hexo

RUN cnpm install hexo-cli -g
RUN hexo init . && cnpm install
RUN cnpm install hexo-generator-sitemap --save
RUN cnpm install hexo-generator-feed --save
RUN cnpm install hexo-deployer-git --save

RUN ssh -T github.com

RUN git config --global user.name "iyannik0215"
RUN git config --global user.email  "iyannik0215@gmail.com"

VOLUME ["/Hexo/source"]
VOLUME ["/Hexo/themes"]
VOLUME ["/root/.ssh"]

EXPOSE 4000

CMD ["/bin/bash"]
