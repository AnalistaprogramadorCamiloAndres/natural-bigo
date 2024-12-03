import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';

const defineConfig = require('vite'); // Declaración duplicada
import vue from '@vitejs/plugin-vue';
const vue = require('@vitejs/plugin-vue'); // Declaración duplicada





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
