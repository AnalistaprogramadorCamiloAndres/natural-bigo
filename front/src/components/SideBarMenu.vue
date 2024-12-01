<template>
  <div class="menu-container">
    <el-menu
      :default-active="getActiveIndex"
      router
      class="el-menu-vertical-demo"
      background-color="#242629"
      text-color="#fff"
      active-text-color="#409EFF"
      collapse-transition
    >
      <el-menu-item index="/facturacion">
        <span>Facturas</span>
      </el-menu-item>
      <el-menu-item index="/cliente">
        <span>Clientes</span>
      </el-menu-item>
      <el-menu-item index="/producto">
        <span>Productos</span>
      </el-menu-item>
      <el-menu-item index="/empleados">
        <span>Empleados</span>
      </el-menu-item>
      <!-- <el-menu-item index="/proveedor">
        <span>Proveedores</span>
      </el-menu-item> -->
    </el-menu>

    <div class="logout-button" @click="handleLogout">
      <span>Cerrar Sesión</span>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { computed } from "vue";
import { useRoute, useRouter } from "vue-router";
import { ElNotification } from "element-plus";

const route = useRoute();
const router = useRouter();

const getActiveIndex = computed(() => {
  const path = route.path;
  if (path.startsWith("/facturacion")) return "/facturacion";
  if (path.startsWith("/cliente")) return "/cliente";
  if (path.startsWith("/empleados")) return "/empleados";
  if (path.startsWith("/producto")) return "/producto";
  if (path.startsWith("/proveedor")) return "/proveedor";
  return "/";
});

const handleLogout = () => {
  localStorage.removeItem("userToken");
  ElNotification({
    title: "Sesión cerrada",
    message: "Has cerrado sesión exitosamente.",
    type: "success",
    duration: 3000,
  });
  router.push("/login");
};
</script>

<style scoped>
html,
body {
  margin: 0;
  padding: 0;
  background-color: #333333;
}

.menu-container {
  display: flex;
  flex-direction: column;
  height: 100vh;
}

.el-menu-vertical-demo {
  width: 200px;
  background-color: #242629;
  color: #fff;
  border-radius: 0;
  padding: 0;
  margin: 0;
  transition: all 0.3s;
  flex-grow: 1;
}

.el-menu-vertical-demo .el-menu-item {
  transition: background-color 0.3s, color 0.3s;
  display: flex;
  align-items: center;
  gap: 10px;
}

.el-menu-vertical-demo .el-menu-item.is-active {
  background-color: #409EFF !important;
  color: #fff !important;
}

.el-menu-vertical-demo .el-menu-item:hover {
  background-color: #3a3d41;
}

.el-menu-vertical-demo .el-menu-item span {
  font-size: 14px;
  font-weight: bold;
}

.logout-button {
  background-color: #ff4d4f;
  color: #fff;
  text-align: center;
  padding: 15px;
  cursor: pointer;
  font-weight: bold;
  font-size: 14px;
}

.logout-button:hover {
  background-color: #d9363e;
}
</style>
