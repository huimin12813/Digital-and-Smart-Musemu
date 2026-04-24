import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()],
  server: {
    port: 5173,
    proxy: {
      '/api': {
        target: 'http://192.168.20.195:8080',
        changeOrigin: true
      },
      '/ws': {
        target: 'ws://192.168.20.195:8080',
        ws: true
      }
    }
  }
})