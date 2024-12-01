<script setup>
import { ref, computed } from 'vue';
import { ElNotification } from 'element-plus';
import { useRouter } from 'vue-router';
import axios from 'axios';

const email = ref('');
const password = ref('');
const loading = ref(false);
const router = useRouter();

const apiLogin = 'http://127.0.0.1:8000/api/api/login';

const isFormValid = computed(() => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return (
    emailRegex.test(email.value) &&
    password.value.length >= 5 &&
    email.value.length >= 5
  );
});

const handleLogin = async () => {
  if (!isFormValid.value) {
    ElNotification({
      title: 'Error',
      message: 'Verifica los campos antes de continuar.',
      type: 'error',
      duration: 3000,
    });
    return;
  }

  loading.value = true;
  try {
    const response = await axios.post(apiLogin, {
      email: email.value,
      password: password.value,
    });

    if (response.status == 200) {
      ElNotification({
        title: 'Éxito',
        message: 'Inicio de sesión exitoso.',
        type: 'success',
        duration: 3000,
      });
      router.push('/facturacion');
    } else {
      throw new Error(response.data.message || 'Credenciales inválidas.');
    }
  } catch (error) {
    ElNotification({
      title: 'Error',
      message: error.response?.data?.message || 'Ocurrió un error al iniciar sesión.',
      type: 'error',
      duration: 3000,
    });
  } finally {
    loading.value = false;
  }
};
</script>

<template>
  <div class="login-container">
    <h2>Iniciar Sesión</h2>

    <form @submit.prevent="handleLogin">
      <div class="form-group">
        <label for="email">Correo Electrónico</label>
        <el-input
          id="email"
          v-model="email"
          placeholder="Correo electrónico"
          size="large"
          clearable
        />
      </div>

      <div class="form-group">
        <label for="password">Contraseña</label>
        <el-input
          id="password"
          v-model="password"
          type="password"
          placeholder="Contraseña"
          size="large"
          show-password
        />
      </div>

      <el-button
        type="primary"
        size="large"
        :disabled="!isFormValid" 
        :loading="loading"
        class="login-button"
        native-type="submit"
      >
        Iniciar Sesión
      </el-button>
    </form>
  </div>
</template>

<style scoped>
.login-container {
  width: 400px;
  margin: 0 auto;
  padding: 30px;
  background-color: #ffffff;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  text-align: center;
  transition: 0.3s;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.login-container h2 {
  font-size: 1.8rem;
  margin-bottom: 20px;
  color: #333;
}

.form-group {
  margin-bottom: 20px;
  text-align: left;
}

.form-group label {
  display: block;
  margin-bottom: 8px;
  font-weight: bold;
  color: #555;
}

.login-button {
  width: 100%;
}
</style>
