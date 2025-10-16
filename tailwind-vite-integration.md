# 使用Tailwind CSS Vite插件集成指南

## 安装依赖

首先，通过npm安装Tailwind CSS和Vite插件：

```bash
npm install tailwindcss @tailwindcss/vite
```

## 配置Vite插件

在您的Vite配置文件中添加Tailwind CSS插件：

```typescript
// vite.config.ts
import { defineConfig } from 'vite'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    tailwindcss(),
  ],
})
```

## 导入Tailwind CSS

在您的CSS文件中导入Tailwind CSS：

```css
/* style.css 或 main.css */
@import "tailwindcss";
```

## 配置Tailwind CSS

初始化Tailwind CSS配置：

```bash
npx tailwindcss init -p
```

然后编辑`tailwind.config.js`文件，指定需要扫描的文件路径：

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

## 开发和构建

启动开发服务器：

```bash
npm run dev
```

构建生产版本：

```bash
npm run build
```

## 注意事项

1. 这种方法不需要PostCSS配置
2. 不需要单独的`@tailwind base`、`@tailwind components`和`@tailwind utilities`指令
3. 插件会自动处理Tailwind CSS的扫描和处理
4. 确保在`content`配置中包含所有需要扫描的文件路径
