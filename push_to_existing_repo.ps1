<#
.SYNOPSIS
将本地代码推送到已在GitHub网站上创建的仓库的简化版PowerShell脚本

.DESCRIPTION
当GitHub API认证遇到问题时，此脚本提供了一种简单的方式，让您手动在GitHub网站上创建仓库后，
使用Git命令行将本地代码推送到该仓库。

使用方法:
1. 首先在GitHub网站上手动创建一个新仓库
2. 复制仓库的HTTPS或SSH URL
3. 在Windows PowerShell中运行: .\push_to_existing_repo.ps1
4. 粘贴您的仓库URL
#>

# 设置脚本为UTF-8编码
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::InputEncoding = [System.Text.Encoding]::UTF8

Write-Host "=== 将本地代码推送到现有GitHub仓库 ==="
Write-Host "
重要提示：请先在GitHub网站上手动创建一个新仓库，然后再运行此脚本。
创建仓库步骤：
1. 访问 https://github.com/new
2. 输入仓库名称（建议：hxqok-website）
3. 选择仓库可见性（公开或私有）
4. 点击"Create repository"
5. 创建成功后，复制仓库的HTTPS URL
"

# 提示用户输入GitHub仓库URL
$RepoUrl = Read-Host "请粘贴您在GitHub上创建的仓库的HTTPS URL"

if ([string]::IsNullOrEmpty($RepoUrl)) {
    Write-Host "错误: 仓库URL不能为空。请重新运行脚本并输入有效的URL。"
    exit 1
}

# 检查是否已经有origin远程仓库
$ExistingOrigin = git remote -v | Select-String -Pattern "origin"

if ($ExistingOrigin) {
    # 如果已有origin，询问是否要替换
    $ReplaceOrigin = Read-Host "已检测到现有origin远程仓库，是否要替换？(y/n，默认为y)"
    if ([string]::IsNullOrEmpty($ReplaceOrigin) -or $ReplaceOrigin.ToLower() -eq "y") {
        Write-Host "正在移除现有origin远程仓库..."
        git remote remove origin
    } else {
        Write-Host "操作已取消。您可以保留现有origin，或手动修改远程仓库配置。"
        exit 0
    }
}

# 添加新的远程仓库
Write-Host "正在添加新的远程仓库..."
try {
    git remote add origin $RepoUrl
    Write-Host "成功添加远程仓库！"
} catch {
    Write-Host "错误: 添加远程仓库失败。"
    Write-Host "错误详情: $_"
    exit 1
}

# 推送到远程仓库
Write-Host "正在推送代码到远程仓库..."
try {
    # 使用-u参数设置上游分支，这样以后就可以直接使用git push而不需要指定分支
    git push -u origin master
    
    Write-Host "成功！代码已推送到GitHub仓库。"
    Write-Host "
下一步操作指南：
1. 前往 https://app.netlify.com 登录您的账户
2. 点击"New site from Git"
3. 选择"GitHub"作为Git提供商
4. 授权Netlify访问您的GitHub账户
5. 选择您刚刚创建的仓库（hxqok-website）
6. 在部署设置页面，保持默认设置不变
7. 点击"Deploy site"开始部署
8. 部署完成后，按照DEPLOY_TO_NETLIFY.md文件中的指南绑定www.hxqok.com域名
    "
} catch {
    Write-Host "错误: 推送代码失败。"
    Write-Host "错误详情: $_"
    Write-Host "
常见问题解决方法：
1. 确保您的计算机已安装Git并配置了GitHub凭证
2. 检查您的网络连接是否正常
3. 确认您有权限推送到该GitHub仓库
4. 如果使用HTTPS URL，Git可能会提示您输入GitHub用户名和密码/PAT
5. 如果遇到凭证相关问题，可以尝试在URL中包含凭证：https://用户名:密码或PAT@github.com/用户名/仓库名.git
    "
    exit 1
}