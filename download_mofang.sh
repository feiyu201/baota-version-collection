#!/bin/bash

# 定义要下载的文件列表
files=(
    "/cloud/packages/c8/tar-1.30-6.el8.x86_64.rpm"
    "/cloud/packages/c8/rpms-master.tar.gz"
    "/cloud/packages/c8/python2-packages.tar.gz"
    "/cloud/packages/c8/rpms-nodes.tar.gz"
    "/cloud/packages/c8/python3-packages.tar.gz"
    "/cloud/packages/rpms/influxdb-1.8.0.x86_64.rpm"
    "/cloud/packages/bin.tar.gz"
    "/cloud/packages/upgrade.tar.gz"
    "/cloud/packages/share.tar.gz"
    "/cloud/packages/mariadb-5.5.tar.gz"
    "/cloud/software/bin/centos7/aria2c"
    "/cloud/software/bin/jq"
    "/cloud/dashboard/3.6.14/zjmf-web.tgz"
    "/cloud/dashboard/3.6.48/zjmf-web.tar.gz"
    "/cloud/controller/3.6.14/zjmf-ctl.tgz"
    "/cloud/controller/3.6.48/zjmf-ctl.tar.gz"
    "/cloud/compute/datapath.db"
    "/cloud/compute/3.6.14.tar.gz"
    "/cloud/compute/3.6.48.tar.gz"
)

# 定义要保存到的目录
dest_dir=$(dirname "$(readlink -f "$0")")

# 创建保存目录
mkdir -p "$dest_dir/cloud/packages/c8"
mkdir -p "$dest_dir/cloud/packages/rpms"
mkdir -p "$dest_dir/cloud/compute"
mkdir -p "$dest_dir/cloud/software/bin"
mkdir -p "$dest_dir/cloud/dashboard/3.6.14"
mkdir -p "$dest_dir/cloud/dashboard/3.6.48"
mkdir -p "$dest_dir/cloud/controller/3.6.14"
mkdir -p "$dest_dir/cloud/controller/3.6.48"

# 获取当前日期
current_date=$(date +"%Y%m%d%H%M")

# 遍历文件列表，逐个下载文件
for file in "${files[@]}"
do    
    echo "Downloading $file ..."
    file_dir=$(dirname "$file")
    mkdir -p "$dest_dir$file_dir"
    wget -P "$dest_dir$file_dir" "http://mirror.cloud.idcsmart.com$file"
done

# 创建压缩包
tar -zcvf "$dest_dir/release_$current_date.tar.gz" -C "$dest_dir" .

# 将压缩包信息写入文件
echo "RELEASE_PATH=$dest_dir" > "$dest_dir/release.txt"
echo "FILE_DATE=_$current_date" >> "$dest_dir/release.txt"

echo "All files have been downloaded and packaged successfully!" 参考这个
