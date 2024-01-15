#!/bin/bash

# 指定下载目录，可从环境变量中获取
dir="$DOWNLOAD_DIR"

# 获取最新版本号
banben=$(curl -s https://www.bt.cn/api/panel/get_version?is_version=1)

# 判断是否存在对应的安装包
if [ -f "$dir/LinuxPanel-$banben.zip" ]; then
    echo "File $dir/LinuxPanel-$banben.zip already exists."
else
    # 下载安装包
    wget -P "$dir" "http://download.bt.cn/install/update/LinuxPanel-$banben.zip"
    rm -f "$dir/宝塔最新版-*"
    # 在指定目录中创建文本文件并写入内容
    echo "http://download.bt.cn/install/update/LinuxPanel-$banben.zip" > "$dir/宝塔最新版本-$banben.txt"
    echo "http://download.bt.cn/install/update/LinuxPanel-$banben.zip" >> "$dir/宝塔历史版本.txt"
fi

