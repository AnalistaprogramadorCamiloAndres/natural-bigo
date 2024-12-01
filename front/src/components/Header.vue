<template>
  <div class="container">
      <div class="container__header">
        <h2 class="container__title">Modulo de {{ titulo }}</h2>
        <el-row justify="center" align="middle">
          <el-button type="primary" @click="abrir" class="padded-button">
            {{ tituloBoton }}
          </el-button>
        </el-row>
      </div>
    </div>
</template>

<script setup>
  defineProps({
    titulo: { type: String, required: true },
    tituloBoton: { type: String, required: true },
    abrir: {
      type: Function,
      required: true
    }
  })

</script>

<style scoped>
.container {
    margin-bottom: 10px;
  }
  
  .container__header {
    display: flex;
    justify-content: space-between;
    border-bottom: 2px solid rgb(238, 233, 233);
  }
  
  
  .padded-button {
    padding: 20px;
    background-color: #7f5af0;
    border: none;
    color: white;
  }
</style>