<template>
  <div class="w-full h-full flex flex-col px-10 pt-8 pb-10 animate-fade-in">
    <header class="mb-8 shrink-0">
      <h2 class="text-4xl font-semibold tracking-tight text-[#1d1d1f]">视觉神经</h2>
      <p class="text-gray-500 mt-2 text-sm uppercase tracking-widest font-semibold opacity-70">Real-time Security Vision</p>
    </header>

    <div class="flex gap-10 flex-1 min-h-0">
      <div class="flex-[2] apple-card p-8 flex flex-col relative overflow-hidden">
        <div class="flex justify-between items-center mb-6 shrink-0">
          <div class="flex bg-gray-100 p-1 rounded-full text-xs font-medium cursor-pointer border border-gray-200 shadow-sm">
            <button v-for="mode in modes" :key="mode.key" @click="setMode(mode.key)"
                    :class="visionMode === mode.key ? mode.activeClass : mode.inactiveClass"
                    class="px-5 py-2 rounded-full transition-all">{{ mode.label }}</button>
          </div>
          <div class="flex items-center gap-3">
            <span class="text-sm font-semibold text-gray-500">启动摄像头</span>
            <label class="ios-switch">
              <input type="checkbox" v-model="isCameraOn" @change="toggleCamera">
              <span class="slider"></span>
            </label>
          </div>
        </div>

        <div class="flex-1 min-h-[300px] bg-[#09090b] rounded-[24px] relative overflow-hidden flex items-center justify-center border-4 shadow-inner transition-all duration-500"
             :class="visionMode === 'BEHAVIOR' && behaviorResult.status === 'danger' ? 'border-red-500 shadow-[inset_0_0_80px_rgba(255,59,48,0.4)]' : 'border-gray-100'">
          <video ref="videoRef" autoplay muted playsinline class="w-full h-full object-cover transform -scale-x-100 absolute inset-0 z-10" :class="{'hidden': !isCameraOn}"></video>
          <canvas ref="canvasRef" class="absolute inset-0 w-full h-full pointer-events-none z-20"></canvas>
          <div v-if="isCameraOn && visionMode === 'FACE'" class="scan-effect scan-effect-green z-30"></div>

          <div v-if="!isCameraOn" class="text-gray-500 flex flex-col items-center z-0">
            <LucideIcon name="camera-off" class="w-16 h-16 mb-4 opacity-40" />
            <p class="text-lg font-medium tracking-widest uppercase">视觉传感器已休眠</p>
          </div>
        </div>
      </div>

      <div class="flex-1 flex flex-col gap-6 min-h-0">
        <div class="apple-card p-10 flex-1 flex flex-col relative overflow-hidden">
          <div v-if="isCameraOn" class="animate-fade-in relative z-10 flex-1 overflow-y-auto no-scrollbar" style="min-height: 0;">
            <template v-if="visionMode === 'FACE'">
              <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full mb-6 border" :class="secIdentity !== 'Unknown' ? 'bg-[#0071e3]/10 text-[#0071e3] border-[#0071e3]/20' : 'bg-gray-100 text-gray-500 border-gray-200'">
                <span class="w-2 h-2 rounded-full animate-pulse" :class="secIdentity !== 'Unknown' ? 'bg-[#0071e3]' : 'bg-gray-400'"></span>
                <span class="text-[10px] font-bold uppercase tracking-widest">Access Control</span>
              </div>
              <h3 class="text-4xl font-black text-[#1d1d1f] mb-3">{{ secIdentity !== 'Unknown' ? secIdentity : '未识别人员' }}</h3>
              <p class="text-base text-gray-500 mb-8 font-medium border-b border-gray-100 pb-6">{{ secIdentity !== 'Unknown' ? '身份核验通过，已授权' : '请面对摄像头进行特征比对' }}</p>
            </template>

            <template v-if="visionMode === 'FIRE'">
              <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full mb-4 border" :class="visionResult.status !== 'normal' ? 'bg-red-50 text-red-600 border-red-200' : 'bg-green-50 text-green-600 border-green-200'">
                <span class="w-2 h-2 rounded-full animate-pulse" :class="visionResult.status !== 'normal' ? 'bg-red-500' : 'bg-green-500'"></span>
                <span class="text-[10px] font-bold uppercase tracking-widest">Fire & Smoke Detection</span>
              </div>
              <h3 class="text-4xl font-black text-[#1d1d1f] mb-3">{{ fireStatusText }}</h3>
              <p class="text-base text-gray-500 mb-8 font-medium border-b border-gray-100 pb-6">{{ visionResult.status !== 'normal' ? '系统已自动拉响警报' : 'AI视觉分析引擎运行中' }}</p>
            </template>

            <template v-if="visionMode === 'BEHAVIOR'">
              <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full mb-4 border" :class="behaviorResult.status === 'danger' ? 'bg-red-50 text-red-600 border-red-200' : 'bg-purple-50 text-purple-600 border-purple-200'">
                <span class="w-2 h-2 rounded-full animate-pulse" :class="behaviorResult.status === 'danger' ? 'bg-red-500' : 'bg-purple-500'"></span>
                <span class="text-[10px] font-bold uppercase tracking-widest">Behavior Analysis</span>
              </div>
              <h3 class="text-4xl font-black text-[#1d1d1f] mb-3">{{ behaviorResult.status === 'danger' ? '异常行为警告' : '行为举止正常' }}</h3>
            </template>
          </div>

          <div v-else class="text-center text-gray-400 relative z-10 flex-1 flex flex-col items-center justify-center">
            <div class="w-24 h-24 mx-auto bg-gray-50 rounded-full flex items-center justify-center mb-6 shadow-inner border border-gray-100">
              <LucideIcon name="scan-line" class="w-10 h-10 opacity-40" />
            </div>
            <p class="text-base font-bold tracking-widest text-gray-500 mb-2">等待视觉输入</p>
            <p class="text-xs font-medium opacity-60">请在左侧启动主摄像头</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, computed, onUnmounted } from 'vue'
