<script setup>
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { ElNotification, ElMessageBox } from 'element-plus';
import SideBarMenu from '../../components/SideBarMenu.vue';
import axios from 'axios';

const router = useRouter();

const agregarEmpleado = () => {
  router.push('/empleados/crear');
};

const loading = ref(false);

const apiEmpleado = 'http://127.0.0.1:8000/api/api/empleado';

const empleados = ref([]);

const fetchEmpleados = async () => {
  loading.value = true;
  try {
    const response = await axios.get(apiEmpleado);
    if (response.data.status === '200') {
      empleados.value = response.data.data;
    }
  } catch (error) {
    console.error('Error al cargar los empleados:', error);
    ElNotification({
      title: 'Error',
      message: 'Ocurrió un error al cargar los empleados.',
      type: 'error',
      duration: 3000,
    });
  } finally {
    loading.value = false;
  }
};

const deleteEmpleado = async (row) => {
  try {
    await ElMessageBox.confirm(
      `¿Estás seguro de que deseas eliminar el empleado con ID ${row.ID_EMPLEADO}?`,
      'Confirmar eliminación',
      {
        confirmButtonText: 'Sí, eliminar',
        cancelButtonText: 'Cancelar',
        type: 'warning',
      }
    );
    const response = await axios.delete(`${apiEmpleado}/${row.ID_EMPLEADO}`);
    if (response.data.status === '200') {
      ElNotification({
        title: 'Éxito',
        message: response.data.message,
        type: 'success',
        duration: 3000,
      });
      fetchEmpleados();
    } else {
      ElNotification({
        title: 'Error',
        message: 'No se pudo eliminar el empleado. Intente nuevamente.',
        type: 'error',
        duration: 3000,
      });
    }
  } catch (error) {
    if (error !== 'cancel') {
      console.error('Error al eliminar el empleado:', error);
      ElNotification({
        title: 'Error',
        message: 'Ocurrió un error al intentar eliminar el empleado.',
        type: 'error',
        duration: 3000,
      });
    }
  }
};

onMounted(() => {
  fetchEmpleados();
});
</script>

<template>
  <div class="layout">
    <div class="sidebar">
      <SideBarMenu />
    </div>
    <div class="content">
      <div class="header">
        <h2 class="form-title">EMPLEADOS</h2>
        <el-button type="primary" @click="agregarEmpleado" class="add-button"> Agregar Empleado </el-button>
      </div>
      <el-card class="form-card" shadow="always">
        <el-table :data="empleados" style="width: 100%" v-loading="loading">
          <el-table-column prop="ID_EMPLEADO" label="ID" width="50"/>
          <el-table-column prop="NOMBRES" label="Nombre" />
          <el-table-column prop="APELLIDOS" label="Apellido" />
          <el-table-column prop="CARGO" label="Cargo" />
          <el-table-column prop="CORREO_ELECTRONICO" label="Correo electrónico" />
          <el-table-column label="Acciones" width="200">
            <template #default="scope">
              <div class="action-buttons">
                <el-button type="warning" @click="updateEmpleado(scope.row)">
                  Actualizar
                </el-button>
                <el-button type="danger" @click="deleteEmpleado(scope.row)">
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
