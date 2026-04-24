<template>
  <div class="h-full flex flex-col relative animate-fade-in bg-[#f5f5f7]">
    <Navbar />
    <main class="flex-1 relative overflow-y-auto no-scrollbar scroll-smooth flex flex-col min-h-0">
      <DeviceView v-if="store.activeTab === 'DEVICE'" />
      <DashboardView v-else-if="store.activeTab === 'DASH'" />
      <VisionView v-else-if="store.activeTab === 'VISION'" />
      <AlarmView v-else-if="store.activeTab === 'ALARM'" />
      <OpsView v-else-if="store.activeTab === 'OPS'" />
      <AIView v-else-if="store.activeTab === 'AI'" />
    </main>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted, provide } from 'vue'
import { useAppStore } from '../stores/app'
import { deviceApi, alarmApi, workOrderApi, faceApi } from '../services/api'
import Navbar from '../components/Navbar.vue'
import DeviceView from './DeviceView.vue'
import DashboardView from './DashboardView.vue'
import VisionView from './VisionView.vue'
import AlarmView from './AlarmView.vue'
import OpsView from './OpsView.vue'
import AIView from './AIView.vue'

const store = useAppStore()

const deviceList = ref([])
const alarms = ref([])
const workOrders = ref([])
const accessLogs = ref([])

provide('deviceList', deviceList)
provide('alarms', alarms)
provide('workOrders', workOrders)
provide('accessLogs', accessLogs)

let dataInterval = null

const fetchAllData = async () => {
  if (!store.isLoggedIn) return
  try {
    const res = await deviceApi.list()
    deviceList.value = res.data?.items || res.data || res || []
  } catch (e) {}
  try {
    const res = await faceApi.accessLogs()
    accessLogs.value = res.data?.items || res.data || res || []
  } catch (e) {}
  try {
    const res = await alarmApi.recent(50)
    const raw = res.data?.items || res.data || res || []
    alarms.value = raw.filter(a => a.handled === 0 || a.handled === false || !a.handled)
  } catch (e) {}
  try {
    const res = await workOrderApi.list({ page: 1, size: 50 })
    const raw = res.data?.items || res.items || res.data || res || []
    workOrders.value = raw.filter(w => w.status !== 'completed' && w.status !== '已完成')
  } catch (e) {}
}
provide('fetchAllData', fetchAllData)

onMounted(() => {
  fetchAllData()
  dataInterval = setInterval(fetchAllData, 5000)
  if (window.lucideIcons) window.lucideIcons.createIcons()
})

onUnmounted(() => {
  clearInterval(dataInterval)
})
</script>