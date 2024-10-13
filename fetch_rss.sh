#!/bin/bash

# 设置错误处理
set -e

# 配置
RSS_URL="https://mikanani.me/RSS/MyBangumi?token=IGk45z8lAkK3Ub0o%2bltk%2bw%3d%3d"  # 替换为你的 RSS 链接
OUTPUT_FILE="rss.xml"  # 你希望保存的文件名

# 检查 RSS_URL 是否存在
if [ -z "$RSS_URL" ]; then
  echo "RSS_URL 环境变量未设置！"
  exit 1
fi

# 下载 RSS 内容
if ! curl -sSL "$RSS_URL" -o "$OUTPUT_FILE"; then
  echo "下载 RSS 内容失败"
  exit 1
fi

# 检查文件是否为空
if [ ! -s "$OUTPUT_FILE" ]; then
  echo "下载的 RSS 文件为空"
  exit 1
fi

# 使用 xmllint 验证 XML 格式（如果安装了 xmllint）
if command -v xmllint &> /dev/null; then
  if ! xmllint --noout "$OUTPUT_FILE"; then
    echo "RSS 内容格式无效，尝试修复..."
    # 尝试修复 XML
    xmllint --recover "$OUTPUT_FILE" > "${OUTPUT_FILE}.fixed"
    mv "${OUTPUT_FILE}.fixed" "$OUTPUT_FILE"
  fi
fi

echo "RSS 内容已下载并保存到 $OUTPUT_FILE"

# 显示文件的前几行和第 24 行附近的内容
echo "文件前 10 行内容："
head -n 10 "$OUTPUT_FILE"

echo "第 24 行附近的内容："
sed -n '19,29p' "$OUTPUT_FILE"

# 检查是否有特殊字符
echo "检查特殊字符："
LC_ALL=C sed -n 'l' "$OUTPUT_FILE" | sed -n '19,29p'
