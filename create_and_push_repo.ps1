<#
.SYNOPSIS
创建GitHub仓库并推送本地代码的PowerShell脚本

.DESCRIPTION
此脚本将帮助您在GitHub上创建新仓库，并将本地代码推送到该仓库。
适用于Windows环境下的PowerShell执行。

使用方法:
1. 在Windows PowerShell中运行: .\create_and_push_repo.ps1
2. 根据提示输入您的GitHub信息
#>

# 设置脚本为UTF-8编码
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::InputEncoding = [System.Text.Encoding]::UTF8

# 提示用户输入GitHub用户名
$GitHubUsername = Read-Host "请输入您的GitHub用户名"

# 提示用户输入要创建的仓库名称
$RepoName = Read-Host "请输入要创建的仓库名称 (默认为hxqok-website)"
if ([string]::IsNullOrEmpty($RepoName)) {
    $RepoName = "hxqok-website"
}

# 提示用户输入仓库描述
$RepoDescription = Read-Host "请输入仓库描述 (默认为'个人网站 www.hxqok.com 的源代码')"
if ([string]::IsNullOrEmpty($RepoDescription)) {
    $RepoDescription = "个人网站 www.hxqok.com 的源代码"
}

# 提示用户选择仓库可见性
$IsPrivate = Read-Host "仓库是否设为私有? (y/n，默认为y)"
if ([string]::IsNullOrEmpty($IsPrivate) -or $IsPrivate.ToLower() -eq "y") {
    $PrivateOption = $true
} else {
    $PrivateOption = $false
}

# 提示用户输入GitHub密码或Personal Access Token
# 推荐使用Personal Access Token (PAT) 代替密码
Write-Host "请输入您的GitHub密码或Personal Access Token (输入时不会显示)"
$SecurePassword = Read-Host -AsSecureString
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword)
$Password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
[System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR)

# 创建仓库
Write-Host "正在创建GitHub仓库..."
$Body = @{
    name = $RepoName
    description = $RepoDescription
    private = $PrivateOption
} | ConvertTo-Json

$Credentials = "$($GitHubUsername):$Password"
$EncodedCredentials = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($Credentials))
$Headers = @{
    Authorization = "Basic $EncodedCredentials"
}

try {
    $Response = Invoke-RestMethod -Uri "https://api.github.com/user/repos" -Method Post -Headers $Headers -Body $Body -ContentType "application/json"

    # 提取仓库URL
    $RepoUrl = $Response.clone_url

    # 清理密码变量
    $Password = $null

    Write-Host "仓库创建成功！仓库地址: $RepoUrl"

    # 添加远程仓库
    Write-Host "正在添加远程仓库..."
    git remote add origin $RepoUrl

    # 推送到远程仓库
    Write-Host "正在推送代码到远程仓库..."
    git push -u origin master

    Write-Host "成功！代码已推送到GitHub仓库。"
    Write-Host "下一步，您可以访问 https://app.netlify.com 并连接此仓库进行部署。"
} catch {
    Write-Host "错误: 创建仓库或推送代码失败。"
    Write-Host "错误详情: $_"
    # 清理密码变量
    $Password = $null
    exit 1
}