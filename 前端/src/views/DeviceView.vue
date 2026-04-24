<template>
  <div :key="'dev-'+store.selectedRegion" class="w-full h-full flex flex-col relative overflow-hidden bg-transparent">
    <header class="px-10 pt-8 pb-2 shrink-0 flex justify-between items-end z-20 relative pointer-events-none">
      <div>
        <h1 class="text-4xl font-semibold tracking-tight text-[#1d1d1f]">
          {{ selectedRegion === 'ALL' ? '全馆文物保护矩阵' : selectedRegion + ' 专属监测视界' }}
        </h1>
        <p class="text-gray-500 mt-2 text-xs uppercase tracking-widest font-semibold opacity-70">Isometric Multi-Plane Digital Twin</p>
      </div>
      <div class="flex items-center gap-3 pointer-events-auto">
        <div class="flex gap-2 mr-4">
          <span class="flex items-center gap-1.5 text-xs font-semibold px-3 py-1.5 bg-white/60 backdrop-blur rounded-full shadow-sm border border-white"><span class="w-2 h-2 rounded-full bg-[#0071e3]"></span> 正常</span>
          <span class="flex items-center gap-1.5 text-xs font-semibold px-3 py-1.5 bg-white/60 backdrop-blur rounded-full shadow-sm border border-white"><span class="w-2 h-2 rounded-full bg-red-500 animate-pulse"></span> 警报</span>
        </div>
        <button @click="toggleForceField" class="flex items-center gap-2 px-5 py-2.5 text-[13px] font-bold rounded-full transition-all shadow-sm"
                :class="isForceFieldActive ? 'bg-blue-50 text-[#0071e3] border border-blue-200' : 'bg-white text-gray-700 border border-gray-200 hover:bg-gray-50'">
          <LucideIcon name="shield" class="w-4 h-4" /> {{ isForceFieldActive ? '力场防御中' : '微环境力场' }}
        </button>
        <button @click="runCrossValidationDemo" :disabled="isSimulating" class="flex items-center gap-2 px-5 py-2.5 text-[13px] font-bold rounded-full transition-all shadow-sm disabled:opacity-50"
                :class="isSimulating ? 'bg-red-50 text-red-600 border border-red-200 animate-pulse' : 'bg-white text-red-600 border border-red-200 hover:bg-red-50'">
          <LucideIcon name="crosshair" class="w-4 h-4" /> {{ isSimulating ? '比对中...' : '防误报演练' }}
        </button>
        <button @click="togglePatrol" class="flex items-center gap-2 px-6 py-2.5 text-[13px] font-bold rounded-full shadow-lg transition-all border border-transparent"
                :class="isPatrolling ? 'bg-[#0071e3] text-white animate-pulse shadow-blue-500/30' : 'bg-[#1d1d1f] text-white hover:bg-black hover:shadow-xl'">
          <LucideIcon :name="isPatrolling ? 'stop-circle' : 'scan'" class="w-4 h-4" /> {{ isPatrolling ? '终止巡检' : '沉浸式云巡检' }}
        </button>
      </div>
    </header>

    <div class="flex-1 relative w-full flex items-center justify-center overflow-hidden scene-container" @click="!isPatrolling && !isSimulating && (selectedDevice = null)">
      <div class="world-3d" :style="worldTransform">
        <div class="base-grid"><div class="radar-sweep-global"></div></div>

        <div class="floating-island island-a" :class="{'opacity-20': store.selectedRegion !== 'ALL' && !store.selectedRegion.includes('A')}">
          <div class="showcase-outline" style="top: 20%; left: 20%; width: 60%; height: 25%;"></div>
          <div class="showcase-outline" style="top: 55%; left: 20%; width: 60%; height: 25%;"></div>
          <div class="absolute bottom-6 w-full text-center text-[#0071e3] font-bold text-3xl tracking-widest opacity-20">A 区 展 览 馆</div>
          <div v-for="(device, index) in aDevices" :key="device.deviceId || device.device_id"
               @click.stop="!isPatrolling && !isSimulating && openDevicePanel(device)"
               :style="getDeviceLocalStyle(index)" class="device-node"
               :class="isPatrolling || isSimulating && selectedDevice && (selectedDevice.deviceId || selectedDevice.device_id) === (device.deviceId || device.device_id) ? 'active-focus' : ''">
            <div class="w-3 h-3 rounded-full border-2 border-white shadow-md relative flex items-center justify-center" :class="getDotColorClass(device)">
              <div v-if="isForceFieldActive" class="force-field"></div>
              <span v-if="getDotStatus(device) !== 'OFFLINE'" class="absolute inline-flex h-full w-full rounded-full opacity-75 animate-ping" :class="getDotStatus(device) === 'ALARM' ? 'bg-red-400' : 'bg-blue-400'"></span>
            </div>
            <div class="hologram-label" :style="standUpTransform">
              <div class="px-2.5 py-1 text-[11px] font-bold text-[#1d1d1f] bg-white/85 backdrop-blur-lg rounded-md shadow-lg border border-white flex flex-col items-center">{{ device.name }}</div>
              <div class="w-px h-6 bg-gradient-to-b from-[#1d1d1f]/40 to-transparent mx-auto"></div>
            </div>
          </div>
        </div>

        <div class="floating-island island-b" :class="{'opacity-20': store.selectedRegion !== 'ALL' && !store.selectedRegion.includes('B')}">
          <div class="showcase-outline" style="top: 20%; left: 20%; width: 60%; height: 25%;"></div>
          <div class="showcase-outline" style="top: 55%; left: 20%; width: 60%; height: 25%;"></div>
          <div class="absolute bottom-6 w-full text-center text-gray-400 font-bold text-3xl tracking-widest opacity-30">B 区 珍 藏 馆</div>
          <div v-for="(device, index) in bDevices" :key="device.deviceId || device.device_id"
               @click.stop="!isPatrolling && !isSimulating && openDevicePanel(device)"
               :style="getDeviceLocalStyle(index)" class="device-node"
               :class="isPatrolling || isSimulating && selectedDevice && (selectedDevice.deviceId || selectedDevice.device_id) === (device.deviceId || device.device_id) ? 'active-focus' : ''">
            <div class="w-3 h-3 rounded-full border-2 border-white shadow-md relative flex items-center justify-center" :class="getDotColorClass(device)">
              <div v-if="isForceFieldActive" class="force-field"></div>
              <span v-if="getDotStatus(device) !== 'OFFLINE'" class="absolute inline-flex h-full w-full rounded-full opacity-75 animate-ping" :class="getDotStatus(device) === 'ALARM' ? 'bg-red-400' : 'bg-blue-400'"></span>
            </div>
            <div class="hologram-label" :style="standUpTransform">
              <div class="px-2.5 py-1 text-[11px] font-bold text-[#1d1d1f] bg-white/85 backdrop-blur-lg rounded-md shadow-lg border border-white flex flex-col items-center">{{ device.name }}</div>
              <div class="w-px h-6 bg-gradient-to-b from-[#1d1d1f]/40 to-transparent mx-auto"></div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <DevicePanel v-if="selectedDevice" :device="selectedDevice" :isPatrolling="isPatrolling" :isSimulating="isSimulating" @close="selectedDevice = null" @update="fetchData" />
  </div>
