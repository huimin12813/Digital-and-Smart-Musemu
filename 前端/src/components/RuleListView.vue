<template>
  <div class="apple-card p-8">
    <div class="flex items-center justify-between mb-8">
      <h3 class="text-2xl font-semibold text-[#1d1d1f]">告警与联动规则列表</h3>
      <button @click="createRule" class="bg-[#0071e3] hover:bg-[#0077ED] text-white px-5 py-2.5 rounded-full text-sm font-semibold transition shadow-sm flex items-center gap-2"><LucideIcon name="plus" class="w-4 h-4" />创建新规则</button>
    </div>
    <div class="overflow-x-auto border border-gray-100 rounded-[24px]">
      <table class="w-full text-left text-sm whitespace-nowrap">
        <thead>
          <tr class="bg-gray-50 border-b border-gray-100 text-gray-500 text-xs uppercase tracking-wider">
            <th class="px-6 py-4 font-semibold">规则名称</th>
            <th class="px-6 py-4 font-semibold">条件表达式</th>
            <th class="px-6 py-4 font-semibold">告警级别</th>
            <th class="px-6 py-4 font-semibold">动作类型</th>
            <th class="px-6 py-4 font-semibold">启用状态</th>
            <th class="px-6 py-4 font-semibold">操作</th>
          </tr>
        </thead>
        <tbody class="text-gray-800">
          <tr v-if="loading"><td colspan="6" class="px-6 py-8 text-center text-gray-400 font-medium">规则加载中...</td></tr>
          <tr v-for="rule in rules" :key="rule.id" class="border-b border-gray-50 hover:bg-gray-50/50 transition-colors">
            <td class="px-6 py-4 font-medium">{{ rule.name }}</td>
            <td class="px-6 py-4"><span class="bg-gray-100 text-gray-600 rounded px-2 py-1 font-mono text-xs border border-gray-200">{{ rule.conditionExpression || '--' }}</span></td>
            <td class="px-6 py-4"><span class="text-xs font-bold px-3 py-1 rounded-full" :class="rule.level === 'critical' ? 'bg-red-50 text-red-600 border border-red-100' : 'bg-amber-50 text-amber-600 border border-amber-100'">{{ rule.level === 'critical' ? '紧急' : '警告' }}</span></td>
            <td class="px-6 py-4"><span class="text-xs font-bold px-3 py-1 bg-blue-50 text-blue-600 border border-blue-100 rounded-full">{{ (rule.actionType || 'MQTT').toUpperCase() }}</span></td>
            <td class="px-6 py-4"><label class="ios-switch scale-75 origin-left"><input type="checkbox" :checked="rule.enabled" @change="toggleRule(rule)"><span class="slider"></span></label></td>
            <td class="px-6 py-4"><button @click="editRule(rule)" class="text-[#0071e3] hover:underline font-medium mr-4">编辑</button><button @click="removeRule(rule)" class="text-red-500 hover:underline font-medium">删除</button></td>
          </tr>
          <tr v-if="!loading && rules.length === 0"><td colspan="6" class="px-6 py-8 text-center text-gray-400 font-medium">暂无规则</td></tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script setup>
import { ref, inject, onMounted } from 'vue'
import { useAppStore } from '../../stores/app'
import { useToastStore } from '../../stores/toast'
import { ruleApi } from '../../services/api'
import LucideIcon from '../LucideIcon.js'

const store = useAppStore()
const toast = useToastStore()
const rules = ref([])
const loading = ref(false)

const fetchRules = async () => {
  loading.value = true
  try {
    const res = await ruleApi.list()
    rules.value = Array.isArray(res) ? res : (res.data?.items || res.data || [])
  } catch (e) { toast.showToast('规则列表获取失败', 'error') }
  finally { loading.value = false }
}

const createRule = () => { store.opsSubTab = 'RULE_FORM'; store.editingRuleId = null }
const editRule = (rule) => { store.editingRuleId = rule.id; store.opsSubTab = 'RULE_FORM' }

const removeRule = async (rule) => {
  if (!confirm(`确认删除规则「${rule.name}」吗？`)) return
  try {
    await ruleApi.delete(rule.id)
    rules.value = rules.value.filter(r => r.id !== rule.id)
    toast.showToast('规则已删除')
  } catch (e) { toast.showToast('删除失败', 'error') }
}

const toggleRule = async (rule) => {
  try {
    const next = !rule.enabled
    await ruleApi.toggle(rule.id, next ? 1 : 0)
    rule.enabled = next
    toast.showToast(next ? '规则已启用' : '规则已禁用')
  } catch (e) { toast.showToast('切换失败', 'error') }
}

onMounted(fetchRules)
</script>