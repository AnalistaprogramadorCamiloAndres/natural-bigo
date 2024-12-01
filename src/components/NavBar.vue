<script lang="ts" setup>
 import { ref } from 'vue'
  
  const activeIndex = ref('1')
  const handleSelect = (key: string, keyPath: string[]) => {
    console.log(key, keyPath)
  }
</script>


<template>
  <NavBar />
     <el-menu
      :default-active="activeIndex"
        background-color="#16161a "
        text-color="#fff"
      class="el-menu-demo"
      mode="horizontal"
      :ellipsis="false"
      @select="handleSelect"
    >
      <el-menu-item index="0">
        <img
          style="width: 100px"
         
          alt="Element logo"
        />
      </el-menu-item>
  
      <el-sub-menu index="1" >
        <template #title>Natural Bigo</template>
        <el-menu-item index="2-1">Perfil</el-menu-item>
        <el-menu-item index="2-2">Cerrar Sesion</el-menu-item>

      </el-sub-menu>
    </el-menu>
</template>
  


<style scoped>
.el-menu-demo{
   top: 0;
   width: 100%;
   z-index: 10;
}

.el-menu-item, 
span.el-avatar.el-avatar--circle {
 margin-right: auto;
 padding: 0;
}
 
 </style>