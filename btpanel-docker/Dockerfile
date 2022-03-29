FROM centos:centos7.8.2003 AS base

RUN yum install -y wget && wget -O install.sh http://download.bt.cn/install/install_6.0.sh && sh install.sh

EXPOSE 21 22 80 443 888 3306 8888

VOLUME ["/www/wwwroot"] 
VOLUME ["/www/backup"]