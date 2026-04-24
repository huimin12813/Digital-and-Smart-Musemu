<template>
  <div class="h-full w-full relative">
    <Toast />
    <Login v-if="!store.isLoggedIn" />
    <MainLayout v-else />
  </div>
</template>

<script setup>
import { onMounted } from 'vue'
import { useAppStore } from './stores/app'
import Toast from './components/Toast.vue'
import Login from './views/Login.vue'
import MainLayout from './views/MainLayout.vue'

const store = useAppStore()

onMounted(() => {
  if (window.lucideIcons) window.lucideIcons.createIcons()
})
</script>