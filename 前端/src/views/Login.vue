<template>
  <div class="fixed inset-0 z-[2000] bg-[#f5f5f7] flex items-center justify-center">
    <div class="absolute inset-0 overflow-hidden pointer-events-none">
      <div class="absolute -top-[20%] -left-[10%] w-[50%] h-[50%] bg-blue-500/10 blur-[120px] rounded-full"></div>
      <div class="absolute top-[60%] -right-[10%] w-[40%] h-[40%] bg-green-500/10 blur-[120px] rounded-full"></div>
    </div>

    <div class="apple-card relative z-10 w-[420px] p-10 flex flex-col items-center shadow-2xl">
      <span class="bg-[#0071e3]/10 p-3 rounded-2xl mb-4"><LucideIcon name="scan-face" class="w-8 h-8 text-[#0071e3]" /></span>
      <h2 class="text-2xl font-semibold tracking-tight text-[#1d1d1f] mb-1">Nexus 核心中枢</h2>
      <p class="text-xs text-gray-500 mb-8">文物保护与防盗系统已就绪</p>

      <div class="flex bg-gray-50 p-1 rounded-full text-xs font-medium mb-8 w-full border border-gray-100">
        <button @click="authMode = 'LOGIN'" :class="authMode === 'LOGIN' ? 'bg-white shadow text-black' : 'text-gray-500 hover:text-black'" class="flex-1 py-2 rounded-full transition-all">安全核验</button>
        <button @click="authMode = 'REGISTER'" :class="authMode === 'REGISTER' ? 'bg-white shadow text-black' : 'text-gray-500 hover:text-black'" class="flex-1 py-2 rounded-full transition-all">新元录入</button>
      </div>

      <div class="w-40 h-40 rounded-full overflow-hidden relative border-4 border-white shadow-inner mb-8 bg-gray-100">
        <video ref="videoRef" autoplay muted playsinline class="w-full h-full object-cover transform -scale-x-100"></video>
        <div v-if="authLoading" class="scan-effect"></div>
      </div>

      <div v-if="authMode === 'REGISTER'" class="w-full mb-6 space-y-3 animate-fade-in">
        <input v-model="authForm.name" placeholder="您的真实姓名" class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-sm focus:outline-none focus:bg-white focus:border-[#0071e3] transition-all">
        <select v-model="authForm.role" class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-sm focus:outline-none focus:bg-white transition-all">
          <option value="admin">系统管理员 (Admin)</option>
          <option value="staff">巡检员工 (Staff)</option>
        </select>
      </div>

      <button @click="submitAuth" :disabled="authLoading" class="w-full py-3.5 bg-[#1d1d1f] hover:bg-black text-white font-semibold rounded-xl transition-all disabled:opacity-50 shadow-md">
        {{ authLoading ? '特征提取中...' : (authMode === 'LOGIN' ? '开始核验' : '采集并录入') }}
      </button>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { useAppStore } from '../stores/app'
import { useToastStore } from '../stores/toast'
import { faceApi } from '../services/api'
import LucideIcon from '../components/LucideIcon.js'

const store = useAppStore()
const toast = useToastStore()

const authMode = ref('LOGIN')
const authLoading = ref(false)
const authForm = reactive({ name: '', role: 'visitor' })
const videoRef = ref(null)
let mediaStream = null

const startCamera = async () => {
  try {
    mediaStream = await navigator.mediaDevices.getUserMedia({ video: true })
    if (videoRef.value) videoRef.value.srcObject = mediaStream
  } catch (e) { console.error('Camera error:', e) }
}

const captureBase64 = () => {
  if (!videoRef.value) return null
  const canvas = document.createElement('canvas')
  canvas.width = 640
  canvas.height = 480
  canvas.getContext('2d').drawImage(videoRef.value, 0, 0, 640, 480)
  return canvas.toDataURL('image/jpeg', 0.8)
}

const submitAuth = async () => {
  const base64 = captureBase64()
  if (!base64) return toast.showToast('未捕获到画面', 'error')

  authLoading.value = true
  try {
    if (authMode.value === 'LOGIN') {
      const res = await faceApi.login(base64)
      if (res.success && res.user) {
        toast.showToast('核验成功')
        stopCamera()
        store.login(res.user)
        speakText(`欢迎回来，${res.user.name}。数字孪生中枢已就绪。`)
      } else {
        toast.showToast('核验失败', 'error')
      }
    } else {
      if (!authForm.name.trim()) {
        toast.showToast('请输入姓名', 'error')
        authLoading.value = false
        return
      }
      const res = await faceApi.register({
        imageBase64: base64,
        metadata: { name: authForm.name, role: authForm.role }
      })
      if (res.success) {
        toast.showToast('录入成功')
        authMode.value = 'LOGIN'
      } else {
        toast.showToast('录入失败', 'error')
      }
    }
  } catch (e) {
    toast.showToast('服务异常', 'error')
  }
  authLoading.value = false
}

const stopCamera = () => {
  if (mediaStream) mediaStream.getTracks().forEach(t => t.stop())
}

const speakText = (text) => {
  if (!window.speechSynthesis) return
  const utterance = new SpeechSynthesisUtterance(text.replace(/[*#>`~_]/g, ''))
  utterance.lang = 'zh-CN'
  utterance.rate = 1.1
  window.speechSynthesis.speak(utterance)
}

onMounted(() => {
  startCamera()
  if (window.lucideIcons) window.lucideIcons.createIcons()
})
</script>