import { visionApi, faceApi } from '../services/api'
import LucideIcon from '../components/LucideIcon.js'

const videoRef = ref(null)
const canvasRef = ref(null)
const visionMode = ref('FACE')
const isCameraOn = ref(false)
const secIdentity = ref('Unknown')
const visionResult = reactive({ status: 'normal', detections: [] })
const behaviorResult = reactive({ status: 'normal', behavior: '正常', confidence: 0, className: '', topK: [] })

let mediaStream = null
let visionTimer = null

const modes = [
  { key: 'FACE', label: '人脸安防', activeClass: 'bg-white shadow text-[#0071e3] font-bold', inactiveClass: 'text-gray-500 hover:text-black' },
  { key: 'FIRE', label: '火情侦测', activeClass: 'bg-red-500 shadow text-white font-bold', inactiveClass: 'text-gray-500 hover:text-red-500' },
  { key: 'BEHAVIOR', label: '行为分析', activeClass: 'bg-purple-600 shadow text-white font-bold', inactiveClass: 'text-gray-500 hover:text-purple-500' }
]

const fireStatusText = computed(() => {
  if (visionResult.status === 'fire_and_smoke') return '发现火情与烟雾'
  if (visionResult.status === 'fire') return '发现明火'
  if (visionResult.status === 'smoke') return '发现异常烟雾'
  return '环境安全'
})

const captureFrame = () => {
  if (!videoRef.value) return null
  const c = document.createElement('canvas')
  c.width = 640
  c.height = 480
  c.getContext('2d').drawImage(videoRef.value, 0, 0, 640, 480)
  return c
}

const tickVision = async () => {
  const canvas = captureFrame()
  if (!canvas) return

  if (visionMode.value === 'FACE') {
    try {
      const base64 = canvas.toDataURL('image/jpeg', 0.8)
      const res = await faceApi.login(base64)
      secIdentity.value = res.success && res.user ? res.user.name : 'Unknown'
    } catch (e) {}
  } else {
    canvas.toBlob(async (blob) => {
      const formData = new FormData()
      formData.append('image', blob, 'frame.jpg')
      try {
        if (visionMode.value === 'FIRE') {
          const res = await visionApi.fireMonitor(formData)
          if (res.code === 200 || res.status) {
            visionResult.status = res.status
            visionResult.detections = res.detections || []
            drawBoxes(visionResult.detections)
          }
        } else if (visionMode.value === 'BEHAVIOR') {
          const res = await visionApi.behaviorMonitor(formData)
          if (res.code === 200 || res.status) {
            behaviorResult.status = res.status
            behaviorResult.behavior = res.behavior || '正常'
            behaviorResult.confidence = res.confidence || 0
            behaviorResult.className = res.className || ''
            behaviorResult.topK = res.topK || []
          }
        }
      } catch (e) {}
    }, 'image/jpeg', 0.8)
  }
}

const drawBoxes = (detections) => {
  const canvas = canvasRef.value
  const video = videoRef.value
  if (!canvas || !video) return
  const ctx = canvas.getContext('2d')
  canvas.width = video.clientWidth
  canvas.height = video.clientHeight
  ctx.clearRect(0, 0, canvas.width, canvas.height)
  if (!detections || detections.length === 0) return

  detections.forEach(det => {
    const [x1, y1, x2, y2] = det.bbox
    const isFire = det.class === 0 || det.name === 'fire'
    const color = isFire ? '#ff3b30' : '#ffcc00'
    const drawX = canvas.width - (canvas.width * (x2 / 640))
    const drawY = canvas.height * (y1 / 640)
    const drawW = canvas.width * ((x2 - x1) / 640)
    const drawH = canvas.height * ((y2 - y1) / 640)

    ctx.strokeStyle = color
    ctx.lineWidth = 3
    ctx.shadowBlur = 15
    ctx.shadowColor = color
    ctx.strokeRect(drawX, drawY, drawW, drawH)
    ctx.shadowBlur = 0
    ctx.fillStyle = color
    ctx.font = 'bold 16px sans-serif'
    ctx.fillText(`${det.name.toUpperCase()} ${(det.confidence * 100).toFixed(0)}%`, drawX + 5, drawY - 8)
  })
}

const setMode = (mode) => {
  visionMode.value = mode
  visionResult.status = 'normal'
  visionResult.detections = []
  secIdentity.value = 'Unknown'
  behaviorResult.status = 'normal'
  const canvas = canvasRef.value
  if (canvas) canvas.getContext('2d').clearRect(0, 0, canvas.width, canvas.height)
}

const toggleCamera = async () => {
  if (isCameraOn.value) {
    try {
      mediaStream = await navigator.mediaDevices.getUserMedia({ video: true })
      if (videoRef.value) videoRef.value.srcObject = mediaStream
      visionTimer = setInterval(tickVision, 500)
    } catch (e) {
      isCameraOn.value = false
    }
  } else {
    clearInterval(visionTimer)
    if (mediaStream) mediaStream.getTracks().forEach(t => t.stop())
    if (canvasRef.value) canvasRef.value.getContext('2d').clearRect(0, 0, canvasRef.value.width, canvasRef.value.height)
    visionResult.status = 'normal'
    secIdentity.value = 'Unknown'
    behaviorResult.status = 'normal'
  }
}

onUnmounted(() => {
  clearInterval(visionTimer)
  if (mediaStream) mediaStream.getTracks().forEach(t => t.stop())
})
</script>