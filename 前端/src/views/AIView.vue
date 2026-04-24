<template>
  <div class="max-w-3xl mx-auto px-8 pt-12 pb-24 h-[calc(100vh-60px)] flex flex-col animate-fade-in">
    <div class="text-center mb-8">
      <div class="w-16 h-16 bg-gradient-to-tr from-[#0071e3] to-[#42a1ff] rounded-2xl mx-auto flex items-center justify-center shadow-lg mb-4">
        <LucideIcon name="bot" class="w-8 h-8 text-white" />
      </div>
      <h2 class="text-2xl font-semibold">Nexus 助理</h2>
      <p class="text-xs text-gray-500 mt-1">全局语音中枢已开启，您可以直接对我下达指令</p>
    </div>

    <div ref="chatBox" class="flex-1 overflow-y-auto no-scrollbar space-y-4 px-4 pb-4">
      <div v-for="m in messages" :key="m.id" :class="['flex w-full', m.role === 'user' ? 'justify-end' : 'justify-start']">
        <div :class="['px-5 py-3 max-w-[75%] text-[15px] leading-relaxed whitespace-pre-wrap',
            m.role === 'user' ? 'bg-[#0071e3] text-white rounded-2xl rounded-br-sm shadow-sm' : 'bg-white border border-gray-100 text-black rounded-2xl rounded-bl-sm shadow-sm']">
          {{ m.text }}
          <div v-if="m.loading" class="mt-1 flex gap-1 items-center h-4">
            <span class="w-1.5 h-1.5 bg-gray-400 rounded-full animate-bounce"></span>
            <span class="w-1.5 h-1.5 bg-gray-400 rounded-full animate-bounce" style="animation-delay:0.1s"></span>
            <span class="w-1.5 h-1.5 bg-gray-400 rounded-full animate-bounce" style="animation-delay:0.2s"></span>
          </div>
        </div>
      </div>
    </div>

    <div class="mt-4 relative flex gap-3">
      <input v-model="userInput" @keyup.enter="sendChat" :placeholder="isRecording ? '正在聆听您的指令...' : '输入文字指令，或点击右侧麦克风说话'"
             :class="isRecording ? 'border-red-400 bg-red-50' : 'border-gray-200 bg-white'"
             class="flex-1 border rounded-full pl-6 pr-[6.5rem] py-3.5 text-[15px] focus:outline-none focus:border-[#0071e3] shadow-sm transition-all">
      <div class="absolute right-2 top-1.5 flex gap-1.5">
        <button @click="startVoiceChat" :class="isRecording ? 'bg-red-500 text-white animate-pulse shadow-md' : 'bg-gray-100 text-gray-500 hover:bg-gray-200'" class="w-10 h-10 rounded-full flex items-center justify-center transition-all">
          <LucideIcon name="mic" class="w-4 h-4" />
        </button>
        <button @click="sendChat" class="w-10 h-10 bg-[#0071e3] text-white rounded-full flex items-center justify-center hover:bg-[#0077ED] transition-colors shadow-sm">
          <LucideIcon name="arrow-up" class="w-5 h-5" />
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, nextTick } from 'vue'
import { agentApi } from '../services/api'
import LucideIcon from '../components/LucideIcon.js'

const userInput = ref('')
const isRecording = ref(false)
const chatBox = ref(null)
const messages = reactive([
  { id: 1, role: 'ai', text: '您好，这里是 Nexus 语音交互中枢。您可以随时对我下达指令。' }
])

const sendChat = async () => {
  if (!userInput.value.trim()) return
  const text = userInput.value
  userInput.value = ''
  messages.push({ id: Date.now(), role: 'user', text })
  const aiId = Date.now() + 1
  messages.push({ id: aiId, role: 'ai', text: '正在思考...', loading: true })
  nextTick(() => { if (chatBox.value) chatBox.value.scrollTop = 9999 })

  try {
    const res = await agentApi.chat(text, 'pc-admin')
    const replyText = res.answer || res.data?.answer || '系统异常'
    const msg = messages.find(m => m.id === aiId)
    if (msg) { msg.text = replyText; msg.loading = false }
    speakText(replyText)
  } catch (e) {
    const msg = messages.find(m => m.id === aiId)
    if (msg) { msg.text = '连接失败'; msg.loading = false }
  }
}

const startVoiceChat = () => {
  const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition
  if (!SpeechRecognition) return
  if (isRecording.value) return

  const recognition = new SpeechRecognition()
  recognition.lang = 'zh-CN'
  recognition.onresult = (event) => {
    userInput.value = event.results[0][0].transcript
    sendChat()
  }
  recognition.onend = () => { isRecording.value = false }
  recognition.onerror = () => { isRecording.value = false }
  isRecording.value = true
  recognition.start()
}

const speakText = (text) => {
  if (!window.speechSynthesis) return
  window.speechSynthesis.cancel()
  const utterance = new SpeechSynthesisUtterance(text.replace(/[*#>`~_]/g, ''))
  utterance.lang = 'zh-CN'
  utterance.rate = 1.1
  window.speechSynthesis.speak(utterance)
}
</script>