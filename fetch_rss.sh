#!/bin/bash

# 设置错误处理
set -e
# 配置
RSS_URL="https://mikanani.me/RSS/MyBangumi?token=IGk45z8lAkK3Ub0o%2bltk%2bw%3d%3d"  # 替换为你的 RSS 链接

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
