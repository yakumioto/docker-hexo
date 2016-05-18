FROM ubuntu:14.04

MAINTAINER iyannik0215 , <iyannik0215@gmail.com>

# 用于安装 git 和 nodejs
RUN \
    # 替换镜像源，将官方的源替换成 aliyun 的源，提升 build 速度。
    sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    apt-get update && \

    # 安装 Git 和 curl
    apt-get install -y git && \
    apt-get install -y curl && \

    # 安装 Nodejs
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && \
    apt-get install -y nodejs && \

    # 将npm 替换为 淘宝的 cnpm， 提升 build 速度， 解决墙的问题。
    npm install -g cnpm --registry=https://registry.npm.taobao.org && \
    cnpm install npm -g && \

    # 清理安装产生的缓存，以减少容器的大小。
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 定义工作目录。
WORKDIR /Hexo

# 安装 Hexo 并且初始化一个仓库 Hexo 目录。
RUN cnpm install hexo-cli -g
RUN hexo init . && cnpm install


RUN cnpm install hexo-generator-sitemap --save

# 生成 Feed 链接插件。
RUN cnpm install hexo-generator-feed --save

# git 提交所需要的插件。
RUN cnpm install hexo-deployer-git --save

# 下方插件用于设置首页和归档页面设置不同的文章篇数。
RUN cnpm install --save hexo-generator-index
RUN cnpm install --save hexo-generator-archive
RUN cnpm install --save hexo-generator-tag

# 设置 Git 全局 user 参数。
RUN git config --global user.name "iyannik0215"
RUN git config --global user.email  "iyannik0215@gmail.com"

#  定义 Hexo 两个最重要的文件夹。 用于关联。
VOLUME ["/Hexo/source"]
VOLUME ["/Hexo/themes"]

# 定义 ssh key 用本机的就可以避免 不必要的生成
VOLUME ["/root/.ssh"]

# 开启 4000 端口。
EXPOSE 4000

# 运行 bash
CMD ["/bin/bash"]
