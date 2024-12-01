<script setup>
import { ref, reactive, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { ElNotification } from 'element-plus';
import SideBarMenu from '../../components/SideBarMenu.vue';
import axios from 'axios';

const router = useRouter();

const volver = () => {
  router.push('/producto');
};

const producto = reactive({
  ID_PRODUCTO: '',
  NOMBRE_PRODUCTO: '',
  DESCRIPCION: '',
  PRECIO: '',
  STOCK_DISPONIBLE: '',
});

const loading = ref(false);

const apiProducto = 'http://127.0.0.1:8000/api/api/producto';

const resetForm = () => {
  Object.keys(producto).forEach((key) => (producto[key] = key === 'CANTIDAD' ? 1 : ''));
};

const validateForm = () => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  for (const [key, value] of Object.entries(producto)) {
    if (value.trim() === '') {
      ElNotification({
        title: 'Error',
        message: `El campo ${key.replace(/_/g, ' ').toLowerCase()} es obligatorio.`,
        type: 'error',
        duration: 3000,
      });
      return false;
    }
  }

  return true;
};

const saveForm = async () => {
  if (!validateForm()) {
    ElNotification({
      title: 'Error',
      message: 'Todos los campos son obligatorios.',
      type: 'error',
      duration: 3000,
    });
    return;
  }

  loading.value = true;
  try {
    await axios.post(apiProducto, producto);
    ElNotification({
      title: 'Éxito',
      message: 'Producto registrado correctamente',
      type: 'success',
      duration: 3000,
    });
    resetForm();
  } catch (error) {
    console.error('Error al guardar:', error);
    ElNotification({
      title: 'Error',
      message: 'Ocurrió un error al guardar el producto.',
      type: 'error',
      duration: 3000,
    });
  } finally {
    loading.value = false;
  }
};

onMounted(() => {
});
</script>

<template>
  <div class="layout">
    <div class="sidebar">
      <SideBarMenu />
    </div>
    <div class="content">
      <h2 class="form-title">AGREGAR PRODUCTO</h2>
      <el-card class="form-card" shadow="always">
        <el-form label-position="top" class="form">
          <div class="row">
            <div class="col-md-6">
              <el-form-item label="ID Producto">
                <el-input v-model="producto.ID_PRODUCTO" placeholder="Ingrese el ID del producto" size="large" />
              </el-form-item>
            </div>
            <div class="col-md-6">
              <el-form-item label="Nombre">
                <el-input v-model="producto.NOMBRE_PRODUCTO" placeholder="Ingrese el nombre" size="large" />
              </el-form-item>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <el-form-item label="Stock">
                <el-input v-model="producto.STOCK_DISPONIBLE" placeholder="Ingrese el stock" size="large" />
              </el-form-item>
            </div>
            <div class="col-md-6">
              <el-form-item label="Precio">
                <el-input v-model="producto.PRECIO" placeholder="Ingrese el precio" size="large" />
              </el-form-item>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <el-form-item label="Descripción">
                <el-input v-model="producto.DESCRIPCION" placeholder="Ingrese la descripción" size="large" />
              </el-form-item>
            </div>
          </div>
        </el-form>
        <div class="actions">
          <el-button type="warning" :loading="loading" @click="volver" size="large">Volver</el-button>
          <el-button type="primary" :loading="loading" @click="saveForm" size="large">Guardar</el-button>
        </div>
      </el-card>
    </div>
  </div>
</template>

<style scoped>
.layout {
  display: flex;
  min-height: 100vh;
  overflow: hidden;
}

.sidebar {
  color: #fff;
  overflow-y: auto;
}

.add-button {
  font-size: 1.2rem;
  padding: 10px 20px;
  min-width: 180px;
}

.content {
  flex: 1;
  padding: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: #f2f3f5;
  gap: 20px;
  overflow-y: auto;
  max-height: 100vh;
  box-sizing: border-box;
}

.form-title {
  font-size: 2rem;
  font-weight: bold;
  text-align: center;
  margin: 20px 0;
}

.form-card,
.table-card {
  width: 90%;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  background: #fff;
  overflow: visible;
}

.table-card {
  margin-top: 20px;
}

.form {
  margin: 0;
}

.row {
  display: flex;
  flex-wrap: wrap;
}

.col-md-6 {
  flex: 0 0 50%;
  max-width: 50%;
  padding: 10px;
}

.col-md-12 {
  flex: 0 0 100%;
  max-width: 100%;
  padding: 10px;
}

.actions {
  display: flex;
  justify-content: center;
  gap: 30px;
  margin-top: 20px;
}

.actions>.el-button {
  min-width: 150px;
}

.el-table {
  width: 100%;
}

html,
body {
  height: 100%;
  margin: 0;
  padding: 0;
  overflow: hidden;
}

.layout {
  display: flex;
  min-height: 100vh;
  overflow: hidden;
}

.content {
  flex: 1;
  padding: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: #f2f3f5;
  gap: 20px;
  overflow-y: auto;
}

.el-overlay {
  z-index: 9999 !important;
}
</style>
