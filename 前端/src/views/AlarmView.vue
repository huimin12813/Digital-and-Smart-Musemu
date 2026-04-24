<template>
  <div :key="'alarm-'+store.activeSubTab" class="max-w-6xl mx-auto px-8 pt-12 pb-24 animate-fade-in w-full">
    <header class="mb-10"><h2 class="text-4xl font-semibold tracking-tight">{{ alarmTitle }}</h2></header>

    <div v-if="store.activeSubTab === 'OVERVIEW'" class="grid grid-cols-2 gap-8">
      <div class="flex flex-col gap-8">
        <div>
          <div class="flex justify-between items-center mb-4">
            <h3 class="text-xl font-semibold">异常告警</h3>
            <div @click="store.selectSubMenu('ALARM', 'ALARM_LIST')" class="text-xs text-[#0071e3] hover:underline cursor-pointer font-medium">查看全部 &rarr;</div>
          </div>
          <div class="apple-card p-2 min-h-[200px]">
            <div v-if="alarms.length === 0" class="p-8 text-center text-gray-400 text-sm font-medium">系统运行状态良好</div>
            <div v-for="a in alarms.slice(0, 4)" :key="a.id" class="flex items-center justify-between p-4 px-6 border-b border-gray-50 last:border-0 group">
              <div class="flex items-center gap-4 flex-1 min-w-0">
                <div :class="a.level === 'critical' ? 'bg-[#ff453a]' : 'bg-[#ff9f0a]'" class="w-2 h-2 rounded-full shrink-0"></div>
                <div class="flex-1 min-w-0 pr-2">
                  <p class="text-sm font-semibold truncate">{{ a.content || a.message || '未知告警' }}</p>
                  <p class="text-[11px] text-gray-400 mt-0.5 truncate">Device: {{ a.device_id || a.deviceId }} · {{ formatTime(a.create_time || a.createTime) }}</p>
                </div>
              </div>
              <button @click="handleAlarm(a)" class="opacity-0 group-hover:opacity-100 px-3 py-1.5 bg-[#34c759] text-white text-[11px] font-semibold rounded-full transition-all shrink-0">处理</button>
            </div>
          </div>
        </div>
        <div>
          <div class="flex justify-between items-center mb-4">
            <h3 class="text-xl font-semibold">维保工单</h3>
            <div @click="store.selectSubMenu('ALARM', 'WORK_ORDER')" class="text-xs text-[#0071e3] hover:underline cursor-pointer font-medium">全部任务 &rarr;</div>
          </div>
          <div class="apple-card p-2 min-h-[200px]">
            <div v-if="workOrders.length === 0" class="p-8 text-center text-gray-400 text-sm font-medium">暂无待办工单</div>
            <div v-for="w in workOrders.slice(0, 3)" :key="w.id" class="flex items-center justify-between p-4 px-6 border-b border-gray-50 last:border-0 group">
              <div class="flex-1 min-w-0 pr-2">
                <p class="text-sm font-semibold truncate">{{ w.title || w.order_name || '工单任务' }}</p>
                <p class="text-[11px] text-gray-400 mt-0.5">指派: {{ w.assignee || w.person || '未指定' }}</p>
              </div>
              <span class="text-[10px] font-semibold px-2 py-1 bg-gray-100 text-gray-500 rounded uppercase shrink-0">{{ w.status || '待处理' }}</span>
            </div>
          </div>
        </div>
      </div>
      <div>
        <div class="flex justify-between items-center mb-4">
          <h3 class="text-xl font-semibold">通行日志</h3>
          <div @click="store.selectSubMenu('ALARM', 'ACCESS_LOG')" class="text-xs text-[#0071e3] hover:underline cursor-pointer font-medium">查看档案 &rarr;</div>
        </div>
        <div class="apple-card p-2 min-h-[500px]">
          <div v-if="accessLogs.length === 0" class="p-8 text-center text-gray-400 text-sm font-medium">暂无通行记录</div>
          <div v-for="log in accessLogs.slice(0, 8)" :key="log.id" class="flex items-center justify-between p-4 px-6 border-b border-gray-50 last:border-0">
            <div class="flex gap-4 items-center flex-1 min-w-0">
              <div class="w-10 h-10 rounded-full flex items-center justify-center text-lg bg-gray-100 shrink-0">{{ log.granted ? '✅' : '🚫' }}</div>
              <div class="flex-1 min-w-0 pr-2">
                <p class="text-sm font-semibold truncate">{{ log.personName || log.person_name }}</p>
                <p class="text-[11px] mt-0.5 truncate" :class="log.granted ? 'text-gray-400' : 'text-red-400'">{{ log.reason }}</p>
              </div>
            </div>
            <span class="text-[10px] text-gray-400 shrink-0">{{ formatTime(log.access_time || log.accessTime) }}</span>
          </div>
        </div>
      </div>
    </div>

    <div v-if="store.activeSubTab === 'ALARM_LIST'" class="apple-card p-6 min-h-[600px]">
      <div class="flex justify-between items-center mb-6">
        <h3 class="text-lg font-semibold">异常告警记录</h3>
        <span class="text-sm font-medium text-[#0071e3] bg-[#0071e3]/10 px-3 py-1 rounded-full">{{ alarms.length }} 条异常</span>
      </div>
      <div v-for="a in alarms" :key="a.id" class="flex items-center justify-between p-5 border-b border-gray-100 hover:bg-gray-50 transition-colors">
        <div class="flex items-center gap-4 flex-1 min-w-0">
          <div :class="a.level === 'critical' ? 'bg-[#ff453a]' : 'bg-[#ff9f0a]'" class="w-3 h-3 rounded-full shadow-sm shrink-0"></div>
          <div class="flex-1 min-w-0 pr-4">
            <p class="text-base font-semibold truncate">{{ a.content || a.message || '未知告警' }}</p>
            <p class="text-xs text-gray-400 mt-1">关联设备: {{ a.device_id || a.deviceId }} | 触发时间: {{ formatTime(a.create_time || a.createTime) }}</p>
          </div>
        </div>
        <button @click="handleAlarm(a)" class="px-5 py-2 bg-[#34c759] text-white text-xs font-semibold rounded-full shadow-sm shrink-0">标记解决</button>
      </div>
    </div>

    <div v-if="store.activeSubTab === 'ACCESS_LOG'" class="apple-card p-6 min-h-[600px]">
      <div class="flex justify-between items-center mb-6">
        <h3 class="text-lg font-semibold">通行档案</h3>
        <span class="text-sm font-medium text-[#0071e3] bg-[#0071e3]/10 px-3 py-1 rounded-full">最新 {{ accessLogs.length }} 笔记录</span>
      </div>
      <div v-for="log in accessLogs" :key="log.id" class="flex items-center justify-between p-5 border-b border-gray-100 hover:bg-gray-50/80 transition-colors">
        <div class="flex gap-5 items-center flex-1 min-w-0">
          <div class="w-12 h-12 rounded-full flex items-center justify-center text-2xl bg-white border border-gray-100 shadow-sm shrink-0">{{ log.granted ? '✅' : '🚫' }}</div>
          <div class="flex-1 min-w-0 pr-4">
            <p class="text-base font-semibold truncate">{{ log.personName || log.person_name }} <span class="text-[10px] text-gray-500 font-semibold uppercase tracking-wider ml-2 px-2 py-0.5 bg-gray-200 rounded">{{ log.role }}</span></p>
            <p class="text-xs mt-1 truncate" :class="log.granted ? 'text-gray-500' : 'text-red-500 font-medium'">系统判定: {{ log.reason }}</p>
          </div>
        </div>
        <div class="text-right shrink-0"><p class="text-sm font-medium text-gray-800">{{ formatTime(log.access_time || log.accessTime) }}</p></div>
      </div>
    </div>

    <div v-if="store.activeSubTab === 'WORK_ORDER'" class="apple-card p-6 min-h-[600px]">
      <div class="flex justify-between items-center mb-6">
        <h3 class="text-lg font-semibold">工单管理</h3>
        <span class="text-sm font-medium text-[#0071e3] bg-[#0071e3]/10 px-3 py-1 rounded-full">{{ workOrders.length }} 个任务</span>
      </div>
      <div v-for="w in workOrders" :key="w.id" class="flex items-center justify-between p-5 border-b border-gray-100 hover:bg-gray-50/80 transition-colors">
        <div class="flex-1 min-w-0 pr-4">
          <p class="text-base font-semibold truncate">{{ w.title || w.order_name || '工单任务' }}</p>
          <p class="text-xs text-gray-400 mt-1">处理人: <span class="font-medium text-gray-600">{{ w.assignee || w.person || '未指派' }}</span></p>
        </div>
        <div class="flex items-center gap-4 shrink-0">
          <span class="text-[11px] font-semibold px-3 py-1 bg-gray-100 text-gray-600 rounded-full uppercase">{{ w.status || '待处理' }}</span>
          <button v-if="w.status !== 'completed'" @click="completeWorkOrder(w)" class="px-5 py-2 bg-[#0071e3] text-white text-xs font-semibold rounded-full shadow-sm">完成归档</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, inject } from 'vue'
