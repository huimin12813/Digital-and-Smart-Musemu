<template>
  <div :key="'ops-'+store.opsSubTab" class="max-w-[1400px] mx-auto px-8 pt-12 pb-24 animate-fade-in w-full">
    <header class="flex justify-between items-end mb-10">
      <div class="flex items-center gap-5">
        <button v-if="store.opsSubTab !== 'OVERVIEW'" @click="goBack" class="w-10 h-10 rounded-full bg-white border border-gray-200 hover:bg-gray-50 flex items-center justify-center transition shadow-sm text-gray-600">
          <LucideIcon name="chevron-left" class="w-5 h-5" />
        </button>
        <div>
          <h2 class="text-4xl font-semibold tracking-tight text-[#1d1d1f]">智慧博物馆管控系统</h2>
          <p class="text-gray-500 mt-2 text-sm uppercase tracking-widest font-semibold opacity-70">{{ opsPageTitle }}</p>
        </div>
      </div>
      <div class="text-right">
        <div class="text-xl font-bold text-[#1d1d1f]">{{ formatTime(now) }}</div>
        <div class="text-xs text-gray-400 mt-1 uppercase tracking-widest">系统管理员 · 管理中枢</div>
      </div>
    </header>

    <OpsOverview v-if="store.opsSubTab === 'OVERVIEW'" />
    <RuleListView v-else-if="store.opsSubTab === 'RULE_LIST'" />
    <RuleFormView v-else-if="store.opsSubTab === 'RULE_FORM'" />
    <FaceArchiveView v-else-if="store.opsSubTab === 'FACE_ARCHIVE'" />
    <DeviceRegisterView v-else-if="store.opsSubTab === 'DEVICE_REGISTER'" />
    <DeviceLedgerView v-else-if="store.opsSubTab === 'DEVICE_LEDGER'" />
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useAppStore } from '../stores/app'
import LucideIcon from '../components/LucideIcon.js'
import OpsOverview from '../components/OpsOverview.vue'
import RuleListView from '../components/RuleListView.vue'
import RuleFormView from '../components/RuleFormView.vue'
import FaceArchiveView from '../components/FaceArchiveView.vue'
import DeviceRegisterView from '../components/DeviceRegisterView.vue'
import DeviceLedgerView from '../components/DeviceLedgerView.vue'

const store = useAppStore()
const now = ref(new Date().toISOString())
setInterval(() => { now.value = new Date().toISOString() }, 1000)

const opsPageTitle = computed(() => {
  const map = {
    OVERVIEW: '数据管控中心',
    RULE_LIST: '策略配置中心',
    RULE_FORM: store.editingRuleId ? '编辑联动策略' : '新建联动策略',
    FACE_ARCHIVE: '生物识别与档案管理',
    DEVICE_REGISTER: '新硬件节点注册入网',
    DEVICE_LEDGER: '数字资产台账管理'
  }
  return map[store.opsSubTab] || '综合管理'
})

const formatTime = (t) => {
  if (!t) return '--'
  try { return t.replace('T', ' ').split('.')[0] } catch (e) { return t }
}

const goBack = () => {
  const map = { RULE_FORM: 'RULE_LIST', DEVICE_REGISTER: 'DEVICE_LEDGER' }
  store.opsSubTab = map[store.opsSubTab] || 'OVERVIEW'
}
</script>