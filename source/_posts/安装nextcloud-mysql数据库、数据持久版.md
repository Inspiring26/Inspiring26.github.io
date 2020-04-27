---
title: 安装nextcloud_mysql数据库、数据持久版
date: 2019-10-09 19:22:20
tags: [nextcloud,mysql,docker]
---
### 1.保存以下为nextcloud.yml
可以修改一下其中的密码和映射端口
```
version: '2'

volumes:
  nextcloud:
  db:

services:
  db:
    image: mariadb
    command: --transaction-isolation=READ-COMMITTED --binlog-format=ROW
    restart: always
    volumes:
      - db:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=123456
      - MYSQL_PASSWORD=123456
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud

  app:
    image: nextcloud
    ports:
      - 8080:80
    links:
      - db
    volumes:
      - nextcloud:/var/www/html
    restart: always
```
### 2. apt install docker-compose
### 3. docker-compose -f nextcloud.yml up -d
### 4. 打开[http://localhost:8081](http://localhost:8081/)后的数据库配置 
```
For the database use db as host and nextcloud as table and user name. Also enter the password you chose in your docker-compose.yml file.
```
host 用db 就可以了 其他的输入对应的帐号密码。
### 5.此时使用ip不能访问。
docker exec -it [容器id] base
apt update
apt install vim
vim config/config.php
在trusted_domains下添加 1 => '192.168.x.x:8080'
保存即生效。
