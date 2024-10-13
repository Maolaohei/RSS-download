#!/bin/bash

# 设置错误处理
set -e

# 检查 RSS_URL 是否存在
if [ -z "$RSS_URL" ]; then
  echo "RSS_URL 环境变量未设置！"
  exit 1
fi

# 配置
OUTPUT_FILE="rss.xml"  # 你希望保存的文件名

# 下载 RSS 内容
curl -sSL "$RSS_URL" -o "$OUTPUT_FILE"

echo "RSS 内容已下载并保存到 $OUTPUT_FILE"