</template>

<script setup>
import { ref, reactive, computed, onMounted, onUnmounted, inject } from 'vue'
import { useAppStore } from '../stores/app'
import { useToastStore } from '../stores/toast'
import { deviceApi } from '../services/api'
import LucideIcon from '../components/LucideIcon.js'
import DevicePanel from '../components/DevicePanel.vue'

const store = useAppStore()
const toast = useToastStore()
const selectedDevice = ref(null)
const isPatrolling = ref(false)
const isForceFieldActive = ref(true)
const isSimulating = ref(false)
const patrolIndex = ref(0)
let patrolTimer = null

const deviceList = inject('deviceList')
const fetchData = inject('fetchAllData')

const selectedRegion = computed(() => store.selectedRegion)

const aDevices = computed(() => deviceList.value.filter(d => String(d.region || '').toUpperCase().includes('A')))
const bDevices = computed(() => deviceList.value.filter(d => String(d.region || '').toUpperCase().includes('B')))

const worldTransform = computed(() => {
  const r = store.selectedRegion
  if (r.includes('A')) return 'rotateX(55deg) rotateZ(-20deg) scale(1.15) translateX(15%) translateZ(-40px)'
  if (r.includes('B')) return 'rotateX(55deg) rotateZ(-50deg) scale(1.15) translateX(-15%) translateZ(40px)'
  return 'rotateX(60deg) rotateZ(-35deg) scale(1)'
})

