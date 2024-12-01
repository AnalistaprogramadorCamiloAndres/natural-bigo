import 'element-plus/dist/index.css'; // Importa los estilos de Element Plus
import { createApp } from 'vue';
import ElementPlus from 'element-plus';
import App from './App.vue';
import router from './router'; // Importa las rutas

const app = createApp(App);

// Usar Element Plus
app.use(ElementPlus);

// Usar Vue Router
app.use(router);

// Montar la aplicación en el DOM
app.mount('#app');


