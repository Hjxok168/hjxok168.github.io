#!/bin/bash

# 创建GitHub仓库并推送代码的脚本
# 使用方法：
# 1. 确保已安装Git并配置GitHub凭证
# 2. 在命令行中运行：bash create_and_push_repo.sh
# 3. 根据提示输入您的GitHub用户名和要创建的仓库名称

# 提示用户输入GitHub用户名
read -p "请输入您的GitHub用户名: " GITHUB_USERNAME

# 提示用户输入要创建的仓库名称
read -p "请输入要创建的仓库名称 (默认为hxqok-website): " REPO_NAME
REPO_NAME=${REPO_NAME:-hxqok-website}

# 提示用户输入仓库描述
read -p "请输入仓库描述 (默认为'个人网站 www.hxqok.com 的源代码'): " REPO_DESCRIPTION
REPO_DESCRIPTION=${REPO_DESCRIPTION:-个人网站 www.hxqok.com 的源代码}

# 提示用户选择仓库可见性
read -p "仓库是否设为私有? (y/n，默认为y): " IS_PRIVATE
IS_PRIVATE=${IS_PRIVATE:-y}
PRIVATE_OPTION="false"
if [[ $IS_PRIVATE == "y" || $IS_PRIVATE == "Y" ]]; then
  PRIVATE_OPTION="true"
fi

# 使用curl命令通过GitHub API创建仓库
# 注意：这将提示您输入GitHub密码或Personal Access Token
# 推荐使用Personal Access Token (PAT) 代替密码
# 如何获取PAT: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token

# 检查是否安装了curl
if ! command -v curl &> /dev/null
then
    echo "错误: 未找到curl命令。请先安装curl。"
    exit 1
fi

# 检查是否安装了jq (用于解析JSON)
if ! command -v jq &> /dev/null
then
    echo "警告: 未找到jq命令，将使用基础方法解析响应。"
    USE_JQ=false
else
    USE_JQ=true
fi

# 创建仓库
echo "正在创建GitHub仓库..."
RESPONSE=$(curl -s -u "$GITHUB_USERNAME" https://api.github.com/user/repos -d "{\"name\":\"$REPO_NAME\",\"description\":\"$REPO_DESCRIPTION\",\"private\":$PRIVATE_OPTION}")

# 检查仓库是否创建成功
if [[ $USE_JQ == true ]]; then
    REPO_URL=$(echo "$RESPONSE" | jq -r '.clone_url')
    if [[ $REPO_URL == "null" || -z $REPO_URL ]]; then
        echo "错误: 创建仓库失败。响应: $RESPONSE"
        exit 1
    fi
else
    # 基础方法检查是否包含clone_url
    if [[ $RESPONSE != *"clone_url"* ]]; then
        echo "错误: 创建仓库失败。响应: $RESPONSE"
        exit 1
    fi
    # 简单提取clone_url
    REPO_URL=$(echo "$RESPONSE" | grep -o '"clone_url":"[^"]*' | cut -d':' -f2- | tr -d '"')
fi

# 添加远程仓库
echo "仓库创建成功！仓库地址: $REPO_URL"
 echo "正在添加远程仓库..."
git remote add origin "$REPO_URL"

# 推送到远程仓库
 echo "正在推送代码到远程仓库..."
git push -u origin master

# 检查推送是否成功
if [ $? -eq 0 ]; then
    echo "成功！代码已推送到GitHub仓库。"
    echo "下一步，您可以访问 https://app.netlify.com 并连接此仓库进行部署。"
else
    echo "错误: 推送代码失败。请检查您的网络连接和GitHub凭证。"
    exit 1
fi