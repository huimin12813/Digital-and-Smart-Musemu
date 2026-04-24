<template>
  <nav class="w-full flex justify-between items-center px-8 h-14 text-xs font-medium text-gray-800 bg-white/80 backdrop-blur-md sticky top-0 z-50 border-b border-gray-100 flex-shrink-0">
    <div class="flex items-center gap-3 text-[#1d1d1f]">
      <LucideIcon name="box" class="w-5 h-5 text-[#0071e3]" />
      <span class="font-semibold tracking-wider">NEXUS</span>
      <div class="ml-4 flex items-center gap-2 px-3 py-1.5 rounded-full bg-gray-50 border border-gray-200 transition-all cursor-pointer hover:bg-gray-100"
           :class="isGlobalListening ? 'bg-blue-50/80 border-blue-200 hover:bg-blue-100' : ''"
           @click="toggleGlobalVoice">
        <div :class="isGlobalListening ? 'bg-[#0071e3] global-mic-pulse' : 'bg-gray-400'" class="w-2 h-2 rounded-full"></div>
        <span :class="isGlobalListening ? 'text-[#0071e3] font-bold' : 'text-gray-500'">{{ isGlobalListening ? 'Nexus 正在聆听...' : '语音唤醒休眠中' }}</span>
      </div>
    </div>

    <div class="flex items-center gap-8 h-full absolute left-1/2 -translate-x-1/2">
      <div v-for="m in store.menus" :key="m.id" class="relative group h-full flex items-center px-2">
        <div @click.stop.prevent="handleMenuClick(m.id)"
             :class="['cursor-pointer transition-colors flex items-center gap-1', store.activeTab === m.id ? 'text-[#0071e3] font-bold' : 'text-gray-500 hover:text-black']">
          {{ m.name }}
          <span v-if="m.hasSub"><LucideIcon name="chevron-down" class="w-3 h-3 opacity-50 group-hover:opacity-100" /></span>
        </div>
        <div v-if="m.hasSub" class="absolute top-[32px] pt-6 left-1/2 -translate-x-1/2 z-[100] opacity-0 pointer-events-none group-hover:opacity-100 group-hover:pointer-events-auto transition-all">
          <div class="min-w-[150px] bg-white/95 backdrop-blur-xl border border-gray-100 rounded-2xl shadow-xl flex flex-col py-2">
            <div v-for="sub in m.subs" :key="sub.id" @click.stop.prevent="handleSubMenuClick(m.id, sub.id)"
                 class="px-5 py-3 cursor-pointer text-[13px] text-gray-600 hover:text-[#0071e3] hover:bg-blue-50 transition-colors font-medium">
              {{ sub.name }}
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="flex items-center gap-6">
      <div @click="openPersonnel" class="flex items-center gap-1.5 cursor-pointer transition-colors"
           :class="store.activeTab === 'OPS' && store.opsSubTab === 'FACE_ARCHIVE' ? 'text-[#0071e3] font-bold' : 'text-gray-500 hover:text-black'">
        <LucideIcon name="users" class="w-4 h-4" />
        <span class="font-medium">人员管理</span>
      </div>
      <div class="flex items-center gap-2 text-gray-500 hover:text-black cursor-pointer transition-colors" @click="logout">
        <LucideIcon name="user" class="w-4 h-4" />
        <span>{{ store.currentUser?.name || '管理员' }}</span>
        <LucideIcon name="log-out" class="w-4 h-4 ml-2 opacity-50" />
      </div>
    </div>
  </nav>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { useAppStore } from '../stores/app'
import { useToastStore } from '../stores/toast'
import LucideIcon from './LucideIcon.js'

const store = useAppStore()
const toast = useToastStore()

const isGlobalListening = ref(false)
let recognition = null

const handleMenuClick = (id) => store.selectMenu(id)
const handleSubMenuClick = (mainId, subId) => store.selectSubMenu(mainId, subId)
const openPersonnel = () => { store.activeTab = 'OPS'; store.opsSubTab = 'FACE_ARCHIVE' }

const toggleGlobalVoice = () => {
  const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition
  if (!SpeechRecognition) return toast.showToast('浏览器不支持语音', 'error')
  
  if (!recognition) {
    recognition = new SpeechRecognition()
    recognition.lang = 'zh-CN'
    recognition.continuous = true
  }

  if (isGlobalListening.value) {
    isGlobalListening.value = false
    recognition.stop()
    toast.showToast('语音唤醒已休眠', 'info')
  } else {
    isGlobalListening.value = true
    recognition.start()
    toast.showToast('全局语音监听已开启', 'success')
  }
}

const logout = () => {
  store.logout()
  location.reload()
}

onUnmounted(() => {
  if (recognition) recognition.stop()
})
</script>