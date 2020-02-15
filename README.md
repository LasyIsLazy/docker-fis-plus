# docker-fis-plus

## 使用

### 启动

#### Build 镜像

```
docker build -t fis-plus .
```

安装 PHP 可能比较慢。

#### 运行容器

```bash
docker run -it --rm `
--name [容器名称] `
-p 8080:[本地端口] `
--mount type=bind,source=[项目路径],target=[容器中的项目路径] `
--mount type=bind,source=[网站路径],target=/root/.fis-plus-tmp/www `
fis-plus `
/bin/sh
```

- 容器名称：容器的名称，方便再次启动。
- 本地端口：fis 服务器端口 8080 映射到本地的端口。
- 项目路径：fis 项目的路径，也可以是任意路径，之后进入容器切换目录。
- 容器中的项目路径：本地的项目路径绑定到容器中的路径。
- 网站路径：fis-plus 编译产生的文件所在路径，即网站路径，绑定容器中的 `/root/.fis-plus-tmp/www` 路径

Bash 示例：

```bash
docker run -it --rm \
--name fis-plus-app \
-p 8080:8080 \
--mount type=bind,source=C:/code/zyb/fisp/projects,target=/opt/fisp/projects \
--mount type=bind,source=C:/code/zyb/fisp/www,target=/root/.fis-plus-tmp/www \
fis-plus \
/bin/sh
```

powershell 示例：

```powershell
docker run -it --rm `
--name fis-plus-app `
-p 8080:8080 `
--mount type=bind,source=C:/code/zyb/fisp/projects,target=/opt/fisp/projects `
--mount type=bind,source=C:/code/zyb/fisp/www,target=/root/.fis-plus-tmp/www `
fis-plus `
/bin/sh
```



### 编译

以下命令为 Docker 中的命令

第一次运行容器或者更换 root 后，需要运行

```bash
fisp server init
```

运行服务器

```bash
fisp server start
```

编译

```bash
cd /opt/fisp/projects/project-name
fisp release
```

