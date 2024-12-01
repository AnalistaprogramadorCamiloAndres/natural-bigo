<script setup>
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { ElNotification, ElMessageBox } from 'element-plus';
import SideBarMenu from '../../components/SideBarMenu.vue';
import axios from 'axios';

const router = useRouter();

const agregarCliente = () => {
  router.push('/cliente/crear');
};

const loading = ref(false);

const apiCliente = 'http://127.0.0.1:8000/api/api/cliente';

const clientes = ref([]);

const fetchClientes = async () => {
  loading.value = true;
  try {
    const response = await axios.get(apiCliente);
    if (response.data.status === '200') {
      clientes.value = response.data.data;
    }
  } catch (error) {
    console.error('Error al cargar las clientes:', error);
    ElNotification({
      title: 'Error',
      message: 'Ocurrió un error al cargar las clientes.',
      type: 'error',
      duration: 3000,
    });
  } finally {
    loading.value = false;
  }
};

const deleteCliente = async (row) => {
  try {
    await ElMessageBox.confirm(
      `¿Estás seguro de que deseas eliminar la cliente con ID ${row.ID_CLIENTE}?`,
      'Confirmar eliminación',
      {
        confirmButtonText: 'Sí, eliminar',
        cancelButtonText: 'Cancelar',
        type: 'warning',
      }
    );
    const response = await axios.delete(`${apiCliente}/${row.ID_CLIENTE}`);
    if (response.data.status === '200') {
      ElNotification({
        title: 'Éxito',
        message: response.data.message,
        type: 'success',
        duration: 3000,
      });
      fetchClientes();
    } else {
      ElNotification({
        title: 'Error',
        message: 'No se pudo eliminar la cliente. Intente nuevamente.',
        type: 'error',
        duration: 3000,
      });
    }
  } catch (error) {
    if (error !== 'cancel') {
      console.error('Error al eliminar la cliente:', error);
      ElNotification({
        title: 'Error',
        message: 'Ocurrió un error al intentar eliminar la cliente.',
        type: 'error',
        duration: 3000,
      });
    }
  }
};

onMounted(() => {
  fetchClientes();
});
</script>

<template>
  <div class="layout">
    <div class="sidebar">
      <SideBarMenu />
    </div>
    <div class="content">
      <div class="header">
        <h2 class="form-title">CLIENTES</h2>
        <el-button type="primary" @click="agregarCliente" class="add-button"> Agregar Cliente </el-button>
      </div>
      <el-card class="form-card" shadow="always">
        <el-table :data="clientes" style="width: 100%" v-loading="loading">
          <el-table-column prop="ID_CLIENTE" label="ID" width="50"/>
          <el-table-column prop="NOMBRE" label="Nombre" />
          <el-table-column prop="CORREO_ELECTRONICO" label="Correo" />
          <el-table-column prop="CEDULA_DE_CIUDADANIA" label="Cédula" />
          <el-table-column label="Acciones" width="200">
            <template #default="scope">
              <div class="action-buttons">
                <el-button type="warning" @click="updateCliente(scope.row)">
                  Actualizar
                </el-button>
                <el-button type="danger" @click="deleteCliente(scope.row)">
                  Eliminar
                </el-button>
              </div>
            </template>
          </el-table-column>
        </el-table>
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

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  padding: 0 10%;
}

.form-title {
  font-size: 2rem;
  font-weight: bold;
  margin: 0;
}

.add-button {
  font-size: 1.2rem;
  padding: 10px 20px;
  min-width: 180px;
}

.form-card {
  width: 90%;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  background: #fff;
  overflow: visible;
}

.el-table {
  width: 100%;
}

.action-buttons {
  display: flex;
  gap: 10px;
  justify-content: center;
}
</style>
