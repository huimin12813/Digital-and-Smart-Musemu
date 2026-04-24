<template>
  <Transition name="toast">
    <div v-if="toast.show" class="fixed top-4 left-1/2 -translate-x-1/2 z-[9999] px-6 py-3 rounded-full shadow-xl border border-white/50 backdrop-blur-xl text-sm font-medium flex items-center gap-3 bg-white/95 text-gray-800">
      <LucideIcon :name="toast.icon" :class="toast.color" class="w-4 h-4" />
      {{ toast.message }}
    </div>
  </Transition>
</template>

<script setup>
import { useToastStore } from '../stores/toast'
import LucideIcon from './LucideIcon.js'
const toast = useToastStore()
</script>

<style scoped>
.toast-enter-active, .toast-leave-active { transition: all 0.5s ease; }
.toast-enter-from { opacity: 0; transform: translateX(-50%) translateY(-20px); }
.toast-leave-to { opacity: 0; transform: translateX(-50%) translateY(-20px); }
</style>