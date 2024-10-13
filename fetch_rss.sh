#!/bin/bash

# 设置错误处理
set -e

# 配置
RSS_URL="https://mikanani.me/RSS/MyBangumi?token=IGk45z8lAkK3Ub0o%2bltk%2bw%3d%3d"  # 替换为你的 RSS 链接
OUTPUT_FILE="rss.xml"  # 你希望保存的文件名
TEMP_FILE="temp_rss.xml"  # 临时文件

# 检查 RSS_URL 是否存在
if [ -z "$RSS_URL" ]; then
  echo "RSS_URL 未设置！"
  exit 1
fi

# 下载 RSS 内容到临时文件
curl -sSL -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" \
     -H "Accept: application/rss+xml,application/xml;q=0.9,*/*;q=0.8" \
     -H "Accept-Language: zh-CN,zh;q=0.9,en;q=0.8" \
     "$RSS_URL" -o "$TEMP_FILE"

# 使用 sed 删除 XML 声明，并将结果保存到最终文件
sed '1s/<?xml version="1.0" encoding="utf-8"?>//' "$TEMP_FILE" > "$OUTPUT_FILE"

# 删除临时文件
rm "$TEMP_FILE"

echo "RSS 内容已下载、处理并保存到 $OUTPUT_FILE"
