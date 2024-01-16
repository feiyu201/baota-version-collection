#!/bin/bash

# 获取最新版本号
banben=$(curl -s https://www.bt.cn/api/panel/get_version?is_version=1)
banben='8.0.4'
# 判断是否存在对应的安装包
if [ -f "$DOWNLOAD_DIR/LinuxPanel-$banben.zip" ]; then
    echo "File $DOWNLOAD_DIR/LinuxPanel-$banben.zip already exists."
else
    # 下载安装包
    wget -P $DOWNLOAD_DIR http://download.bt.cn/install/update/LinuxPanel-$banben.zip
    rm -f $DOWNLOAD_DIR/宝塔最新版本-*
    # 在指定目录中创建文本文件并写入内容
    echo "http://download.bt.cn/install/update/LinuxPanel-$banben.zip" > "$DOWNLOAD_DIR/宝塔最新版本-$banben.txt"
    echo "http://download.bt.cn/install/update/LinuxPanel-$banben.zip" >> "$DOWNLOAD_DIR/宝塔历史版本.txt"
   

    # 添加调试信息
    ls -l $DOWNLOAD_DIR  # 检查下载目录中的文件
    cat "$DOWNLOAD_DIR/宝塔最新版本-${banben}.txt"

fi
echo "BANBEN=$banben" >> "$GITHUB_ENV"