const standUpTransform = computed(() => {
  const r = store.selectedRegion
  if (r.includes('A')) return 'rotateZ(20deg) rotateX(-55deg) translateY(-25px)'
  if (r.includes('B')) return 'rotateZ(50deg) rotateX(-55deg) translateY(-25px)'
  return 'rotateZ(35deg) rotateX(-60deg) translateY(-25px)'
})

const getDeviceLocalStyle = (index) => {
  const pts = [{ top: '25%', left: '25%' }, { top: '25%', left: '75%' }, { top: '75%', left: '25%' }, { top: '75%', left: '75%' }, { top: '50%', left: '50%' }]
  return pts[index % pts.length]
}

const getDotStatus = (d) => {
  if (!d) return 'OFFLINE'
  if (d.buzzerStatus === 1 || d.buzzer_status === 1) return 'ALARM'
  if (d.status === 1 || d.status === '在线' || d.status === '1') return 'ONLINE'
  return 'OFFLINE'
}

const getDotColorClass = (d) => {
  const s = getDotStatus(d)
  if (s === 'ALARM') return 'bg-red-500 shadow-[0_0_15px_rgba(255,59,48,0.8)]'
  if (s === 'ONLINE') return 'bg-[#0071e3] shadow-[0_0_15px_rgba(0,113,227,0.8)]'
  return 'bg-gray-400 border-gray-300'
}

const openDevicePanel = (device) => { selectedDevice.value = device }

const toggleForceField = () => {
  isForceFieldActive.value = !isForceFieldActive.value
  toast.showToast(isForceFieldActive.value ? '力场防御已开启' : '力场已关闭', 'info')
}

const runCrossValidationDemo = () => {
  if (deviceList.value.length === 0) return toast.showToast('当前区域无设备', 'error')
  if (isPatrolling.value) stopPatrol()
  isForceFieldActive.value = true
  isSimulating.value = true
  selectedDevice.value = deviceList.value[0]
  setTimeout(() => {
    isSimulating.value = false
    toast.showToast('误报已过滤，系统恢复正常', 'success')
  }, 7500)
}

const togglePatrol = () => {
  if (isPatrolling.value) { stopPatrol() }
  else { startPatrol() }
}

const startPatrol = () => {
  isSimulating.value = false
  isPatrolling.value = true
  patrolIndex.value = 0
  if (deviceList.value.length === 0) { stopPatrol(); return }
  selectedDevice.value = deviceList.value[0]
  patrolTimer = setInterval(() => {
    patrolIndex.value++
    if (patrolIndex.value >= deviceList.value.length) { stopPatrol() }
    else { selectedDevice.value = deviceList.value[patrolIndex.value] }
  }, 4000)
}

const stopPatrol = () => {
  isPatrolling.value = false
  clearInterval(patrolTimer)
  patrolTimer = null
  if (!isSimulating.value) selectedDevice.value = null
}

onUnmounted(() => { clearInterval(patrolTimer) })
</script>