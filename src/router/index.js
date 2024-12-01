import { createRouter, createWebHistory } from 'vue-router';
import Login from '../components/Login.vue';
import facturacionList from '../views/componentsFacturacion/facturacionList.vue';
import facturacionForm from '../views/componentsFacturacion/facturacionForm.vue';
import Proveedor from '../views/componentsProveedor/proveedor.vue';
import clienteList from '../views/componentsCliente/clienteList.vue';
import clienteForm from '../views/componentsCliente/clienteForm.vue';
import ProductoList from '../views/componentsProducto/productoList.vue';
import ProductoForm from '../views/componentsProducto/productoForm.vue';
import EmpleadoList from '../views/componentsEmpleados/empleadoList.vue';
import EmpleadoForm from '../views/componentsEmpleados/empleadoForm.vue';

const routes = [
  {
    path: '/',
    redirect: '/login',
  },
  {
    path: '/proveedor',
    name: 'Proveedor',
    component: Proveedor,
  },
  {
    path: '/producto',
    name: 'ProductoList',
    component: ProductoList,
  },
  {
    path: '/producto/crear',
    name: 'ProductoCrear',
    component: ProductoForm,
  },
  {
    path: '/facturacion',
    name: 'FacturacionList',
    component: facturacionList,
  },
  {
    path: '/facturacion/crear',
    name: 'FacturacionCrear',
    component: facturacionForm,
  },
  {
    path: '/empleados',
    name: 'EmpleadoList',
    component: EmpleadoList,
  },
  {
    path: '/empleados/crear',
    name: 'EmpleadoCrear',
    component: EmpleadoForm,
  },
  {
    path: '/cliente',
    name: 'ClienteList',
    component: clienteList,
  },
  {
    path: '/cliente/crear',
    name: 'ClienteCrear',
    component: clienteForm,
  },
  {
    path: '/login',
    name: 'Login',
    component: Login,
  },
  {
    path: '/:pathMatch(.*)*',
    redirect: '/login',
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
