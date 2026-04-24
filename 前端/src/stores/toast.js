import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useToastStore = defineStore('toast', () => {
  const toast = ref({ show: false, message: '', type: 'success', icon: 'check-circle', color: 'text-green-600' })

  const showToast = (msg, type = 'success', icon = 'info') => {
    toast.value.message = msg
    toast.value.type = type
    toast.value.icon = type === 'success' ? 'check-circle' : (type === 'error' ? 'x-circle' : icon)
    toast.value.color = type === 'success' ? 'text-green-600' : (type === 'error' ? 'text-red-500' : 'text-blue-500')
    toast.value.show = true
    setTimeout(() => toast.value.show = false, 3000)
  }

  return { toast, showToast }
})