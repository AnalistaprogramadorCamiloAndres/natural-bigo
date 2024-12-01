<script setup>
import Login from '../components/Login.vue';
import Formulario from '../components/Formulario.vue';
import SideBarMenu from '../components/SideBarMenu.vue';
import NavBar from '../components/NavBar.vue';



</script>

<template>

  <Formulario />

  <el-login>
    <Login />
  </el-login>


  <el-container style="height: 100vh;">

    
  <el-header class="el-header">
    <NavBar />
  </el-header> -->

    <el-container>
      <el-aside width="auto">
        <SideBarMenu /> -->
      </el-aside>

      <el-main class="main-content">
        <slot name="slotLayout"></slot>
      </el-main>
    </el-container>
  </el-container>

</template>

<style scoped>
.el-header{
  background-color: #f4f4f4;
  height: 60px;
  text-align: center;
  line-height: 60px;
  color: #333;
}
.el-header {
  padding: 0;
}

.el-aside {
  background-color: #f4f4f4;
}

.main-content {
  position: relative;
}
</style>