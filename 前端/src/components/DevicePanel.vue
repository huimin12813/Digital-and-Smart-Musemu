<template>
  <div class="absolute top-4 right-6 w-[380px] bottom-4 bg-white/80 backdrop-blur-3xl border border-white shadow-[0_20px_50px_rgba(0,0,0,0.15)] transition-all duration-500 z-[100] flex flex-col rounded-[32px] overflow-hidden">
    <div class="flex flex-col h-full">
      <div class="flex justify-between items-center px-8 py-6 border-b border-gray-100/50 bg-white/50">
        <div>
          <span class="text-[10px] font-bold text-white px-2.5 py-1 rounded-md uppercase tracking-widest shadow-sm"
                :class="isSimulating ? 'bg-red-500 animate-pulse' : (getDotStatus(device) === 'ALARM' ? 'bg-red-500 animate-pulse' : (getDotStatus(device) === 'ONLINE' ? 'bg-[#0071e3]' : 'bg-gray-400'))">
            {{ isSimulating ? '防误报侦测中' : (isPatrolling ? '巡检中' : getDotStatus(device)) }}
          </span>
        </div>
        <button v-if="!isPatrolling && !isSimulating" @click="$emit('close')" class="w-8 h-8 bg-gray-100 hover:bg-gray-200 rounded-full flex items-center justify-center transition-colors text-gray-500">
          <LucideIcon name="x" class="w-4 h-4" />
        </button>
      </div>

      <div class="flex-1 overflow-y-auto px-8 py-8 no-scrollbar">
        <h3 class="text-2xl font-bold tracking-tight text-[#1d1d1f] mb-2">{{ device.name }}</h3>
        <p class="text-xs font-semibold text-gray-400 mb-8 flex items-center gap-2 uppercase tracking-wider">
          <span class="bg-blue-50 text-[#0071e3] px-2 py-0.5 rounded">{{ device.region }}</span>
          <span>ID: {{ device.deviceId || device.device_id }}</span>
        </p>

        <div class="w-full h-40 bg-gradient-to-br from-gray-50 to-gray-100 rounded-[24px] flex flex-col justify-center items-center mb-8 border border-gray-200/50 shadow-inner relative overflow-hidden">
          <LucideIcon name="cpu" class="w-12 h-12 text-gray-400 z-10 relative drop-shadow-sm" />
        </div>

        <div class="space-y-4">
          <div class="flex items-center justify-between bg-white p-5 rounded-[20px] shadow-[0_2px_10px_rgba(0,0,0,0.02)] border border-gray-100">
            <div>
              <p class="text-[13px] font-bold text-gray-800">安防布防锁定</p>
              <p class="text-[11px] text-gray-400 mt-1">系统全权接管该展柜保护</p>
            </div>
            <label class="ios-switch shrink-0 scale-90 origin-right">
              <input type="checkbox" :checked="device.armStatus === 1 || device.arm_status === 1" @change="handleArm" :disabled="isPatrolling || isSimulating">
              <span class="slider"></span>
            </label>
          </div>

          <div class="grid grid-cols-2 gap-4">
            <button v-for="btn in hardwareButtons" :key="btn.key" @click="handleHardware(btn.key, btn.status)"
                    :disabled="isPatrolling || isSimulating"
                    :class="btn.status === 1 ? btn.activeClass : btn.inactiveClass"
                    class="py-4 rounded-[20px] text-[13px] font-bold transition-all flex flex-col items-center gap-2 disabled:opacity-50">
              <LucideIcon :name="btn.icon" class="w-5 h-5" />
              {{ btn.status === 1 ? btn.offLabel : btn.onLabel }}
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { deviceApi } from '../services/api'
import { useToastStore } from '../stores/toast'
import LucideIcon from './LucideIcon.js'

const props = defineProps({ device: Object, isPatrolling: Boolean, isSimulating: Boolean })
const emit = defineEmits(['close', 'update'])
const toast = useToastStore()

const getDotStatus = (d) => {
  if (!d) return 'OFFLINE'
  if (d.buzzerStatus === 1 || d.buzzer_status === 1) return 'ALARM'
  if (d.status === 1 || d.status === '在线' || d.status === '1') return 'ONLINE'
  return 'OFFLINE'
}

const hardwareButtons = computed(() => {
  const d = props.device
  return [
    { key: 'led', status: d.ledStatus || d.led_status || 0, icon: 'power', onLabel: '开启设备(LED)', offLabel: '关闭设备(LED)',
      activeClass: 'bg-blue-500 text-white shadow-lg shadow-blue-500/30',
      inactiveClass: 'bg-white text-gray-800 border border-gray-200 hover:bg-blue-50 hover:text-blue-600 hover:border-blue-200' },
    { key: 'light', status: d.lightStatus || d.light_status || 0, icon: 'sun', onLabel: '开启展柜照明', offLabel: '关闭展柜照明',
      activeClass: 'bg-amber-500 text-white shadow-lg shadow-amber-500/30',
      inactiveClass: 'bg-white text-gray-800 border border-gray-200 hover:bg-amber-50 hover:text-amber-600 hover:border-amber-200' },
    { key: 'buzzer', status: d.buzzerStatus || d.buzzer_status || 0, icon: 'bell-ring', onLabel: '拉响蜂鸣警报', offLabel: '切断蜂鸣警报',
      activeClass: 'bg-red-500 text-white shadow-lg shadow-red-500/30 animate-pulse',
      inactiveClass: 'bg-white text-gray-800 border border-gray-200 hover:bg-red-50 hover:text-red-600 hover:border-red-200' },
    { key: 'motor', status: d.motorStatus || d.motor_status || 0, icon: 'settings', onLabel: '启动步进电机', offLabel: '停止步进电机',
      activeClass: 'bg-emerald-500 text-white shadow-lg shadow-emerald-500/30',
      inactiveClass: 'bg-white text-gray-800 border border-gray-200 hover:bg-emerald-50 hover:text-emerald-600 hover:border-emerald-200' }
  ]
})

const handleHardware = async (type, currentStatus) => {
  const did = props.device.deviceId || props.device.device_id
  const action = currentStatus === 1 ? 'off' : 'on'
  try {
    await deviceApi.control(did, type, action)
    toast.showToast(`${type} ${action === 'on' ? '已开启' : '已关闭'}`)
    emit('update')
  } catch (e) { toast.showToast('设备通讯异常', 'error') }
}

const handleArm = async () => {
  const did = props.device.deviceId || props.device.device_id
  const isArmed = props.device.armStatus === 1 || props.device.arm_status === 1
  try {
    if (isArmed) await deviceApi.disarm(did)
    else await deviceApi.arm(did)
    toast.showToast(isArmed ? '已撤防' : '已布防')
    emit('update')
  } catch (e) { toast.showToast('操作失败', 'error') }
}
</script>