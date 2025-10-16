# 高端知识探索网站

这是一个高端知识探索网站的前端项目，提供各类知识内容的展示和学习资源。

## 项目特点

- 响应式设计，支持桌面和移动设备
- 使用Tailwind CSS构建现代化UI
- 包含丰富的知识主题内容
- 提供服务介绍、专家团队展示等功能

## 使用Docker构建和运行

### 前提条件

- 安装[Docker](https://docs.docker.com/get-docker/)：如果系统上未安装Docker，请按照官方文档进行安装
- 对于Windows系统，建议开启WSL 2以获得更好的Docker体验

### 构建Docker镜像

```bash
# 克隆项目到本地（如果尚未克隆）
# git clone <repository-url>
# cd WZKF

# 构建Docker镜像
docker build -t knowledge-explore .

# 或者使用自定义镜像名称和标签
docker build -t your-username/knowledge-explore:latest .

# 如果需要指定Dockerfile路径（通常不需要）
# docker build -f Dockerfile -t knowledge-explore .
```

### 运行Docker容器

```bash
# 运行Docker容器，将容器的80端口映射到主机的8080端口
docker run -p 8080:80 knowledge-explore

# 或者在后台运行
# docker run -d -p 8080:80 knowledge-explore

# 如果需要持久化数据（适用于有动态内容的网站）
# docker run -p 8080:80 -v ./data:/usr/share/nginx/html/data knowledge-explore
```

运行后，可以通过浏览器访问 `http://localhost:8080` 查看网站。

### 使用docker-compose（推荐）

项目中已包含`docker-compose.yml`文件，可以更简单地管理Docker容器：

```bash
# 构建并启动容器
# docker-compose up -d

# 仅启动容器（不重新构建）
# docker-compose up -d --no-build

# 查看容器状态
# docker-compose ps

# 停止并移除容器
# docker-compose down

# 查看容器日志
# docker-compose logs
```

### Docker常见问题解决

1. **找不到docker命令**：
   - 确保Docker已正确安装并添加到系统PATH中
   - Windows用户可能需要重启终端或电脑
   - 检查Docker Desktop是否正在运行

2. **构建失败**：
   - 检查Dockerfile是否存在于当前目录
   - 确保您有足够的权限访问项目文件
   - 查看详细的错误日志以获取具体原因

3. **端口冲突**：
   - 如果8080端口已被占用，可以使用其他端口，如 `-p 8888:80`
   - 或修改`docker-compose.yml`文件中的端口映射配置

4. **Docker Desktop启动失败**：
   - Windows用户：检查WSL 2是否已正确安装和配置
   - 确保系统资源充足（内存、CPU）
   - 尝试重启Docker Desktop服务

## 本地开发

### 方法1：直接使用浏览器打开

只需在浏览器中直接打开 `index.html` 文件即可查看网站效果。

### 方法2：使用简单的HTTP服务器

如果需要更好的开发体验，可以使用Python、Node.js等提供的简单HTTP服务器：

```bash
# 使用Python 3
python -m http.server 8080

# 或者使用Node.js的http-server
# npm install -g http-server
# http-server -p 8080
```

然后通过浏览器访问 `http://localhost:8080` 查看网站。

### 方法3：使用Tailwind CSS构建（推荐）

#### 安装依赖

```bash
npm install
```

#### 构建CSS

```bash
npm run build
```

#### 监听模式（开发时使用）

```bash
npm run watch
```

## Tailwind CSS项目配置

项目已配置了Tailwind CSS，包含以下文件：
- `tailwind.config.js` - Tailwind CSS配置
- `postcss.config.js` - PostCSS配置
- `package.json` - 项目依赖和脚本
- `src/input.css` - Tailwind CSS的输入文件
- `dist/output.css` - 构建后的CSS输出文件（构建后生成）

## 项目结构

```
├── index.html           # 网站主页
├── styles.css           # 样式文件
├── scripts.js           # JavaScript脚本
├── images/              # 图片资源目录
├── kl8_ai_game.html     # AI游戏演示页面
├── 404.html             # 404页面
├── CODE_FIX_SOLUTION.html # 代码修复方案文档
├── Dockerfile           # Docker构建文件
└── README.md            # 项目说明文档
```

## 部署指南

### Docker部署

可以将构建的Docker镜像部署到任何支持Docker的平台，如：
- [Docker Hub](https://hub.docker.com/)
- [AWS ECS](https://aws.amazon.com/ecs/)
- [Google Cloud Run](https://cloud.google.com/run)
- [Azure Container Instances](https://azure.microsoft.com/en-us/services/container-instances/)

### 静态网站托管

由于这是一个纯静态网站，也可以部署到各种静态网站托管服务：
- [GitHub Pages](https://pages.github.com/)
- [Netlify](https://www.netlify.com/)
- [Vercel](https://vercel.com/)
- [Cloudflare Pages](https://pages.cloudflare.com/)

## 代码修复说明

项目中包含了一个 `CODE_FIX_SOLUTION.html` 文件，其中详细说明了网站中存在的一些代码问题及修复方案，包括HTML结构错误、链接可访问性问题和CSS兼容性问题。

## 许可证

[MIT](LICENSE)