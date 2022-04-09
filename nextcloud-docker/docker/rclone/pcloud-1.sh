#!/bin/sh

rclone_command_name='rclone'

if ! type "$rclone_command_name" > /dev/null; then
  # install rclone here
  echo "start: install rclone"
  curl https://rclone.org/install.sh | bash
fi


# 确保文件夹存在
mkdir -p /rclone-storage/pcloud-1

echo "rclone mount pcloud-1 ..."

# 挂载
rclone mount pcloud-1: /rclone-storage/pcloud-1 --vfs-cache-mode full --allow-other
