#!/bin/bash

# 设置错误处理
set -e

# 配置
RSS_URL="https://mikanani.me/RSS/MyBangumi?token=IGk45z8lAkK3Ub0o%2bltk%2bw%3d%3d"  
OUTPUT_FILE="rss.xml"  

# 下载 RSS 内容
curl -sSL "$RSS_URL" -o "$OUTPUT_FILE"

echo "RSS 内容已下载并保存到 $OUTPUT_FILE"
