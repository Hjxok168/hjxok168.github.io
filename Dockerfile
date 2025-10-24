# 使用Nginx作为基础镜像
FROM nginx:alpine

# 维护者信息
MAINTAINER Your Name <your.email@example.com>

# 设置工作目录
WORKDIR /usr/share/nginx/html

# 复制所有前端文件到Nginx的默认静态文件目录
COPY . .

# 复制自定义Nginx配置文件（可选，如果需要的话）
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# 暴露80端口
EXPOSE 80

# 启动Nginx
CMD ["nginx", "-g", "daemon off;"]