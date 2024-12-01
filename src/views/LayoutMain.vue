<script setup>

import LayoutMain from '../components/LayoutMain.vue';
import SideBarMenu from '../components/SideBarMenu.vue';
import { ref } from 'vue';

</script>

<template>
    <SideBarMenu />
    <LayoutMain>
        <div class="container">
            <LayoutMain/>
        </div>
    </LayoutMain>
   

</template>

<style scoped>

</style>
