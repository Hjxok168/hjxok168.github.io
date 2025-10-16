import { defineConfig } from 'vite'
import tailwindcss from '@tailwindcss/vite'

// 使用.js而不是.ts配置文件，可能会更稳定
export default defineConfig({
  plugins: [
    tailwindcss(),
  ],
  build: {
    outDir: 'dist',
    assetsDir: 'assets'
  }
})