#!/bin/bash

# 高端知识探索平台 - GitHub Pages 部署脚本
echo "开始部署到 hjxok168.github.io..."

# 确保配置Git用户信息
echo "配置Git用户信息..."
git config user.name "hjxok168"
git config user.email "hjxok168@example.com"

# 检查是否已初始化git
if [ ! -d ".git" ]; then
    echo "初始化 git 仓库..."
    git init
    git remote add origin https://github.com/hjxok168/hjxok168.github.io.git
else
    # 确保远程仓库URL正确
    echo "检查远程仓库配置..."
    git remote set-url origin https://github.com/hjxok168/hjxok168.github.io.git
fi

# 添加所有文件
echo "添加文件到暂存区..."
git add .

# 提交更改
echo "提交更改..."
git commit -m "更新网站内容 $(date '+%Y-%m-%d %H:%M:%S')"

# 推送到GitHub
echo "推送到GitHub..."
git push -u origin main

echo "部署完成！网站地址：https://hjxok168.github.io"
echo "注意：首次部署后可能需要几分钟时间让GitHub Pages生效"