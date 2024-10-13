# RSS 内容自动下载器
下载mikanani.me的RSS到项目
**🔗 [项目链接](https://github.com/Maolaohei/RSS-download)**

## 目录

- [项目简介](#项目简介)
- [功能特性](#功能特性)
- [前提条件](#前提条件)
- [安装与配置](#安装与配置)
  - [1. 克隆仓库](#1-克隆仓库)
  - [2. 配置 GitHub Secrets](#2-配置-github-secrets)
    - [添加 RSS 链接](#添加-rss-链接)
    - [设置 GITHUB_TOKEN](#设置-github_token)
  - [3. 设置 GitHub Actions 工作流](#3-设置-github-actions-工作流)
- [使用说明](#使用说明)
  - [手动触发工作流](#手动触发工作流)
  - [查看下载结果](#查看下载结果)
- [安全性注意事项](#安全性注意事项)
- [常见问题](#常见问题)
- [贡献](#贡献)
- [许可证](#许可证)

## 项目简介

本项目旨在通过 GitHub Actions 自动化地从指定的 RSS 链接下载原始 XML 内容，并将其保存到 GitHub 仓库中。这样可以定期获取并更新 RSS 数据，方便查看和管理。

## 功能特性

- **自动化下载**：通过定时任务自动下载指定 RSS 链接的内容。
- **版本控制**：所有下载的 RSS 数据都保存在 Git 仓库中，具有完整的版本历史。
- **灵活配置**：支持自定义下载频率和保存文件路径。
- **安全管理**：使用 GitHub Secrets 管理敏感信息（如 RSS 链接 Token）。

## 前提条件

在开始之前，确保你具备以下条件：

- **GitHub 账户**：需要一个有效的 GitHub 账户。
- **GitHub 仓库**：要创建或使用一个现有的 GitHub 仓库。
- **RSS 链接**：拥有需要下载的 RSS 链接，且了解链接中是否包含敏感信息（如 Token）。

## 安装与配置

### 1. 克隆仓库

首先，将本仓库克隆到你的本地机器：

```bash
git clone https://github.com/Maolaohei/RSS-download.git
cd RSS-download
