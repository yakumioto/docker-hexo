# docker-hexo

将 **Hexo** 做成 **Docker** 镜像

由于 **Hexo** 的特殊性无法把他做的根服务一样完美。

但是已经基本实现了任何平台完美使用的状态。

# 使用方法

看着 **Dockerfile** 的注释进行更改,改完后执行 build

```
docker build -t docker-hexo:tag .
```

```
docker run \
    -it -p 4000:4000 \
    --name hexo \
    -v 你的Hexo/source:/Hexo/source \
    -v 你的Hexo/themes:/Hexo/themes \
    -v 你的Hexo/_config.yml:/Hexo/_config.yml \
    docker-hexo:tag
```
