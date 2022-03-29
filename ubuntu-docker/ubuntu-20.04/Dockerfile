FROM ubuntu:20.04 AS base

LABEL maintainer="yiyun <yiyungent@gmail.com>"

# 设置国内阿里云镜像源
COPY etc/apt/aliyun-ubuntu-20.04-focal-sources.list   /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y wget

# 时区设置
ENV TZ=Asia/Shanghai
