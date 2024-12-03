import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';




export default defineConfig({
  plugins: [vue()],
  base: '/mi-app/',
  resolve: {
    alias: {
      build: '/src/build',
      outdir: '/dist',
      '@': '/src',
    },
  },
});