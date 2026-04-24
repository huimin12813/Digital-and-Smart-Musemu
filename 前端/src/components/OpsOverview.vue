<template>
  <div class="space-y-6">
    <div class="grid grid-cols-4 gap-6">
      <div v-for="s in statCards" :key="s.label" class="apple-card p-6 flex flex-col justify-between" :class="'border-l-4 border-l-'+s.color">
        <div class="text-gray-500 text-sm font-semibold mb-2">{{ s.label }}</div>
        <div class="text-5xl font-semibold text-[#1d1d1f]">{{ s.value }}</div>
      </div>
    </div>

    <div class="grid grid-cols-[2fr_1fr] gap-6">
      <div class="apple-card p-8">
        <div class="flex items-center justify-between mb-8">
          <h3 class="text-2xl font-semibold text-[#1d1d1f] flex items-center gap-2"><LucideIcon name="activity" class="w-6 h-6 text-[#0071e3]" />实时环境监测中心</h3>
          <button @click="fetchSensors" class="text-sm font-medium px-4 py-2 bg-gray-50 text-gray-600 rounded-full border border-gray-200 hover:bg-gray-100 transition-colors shadow-sm">同步数据</button>
        </div>
        <div class="grid grid-cols-4 gap-4">
          <div v-for="s in sensors" :key="s.label" class="bg-gray-50/80 rounded-[20px] border border-gray-100 p-6 text-center shadow-sm">
            <div class="text-gray-500 text-sm font-medium mb-3">{{ s.label }}</div>
            <div class="text-4xl font-semibold" :class="s.colorClass">{{ s.value }}<span class="text-lg ml-1 text-gray-400">{{ s.unit }}</span></div>
            <div class="mt-4 inline-flex text-[11px] font-bold px-3 py-1 rounded-full" :class="s.statusClass">{{ s.statusText }}</div>
          </div>
        </div>
      </div>

      <div class="apple-card p-8">
        <div class="flex items-center justify-between mb-6">
          <h3 class="text-2xl font-semibold text-[#1d1d1f] flex items-center gap-2"><LucideIcon name="bell" class="w-6 h-6 text-[#ff9f0a]" />安全实时动态</h3>
          <span class="text-gray-400 text-xs font-bold uppercase">最近 {{ alarmFeed.length }} 条</span>
        </div>
        <div class="h-[480px] overflow-y-auto no-scrollbar pr-2 space-y-3">
          <div v-for="a in alarmFeed" :key="a.id" class="p-4 bg-gray-50 border border-gray-100 rounded-2xl flex items-start gap-3">
            <div class="text-xs font-semibold text-gray-400 w-12 shrink-0 pt-0.5">{{ formatTime(a.create_time || a.createTime).slice(11, 16) }}</div>
            <span class="text-[10px] font-bold px-2 py-0.5 rounded uppercase shrink-0" :class="String(a.level || '').toLowerCase().includes('critical') ? 'bg-red-100 text-red-600' : 'bg-orange-100 text-orange-600'">{{ String(a.level || '').toLowerCase().includes('critical') ? '紧急' : '警示' }}</span>
            <div class="text-sm font-medium text-gray-800 truncate">{{ a.content || a.message || '告警信息' }}</div>
          </div>
          <div v-if="alarmFeed.length === 0" class="h-full flex items-center justify-center text-gray-400 font-medium">暂无实时告警</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, computed, inject } from 'vue'
import { useAppStore } from '../../stores/app'
import { alarmApi, sensorApi, faceApi } from '../../services/api'
import LucideIcon from '../LucideIcon.js'

const store = useAppStore()
const devices = inject('deviceList', ref([]))
const alarms = inject('alarms', ref([]))
const workOrders = inject('workOrders', ref([]))

const statCards = reactive([
  { label: '今日告警', value: 0, color: '[#ff3b30]' },
  { label: '在线设备', value: 0, color: '[#0071e3]' },
  { label: '待办工单', value: 0, color: '[#ff9f0a]' },
  { label: '人脸库记录', value: 0, color: '[#34c759]' }
])

const sensors = reactive([
  { label: '环境温度', value: '--', unit: '℃', colorClass: 'text-[#1d1d1f]', statusClass: 'bg-green-50 text-green-600', statusText: '正常' },
  { label: '相对湿度', value: '--', unit: '%', colorClass: 'text-[#1d1d1f]', statusClass: 'bg-green-50 text-green-600', statusText: '正常' },
  { label: '烟雾浓度', value: '--', unit: 'ppm', colorClass: 'text-[#ff3b30]', statusClass: 'bg-green-50 text-green-600', statusText: '正常' },
  { label: '光照强度', value: '--', unit: 'lux', colorClass: 'text-[#1d1d1f]', statusClass: 'bg-green-50 text-green-600', statusText: '正常' }
])

const alarmFeed = computed(() => alarms.value.slice(0, 20))

const formatTime = (t) => {
  if (!t) return '--'
  try { return t.replace('T', ' ').split('.')[0] } catch (e) { return t }
}

const fetchSensors = async () => {
  try {
    const res = await sensorApi.latest()
    const rows = Array.isArray(res) ? res : (res.data || [])
    if (!rows.length) return
    const avg = (keys) => {
      let sum = 0, count = 0
      rows.forEach(row => {
        for (const k of keys) { const v = Number(row[k]); if (!Number.isNaN(v)) { sum += v; count++; break } }
      })
      return count ? (sum / count).toFixed(1) : '--'
    }
    const temp = avg(['temperature', 'temp'])
    const hum = avg(['humidity'])
    const smoke = avg(['smoke', 'smokePpm', 'smoke_ppm'])
    const light = avg(['light', 'illumination', 'lux'])
    sensors[0].value = temp; sensors[0].colorClass = Number(temp) > 28 ? 'text-red-500' : 'text-[#1d1d1f]'
    sensors[0].statusClass = Number(temp) > 28 ? 'bg-red-50 text-red-600' : 'bg-green-50 text-green-600'
    sensors[0].statusText = Number(temp) > 28 ? '异常' : '正常'
    sensors[1].value = hum
    sensors[2].value = smoke; sensors[2].statusClass = Number(smoke) > 100 ? 'bg-red-50 text-red-600' : 'bg-green-50 text-green-600'
    sensors[2].statusText = Number(smoke) > 100 ? '异常' : '正常'
    sensors[3].value = light
  } catch (e) {}
}

const fetchStats = async () => {
  const online = devices.value.filter(d => d.status === 1 || d.status === '在线' || d.status === '1').length
  statCards[0].value = alarms.value.length
  statCards[1].value = online
  statCards[2].value = workOrders.value.length
  try {
    const res = await alarmApi.statistics()
    statCards[0].value = res?.today || alarms.value.length
  } catch (e) {}
  try {
    const res = await faceApi.list({ page: 1, size: 1 })
    const total = res?.total || res?.data?.total || 0
    statCards[3].value = total
  } catch (e) { statCards[3].value = 0 }
}

fetchSensors()
fetchStats()
</script>