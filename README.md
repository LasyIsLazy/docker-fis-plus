# docker-fis-plus

## 使用

### 启动

Build

```
docker build -t fis-plus .
```

运行

powershell

```powershell
docker run -it --rm `
--name fis-plus-app `
-p 8080:8080 `
--mount type=bind,source=C:/code/zyb/fisp/projects,target=/opt/fisp/projects `
--mount type=bind,source=C:/code/zyb/fisp/www,target=/root/.fis-plus-tmp/www `
fis-plus `
/bin/sh
```

Bash

```bash
docker run -it --rm \
--name fis-plus-app \
-p 8080:8080 \
--mount type=bind,source=C:/code/zyb/fisp/projects,target=/opt/fisp/projects \
--mount type=bind,source=C:/code/zyb/fisp/www,target=/root/.fis-plus-tmp/www \
fis-plus \
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

