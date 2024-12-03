import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';




import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import path from 'path';

export default defineConfig({
  plugins: [vue()],
  base: '/mi-app/',
  resolve: {
    alias: {
     
      build: path.resolve(__dirname, 'src/build'),
      outdir: path.resolve(__dirname, 'dist'),
      '@': path.resolve(__dirname, 'src'),
    },
  },
});
