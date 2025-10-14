# 将网站部署到Netlify的步骤

按照以下步骤将您的网站部署到Netlify，并绑定www.hxqok.com域名。

## 前提条件

- 已创建[GitHub](https://github.com)或[GitLab](https://gitlab.com)账户
- 已创建[Netlify](https://www.netlify.com)账户
- 本地已完成网站开发并初始化Git仓库

## 第一步：将代码推送到GitHub/GitLab

1. 在GitHub或GitLab上创建一个新的仓库
2. 复制仓库的远程地址（HTTPS或SSH）
3. 在本地项目目录中执行以下命令：

```bash
# 添加远程仓库地址
git remote add origin <您的仓库地址>

# 推送到远程仓库
git push -u origin master
```

## 第二步：在Netlify上部署网站

1. 登录Netlify账户
2. 点击"New site from Git"
3. 选择您的Git提供商（GitHub/GitLab）
4. 授权Netlify访问您的仓库
5. 选择您刚刚创建的仓库
6. 在部署设置页面：
   - Build command: 留空（因为是纯静态网站）
   - Publish directory: 留空（默认为根目录）
7. 点击"Deploy site"
8. Netlify将开始构建和部署您的网站

## 第三步：绑定域名www.hxqok.com

1. 部署完成后，点击网站设置
2. 选择"Domain settings"
3. 点击"Add custom domain"
4. 输入www.hxqok.com，点击"Verify"
5. 按照Netlify提供的DNS设置指南，在您的域名注册商处添加DNS记录：
   - 添加CNAME记录：www -> <您的Netlify子域名>.netlify.app
   - 或者添加A记录：@ -> 75.2.60.5
6. 等待DNS记录生效（通常需要几分钟到几小时）
7. 启用SSL/TLS：在Domain settings中，找到HTTPS部分，点击"Enable HTTPS"

## 第四步：配置重定向和自定义错误页面

netlify.toml文件已包含必要的重定向配置，确保SPA路由正常工作。404.html文件将作为自定义错误页面使用。

## 其他设置

- 您可以在Netlify中设置自动部署：每当您推送到Git仓库时，Netlify会自动重新构建和部署网站
- 可以设置自定义构建环境变量（如有需要）
- 可以配置部署预览：对于Pull Requests/Merge Requests，Netlify会自动生成预览链接

## 完成部署

完成上述步骤后，您的网站将通过www.hxqok.com域名访问。