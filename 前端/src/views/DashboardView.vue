<template>
  <div class="max-w-7xl mx-auto px-8 pt-12 pb-24 animate-fade-in w-full">
    <h2 class="text-4xl font-semibold tracking-tight mb-10">环境监控</h2>
    <div class="grid grid-cols-4 gap-6 mb-10">
      <div v-for="s in sensorStats" :key="s.label" class="apple-card p-6 flex flex-col justify-between h-32">
        <div class="flex justify-between items-center text-gray-500">
          <span class="text-xs font-semibold">{{ s.label }}</span>
          <LucideIcon :name="s.icon" class="w-5 h-5" />
        </div>
        <p class="text-4xl font-semibold">{{ s.value }}<span class="text-lg text-gray-400 ml-1">{{ s.unit }}</span></p>
      </div>
    </div>
    <div class="apple-card p-10 h-[500px] flex flex-col">
      <div class="flex justify-between items-center mb-6">
        <h3 class="text-xl font-semibold text-[#1d1d1f]">24H 趋势感知</h3>
        <div class="flex bg-gray-100 p-1 rounded-full text-xs font-medium">
          <button v-for="opt in ['temperature', 'humidity', 'light', 'smoke']" :key="opt"
                  @click="chartField = opt; updateChartData()"
                  :class="chartField === opt ? 'bg-white shadow-sm text-black' : 'text-gray-500 hover:text-black'"
                  class="px-4 py-1.5 rounded-full transition-all">
            {{ opt === 'temperature' ? '温度' : (opt === 'humidity' ? '湿度' : (opt === 'light' ? '光照' : '烟雾')) }}
          </button>
        </div>
      </div>
      <div ref="chartRef" class="flex-1 w-full min-h-[300px]"></div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted, onUnmounted, nextTick } from 'vue'
import * as echarts from 'echarts'
import { sensorApi } from '../services/api'
import LucideIcon from '../components/LucideIcon.js'

const chartRef = ref(null)
const chartField = ref('temperature')
let myChart = null

const sensorStats = reactive([
  { label: '温度', value: '--', unit: '℃', icon: 'thermometer' },
  { label: '湿度', value: '--', unit: '%', icon: 'droplets' },
  { label: '光照', value: '--', unit: 'lx', icon: 'sun' },
  { label: '烟雾', value: '--', unit: 'ppm', icon: 'cloud' }
])

const updateChartData = async () => {
  if (!myChart) return
  const lineName = { temperature: '环境温度', humidity: '空气湿度', light: '光照强度', smoke: '烟雾浓度' }[chartField.value]
  const lineUnit = { temperature: '℃', humidity: '%', light: 'lx', smoke: 'ppm' }[chartField.value]

  const now = new Date()
  const labels = Array.from({ length: 24 }, (_, i) => {
    const d = new Date(now.getTime() - (23 - i) * 60 * 60 * 1000)
    return String(d.getHours()).padStart(2, '0') + ':00'
  })

  myChart.setOption({
    tooltip: { trigger: 'axis', backgroundColor: '#fff', textStyle: { color: '#1d1d1f' }, borderRadius: 12 },
    grid: { left: '2%', right: '4%', bottom: '0%', top: '15%', containLabel: true },
    xAxis: { type: 'category', data: labels, axisLabel: { color: '#86868b' }, axisLine: { lineStyle: { color: '#e5e5ea' } }, axisTick: { show: false } },
    yAxis: { type: 'value', splitLine: { lineStyle: { color: '#f2f2f7' } }, axisLabel: { color: '#86868b' }, scale: true },
    series: [{
      name: lineName, data: new Array(24).fill(0), type: 'line', smooth: true, symbolSize: 8, connectNulls: true,
      lineStyle: { width: 4, color: '#0071e3' },
      itemStyle: { color: '#0071e3', borderWidth: 2, borderColor: '#fff' },
      areaStyle: { color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{ offset: 0, color: 'rgba(0,113,227,0.15)' }, { offset: 1, color: 'rgba(0,113,227,0)' }]) }
    }]
  }, true)
}

const fetchSensorData = async () => {
  try {
    const res = await sensorApi.latest()
    const rows = Array.isArray(res) ? res : (res.data || [])
    if (rows.length === 0) return
    const avg = (keys) => {
      let sum = 0, count = 0
      rows.forEach(row => {
        for (const key of keys) {
          const val = Number(row[key])
          if (!Number.isNaN(val)) { sum += val; count++; break }
        }
      })
      return count ? (sum / count).toFixed(1) : '--'
    }
    sensorStats[0].value = avg(['temperature', 'temp'])
    sensorStats[1].value = avg(['humidity'])
    sensorStats[2].value = avg(['light', 'illumination', 'lux'])
    sensorStats[3].value = avg(['smoke', 'smokePpm', 'smoke_ppm'])
  } catch (e) {}
}

onMounted(async () => {
  await nextTick()
  if (chartRef.value) {
    myChart = echarts.init(chartRef.value)
    updateChartData()
    window.addEventListener('resize', () => myChart?.resize())
  }
  fetchSensorData()
})

onUnmounted(() => {
  myChart?.dispose()
  window.removeEventListener('resize', () => {})
})
</script>