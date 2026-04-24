import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import * as api from '../services/api'

export const useAppStore = defineStore('app', () => {
  const isLoggedIn = ref(false)
  const currentUser = ref(null)
  const activeTab = ref('DEVICE')
  const activeSubTab = ref('OVERVIEW')
  const selectedRegion = ref('ALL')
  const opsSubTab = ref('OVERVIEW')
  const authMode = ref('LOGIN')

  const menus = ref([
    { id: 'DEVICE', name: '设备管控', hasSub: true, subs: [{id: 'ALL', name: '全部区域'}, {id: 'A区', name: 'A区设备'}, {id: 'B区', name: 'B区设备'}] },
    { id: 'DASH', name: '环境监控', hasSub: false },
    { id: 'VISION', name: '视觉神经', hasSub: false },
    { id: 'ALARM', name: '事件与工单', hasSub: true, subs: [{id: 'OVERVIEW', name: '总览看板'}, {id: 'ALARM_LIST', name: '异常告警'}, {id: 'ACCESS_LOG', name: '通行日志'}, {id: 'WORK_ORDER', name: '维保工单'}] },
    { id: 'OPS', name: '综合管理', hasSub: true, subs: [{ id: 'OVERVIEW', name: '数据概览' }, { id: 'RULE_LIST', name: '策略列表' }, { id: 'DEVICE_LEDGER', name: '设备台账' }] },
    { id: 'AI', name: '智能助理', hasSub: false }
  ])

  const selectMenu = (mainId) => {
    activeTab.value = mainId
    if (mainId === 'DEVICE') selectedRegion.value = 'ALL'
    if (mainId === 'ALARM') activeSubTab.value = 'OVERVIEW'
    if (mainId === 'OPS') opsSubTab.value = 'OVERVIEW'
  }

  const selectSubMenu = (mainId, subId) => {
    activeTab.value = mainId
    if (mainId === 'DEVICE') selectedRegion.value = subId
    if (mainId === 'ALARM') activeSubTab.value = subId
    if (mainId === 'OPS') opsSubTab.value = subId
  }

  const login = (user) => {
    currentUser.value = user
    isLoggedIn.value = true
  }

  const logout = () => {
    isLoggedIn.value = false
    currentUser.value = null
  }

  return {
    isLoggedIn, currentUser, activeTab, activeSubTab, selectedRegion, opsSubTab, authMode, menus,
    selectMenu, selectSubMenu, login, logout
  }
})