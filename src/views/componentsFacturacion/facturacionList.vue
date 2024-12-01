<script setup>
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { ElNotification, ElMessageBox } from 'element-plus';
import SideBarMenu from '../../components/SideBarMenu.vue';
import axios from 'axios';

const router = useRouter();

const agregarFactura = () => {
  router.push('/facturacion/crear');
};

const loading = ref(false);

const apiFacturacion = 'http://127.0.0.1:8000/api/api/facturacion';

const facturas = ref([]);

const fetchFacturas = async () => {
  loading.value = true;
  try {
    const response = await axios.get(apiFacturacion);
    if (response.data.status === '200') {
      facturas.value = response.data.data;
    }
  } catch (error) {
    console.error('Error al cargar las facturas:', error);
    ElNotification({
      title: 'Error',
      message: 'Ocurrió un error al cargar las facturas.',
      type: 'error',
      duration: 3000,
    });
  } finally {
    loading.value = false;
  }
};

const deleteFactura = async (row) => {
  try {
    await ElMessageBox.confirm(
      `¿Estás seguro de que deseas eliminar la factura con ID ${row.ID_FACTURA}?`,
      'Confirmar eliminación',
      {
        confirmButtonText: 'Sí, eliminar',
        cancelButtonText: 'Cancelar',
        type: 'warning',
      }
    );
    const response = await axios.delete(`${apiFacturacion}/${row.ID_FACTURA}`);
    if (response.data.status === '200') {
      ElNotification({
        title: 'Éxito',
        message: response.data.message,
        type: 'success',
        duration: 3000,
      });
      fetchFacturas();
    } else {
      ElNotification({
        title: 'Error',
        message: 'No se pudo eliminar la factura. Intente nuevamente.',
        type: 'error',
        duration: 3000,
      });
    }
  } catch (error) {
    if (error !== 'cancel') {
      console.error('Error al eliminar la factura:', error);
      ElNotification({
        title: 'Error',
        message: 'Ocurrió un error al intentar eliminar la factura.',
        type: 'error',
        duration: 3000,
      });
    }
  }
};

const formatFecha = (fecha) => {
  const date = new Date(fecha);
  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const day = String(date.getDate()).padStart(2, "0");
  return `${year}-${month}-${day}`;
};

onMounted(() => {
  fetchFacturas();
});
</script>

<template>
  <div class="layout">
    <div class="sidebar">
      <SideBarMenu />
    </div>
    <div class="content">
      <div class="header">
        <h2 class="form-title">FACTURAS</h2>
        <el-button type="primary" @click="agregarFactura" class="add-button"> Agregar Factura </el-button>
      </div>
      <el-card class="form-card" shadow="always">
        <el-table :data="facturas" style="width: 100%" v-loading="loading">
          <el-table-column prop="ID_FACTURA" label="ID"  width="50"/>
          <el-table-column label="Fecha">
            <template #default="scope">
              {{ formatFecha(scope.row.FACTURA_FECHA) }}
            </template>
          </el-table-column>
          <el-table-column prop="cliente.NOMBRE" label="Nombre Cliente" />
          <el-table-column prop="producto.NOMBRE_PRODUCTO" label="Nombre Producto" />
          <el-table-column prop="TOTAL_DE_LA_FACTURA" label="Total" />
          <el-table-column label="Acciones" width="200">
            <template #default="scope">
              <div class="action-buttons">
                <el-button type="warning" @click="updateFactura(scope.row)">
                  Actualizar
                </el-button>
                <el-button type="danger" @click="deleteFactura(scope.row)">
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
