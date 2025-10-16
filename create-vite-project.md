# 使用Vite创建快乐8 AI预测游戏项目

## 创建Vite项目

1. 打开终端或命令提示符
2. 运行以下命令创建Vite项目：

```bash
npm create vite@latest kl8-ai-game -- --template vanilla
```

或者，如果您想使用Vue.js模板：

```bash
npm create vite@latest kl8-ai-game -- --template vue
```

3. 进入项目目录：

```bash
cd kl8-ai-game
```

## 安装Tailwind CSS

1. 安装Tailwind CSS和相关依赖：

```bash
npm install -D tailwindcss postcss autoprefixer
```

2. 初始化Tailwind CSS配置：

```bash
npx tailwindcss init -p
```

## 配置Tailwind CSS

1. 编辑`tailwind.config.js`文件：

```javascript
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    ".index.html",
    "./*.html",
    "./src/**/*.{js,ts,jsx,tsx,vue}",
  ],
  theme: {
    extend: {
      colors: {
        primary: '#165DFF',
        secondary: '#722ED1',
        success: '#00B42A',
        warning: '#FF7D00',
        danger: '#F53F3F',
        info: '#86909C',
        light: '#F2F3F5',
        dark: '#1D2129',
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
      },
    }
  },
  plugins: [],
}
```

2. 在`src/main.js`或`index.html`中添加Tailwind CSS指令：

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

## 移动现有代码

1. 将现有的`kl8_ai_game.html`中的内容复制到Vite项目中的相应文件
2. 确保所有资源路径正确

## 开发和构建

1. 启动开发服务器：

```bash
npm run dev
```

2. 构建生产版本：

```bash
npm run build
```

## 部署

构建后的文件将位于`dist`目录中，可以直接部署到任何静态网站托管服务。