

# 简介



# Usage

## 修改 `docker/rclone/rclone.conf`

> 填入你的 `rclone.conf` 配置

## 根据需要修改 `docker/Dockerfile`, `docker/supervisord.conf`, `docker/rclone/pcloud-1.sh`

> 示例中只提供了 `pcloud` 外部云存储, 如果需要其它外部云存储, 则按照 `pcloud-1` 复制修改一份即可

> `pcloud-1` 默认将 `pcloud-1` 远程存储根目录 挂载到 容器内 `/rclone-storage/pcloud-1`



## 修改 `db.env` 

设置你的 MySQL 密码

```env db.env
MYSQL_ROOT_PASSWORD=
MYSQL_PASSWORD=
```

## 启动


```bash
docker-compose up -d
```

> 启动后, 会将当前的 `./nextcloud` 目录作为 `Nextcloud` 的持久数据目录, 方便备份打包

> PS:        
> To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.




# 补充


> 为了方便, 直接将 rclone 打包到 `Dockerfile` 里, 并在容器启动时, 自动启动挂载 外部云存储
 
> `nextcloud/Dockerfile` 镜像添加了 `rclone 外部云存储`, 以及 官方的 `full` 示例 (所有可选包和 cron 功能的依赖项)



# 参考

- [docker/.examples at master · nextcloud/docker](https://github.com/nextcloud/docker/tree/master/.examples)
- [docker/.examples/dockerfiles/full/apache at master · nextcloud/docker](https://github.com/nextcloud/docker/tree/master/.examples/dockerfiles/full/apache)