import { useAppStore } from '../stores/app'
import { useToastStore } from '../stores/toast'
import { alarmApi, workOrderApi, faceApi } from '../services/api'

const store = useAppStore()
const toast = useToastStore()

const alarms = inject('alarms', ref([]))
const workOrders = inject('workOrders', ref([]))
const accessLogs = inject('accessLogs', ref([]))
const fetchData = inject('fetchAllData', async () => {})

const alarmTitle = computed(() => {
  const map = { OVERVIEW: '事件与工单总览', ALARM_LIST: '异常告警记录', ACCESS_LOG: '通行历史档案', WORK_ORDER: '设施维保工单' }
  return map[store.activeSubTab] || '事件与工单'
})

const formatTime = (timeStr) => {
  if (!timeStr) return '--:--:--'
  try { return timeStr.replace('T', ' ').split('.')[0] } catch (e) { return timeStr }
}

const handleAlarm = async (a) => {
  alarms.value = alarms.value.filter(x => x.id !== a.id)
  toast.showToast('告警已标记处理', 'success')
  try { await alarmApi.handle(a.id, 'Admin') } catch (e) {}
}

const completeWorkOrder = async (w) => {
  workOrders.value = workOrders.value.filter(x => x.id !== w.id)
  toast.showToast('工单已归档', 'success')
  try { await workOrderApi.updateStatus(w.id, 'completed') } catch (e) {}
}
</script>