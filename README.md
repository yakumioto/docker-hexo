# docker-hexo

将 **Hexo** 做成 **Docker** 镜像

## 使用方法

### 拉取镜像, 当前只有一个版本为 **Hexo** 的 **3.2** 版本

```
docker pull iyannik0215/docker-hexo
```

### 使用 **run** 命令创建容器

#### 创建本地运行容器

```
# 容器里的 **Hexo** 运行在 **80** 端口上,
docker run -p 4000:80 --name hexo-server -d \

# 将自己已经有的 **SSH Key** 当做数据卷关联到容器中,
-v {你的用户文件夹路径}/.ssh:/root/.ssh \

# 以下4个数据卷是分别关联 **Hexo** 里最重要的文件,
-v {你的博客文件夹路径}/source:/Hexo/source \
-v {你的博客文件夹路径}/themes:/Hexo/themes \
-v {你的博客文件夹路径}/_config.yml:/Hexo/_config.yml \

# 后面需要三个参数, 第一个为 github username, 第二个为 github email, 第三个为运行模式, s 为 **hexo server**
iyannik0215/docker-hexo {你的 github username} {你的 github email} s
```

#### 创建部署容器

```
docker run --name hexo-deploy -d \

# 将自己已经有的 **SSH Key** 当做数据卷关联到容器中,
-v {你的用户文件夹路径}/.ssh:/root/.ssh \

# 以下3个数据卷是分别关联 **Hexo** 里最重要的文件,
-v {你的博客文件夹路径}/source:/Hexo/source \
-v {你的博客文件夹路径}/themes:/Hexo/themes \
-v {你的博客文件夹路径}/_config.yml:/Hexo/_config.yml \

# 后面需要三个参数, 第一个为 github username, 第二个为 github email, 第三个为运行模式, d 为 **hexo deploy**
iyannik0215/docker-hexo {你的 github username} {你的 github email} d
```

### 后续的使用

如果需要创建文章就手动创建到 source/_posts 目录下, 使用 docker start hexo-server, 就可以在 浏览器中实时预览了.

如果需要部署 blog, 就可以直接使用 docker start hexo-deploy, 容器会后台部署, 完毕后自动退出的.
