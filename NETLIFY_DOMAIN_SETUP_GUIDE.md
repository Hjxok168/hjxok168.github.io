# Netlify域名绑定详细指南

这份指南将帮助您在Netlify中找到域名设置选项并完成www.hxqok.com的绑定。

## 第一步：登录Netlify并找到您的网站

1. 打开浏览器，访问 [Netlify官网](https://www.netlify.com) 并登录您的账户
2. 登录后，您会看到仪表板界面，其中显示了您已部署的所有网站
3. 找到显示临时域名 `https://graceful-narwhal-bea10a.netlify.app/` 的网站项目

## 第二步：进入域名设置界面

**重要提示：** Netlify的界面可能会有更新，所以实际显示的选项可能与之前的描述略有不同。以下是几种常见的找到域名设置的方法：

### 方法一：从网站卡片进入设置

1. 在仪表板中，找到您的网站卡片（显示临时域名的那个）
2. 点击网站卡片右下角的 **"Settings"** 按钮（设置图标）
3. 在左侧菜单中，找到并点击 **"Domain management"**（域名管理）选项

### 方法二：从网站详情页进入设置

1. 在仪表板中，直接点击您的网站卡片进入网站详情页
2. 在网站详情页的顶部导航栏中，点击 **"Settings"** 选项卡
3. 在左侧菜单中，找到并点击 **"Domain management"**（域名管理）选项

## 第三步：添加自定义域名www.hxqok.com

1. 在"Domain management"页面中，找到 **"Custom domains"** 部分
2. 点击 **"Add custom domain"** 按钮
3. 在弹出的对话框中，输入 `www.hxqok.com`
4. 点击 **"Verify"** 按钮
5. 系统可能会提示您确认是否拥有该域名，点击确认

## 第四步：配置DNS记录

添加域名后，Netlify会显示DNS配置指南。您需要在您的域名注册商（购买www.hxqok.com域名的地方）设置以下DNS记录：

### 方法一：使用CNAME记录（推荐）

1. 添加一条CNAME记录：
   - 主机名/名称：`www`
   - 指向/值：`graceful-narwhal-bea10a.netlify.app`
   - TTL：设置为最小值（通常是300秒）

### 方法二：使用A记录

如果您的域名注册商不支持CNAME记录，或者您想配置根域名（不带www），可以使用A记录：

1. 添加一条A记录：
   - 主机名/名称：`@`（代表根域名）
   - IP地址：`75.2.60.5`（Netlify的IP地址）
   - TTL：设置为最小值（通常是300秒）

## 第五步：等待DNS记录生效

1. DNS记录更新后，通常需要几分钟到几小时才能全局生效
2. 在Netlify的"Domain management"页面中，您可以看到域名状态的变化
3. 当状态变为"Connected"（已连接）时，表示DNS记录已生效

## 第六步：启用HTTPS（SSL/TLS）

1. DNS记录生效后，返回Netlify的"Domain management"页面
2. 在域名列表中找到www.hxqok.com
3. 点击域名旁边的 **"Enable HTTPS"** 按钮
4. Netlify将自动为您的域名颁发和配置SSL证书
5. 等待几分钟，直到HTTPS状态显示为"Active"（已激活）

## 常见问题排查

如果您在操作过程中遇到问题：

1. **找不到"Settings"或"Domain management"选项**：
   - 确保您已登录Netlify账户并成功部署了网站
   - 尝试刷新页面或使用不同的浏览器
   - 检查Netlify是否有界面更新或功能调整

2. **DNS记录配置问题**：
   - 确认您在正确的域名注册商处进行了配置
   - 检查记录类型（CNAME或A）和值是否正确
   - 等待足够的时间让DNS记录生效（最长可能需要24小时）

3. **HTTPS启用失败**：
   - 确保DNS记录已完全生效
   - 检查域名是否已正确解析到Netlify的服务器
   - 尝试点击"Renew certificate"按钮重新申请证书

## 完成域名绑定

完成以上步骤后，您的网站将可以通过www.hxqok.com域名正常访问，并且支持HTTPS安全连接。如果您需要进一步的帮助，请随时参考Netlify的官方文档或联系他们的支持团队。