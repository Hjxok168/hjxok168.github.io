# 快乐8 AI预测游戏 - 部署指南

## 开发环境 vs 生产环境

### 开发环境

当前项目使用Tailwind CSS CDN版本，适合开发和测试阶段。CDN版本提供了便利性，但不应在生产环境中使用。

### 生产环境

在生产环境中，建议使用构建版本的Tailwind CSS，这样可以：
- 减少加载时间
- 只包含实际使用的CSS类
- 提高安全性

## 从开发环境切换到生产环境

### 步骤1：安装依赖

```bash
npm install
```

### 步骤2：构建CSS

```bash
npm run build
```

### 步骤3：修改HTML文件

将HTML中的CDN引用：
```html
<script src="https://cdn.tailwindcss.com/3.4.17"></script>
```

替换为构建版本引用：
```html
<link href="dist/output.css" rel="stylesheet">
```

### 步骤4：验证构建结果

确保`dist/output.css`文件已生成，并且网站在所有目标浏览器中正常工作。

## 部署到生产服务器

1. 将构建后的文件（HTML、CSS、JS等）上传到您的生产服务器
2. 确保服务器已正确配置MIME类型
3. 测试网站功能是否正常

## 性能优化建议

1. 启用GZIP压缩
2. 配置适当的缓存头
3. 使用CDN分发静态资源
4. 压缩图片资源

## 维护说明

- 定期更新依赖项以获取安全补丁
- 监控网站性能和错误日志
- 根据需要重新构建CSS文件
