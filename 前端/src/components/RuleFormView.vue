<template>
  <div class="apple-card p-10 max-w-4xl mx-auto">
    <div class="mb-8 border-b border-gray-100 pb-4">
      <h3 class="text-2xl font-semibold text-[#1d1d1f]">{{ editingRuleId ? '编辑联动规则' : '创建新联动规则' }}</h3>
    </div>
    <div class="space-y-6">
      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-2">规则名称 <span class="text-red-500">*</span></label>
        <input v-model="form.name" class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-sm focus:outline-none focus:bg-white focus:border-[#0071e3] transition-all" placeholder="例如：一号展柜高温排风联动">
      </div>
      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-2">条件构造器</label>
        <div class="bg-blue-50/50 border border-blue-100 rounded-xl p-5 flex items-center gap-3 flex-wrap">
          <select v-model="builder.sensor" class="bg-white border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:outline-none focus:border-[#0071e3] min-w-[140px]">
            <option value="temperature">temperature (温度)</option>
            <option value="humidity">humidity (湿度)</option>
            <option value="smoke">smoke (烟雾)</option>
            <option value="light">light (光照)</option>
          </select>
          <select v-model="builder.operator" class="bg-white border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:outline-none focus:border-[#0071e3] w-[80px]">
            <option value=">">&gt;</option>
            <option value="<">&lt;</option>
            <option value="==">==</option>
          </select>
          <input v-model.number="builder.threshold" type="number" class="bg-white border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:outline-none focus:border-[#0071e3] w-[120px]">
          <button @click="generateExpr" class="bg-[#0071e3] text-white px-4 py-2.5 rounded-lg text-sm font-semibold shadow-sm hover:bg-blue-600 transition">生成表达式</button>
        </div>
      </div>
      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-2">逻辑表达式 <span class="text-red-500">*</span></label>
        <input v-model="form.conditionExpression" class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-sm focus:outline-none focus:bg-white focus:border-[#0071e3] transition-all font-mono" placeholder="点击上方按钮自动生成，或手工输入">
      </div>
      <div class="grid grid-cols-2 gap-6">
        <div>
          <label class="block text-sm font-semibold text-gray-700 mb-2">告警级别</label>
          <div class="flex items-center gap-4">
            <label class="flex items-center gap-2 cursor-pointer border border-gray-200 rounded-xl px-4 py-3 bg-white hover:bg-gray-50 flex-1"><input type="radio" value="warning" v-model="form.level" class="accent-[#0071e3]"><span class="text-sm font-medium text-amber-600">警告 (Warning)</span></label>
            <label class="flex items-center gap-2 cursor-pointer border border-gray-200 rounded-xl px-4 py-3 bg-white hover:bg-gray-50 flex-1"><input type="radio" value="critical" v-model="form.level" class="accent-[#0071e3]"><span class="text-sm font-medium text-red-600">紧急 (Critical)</span></label>
          </div>
        </div>
        <div>
          <label class="block text-sm font-semibold text-gray-700 mb-2">联动动作 <span class="text-red-500">*</span></label>
          <select v-model="form.actionType" class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-sm focus:outline-none focus:bg-white focus:border-[#0071e3] transition-all">
            <option value="MQTT">MQTT指令（控制硬件）</option>
            <option value="WS_PUSH">WS推送（实时告警）</option>
            <option value="WORKORDER">创建工单</option>
          </select>
        </div>
      </div>
      <div>
        <label class="block text-sm font-semibold text-gray-700 mb-2">响应参数 (JSON)</label>
        <textarea v-model="form.responseParams" rows="5" class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-sm font-mono focus:outline-none focus:bg-white focus:border-[#0071e3] transition-all"></textarea>
      </div>
      <div class="pt-6 border-t border-gray-100 flex justify-end gap-3">
        <button @click="cancel" class="bg-white border border-gray-200 text-gray-700 hover:bg-gray-50 rounded-full px-8 py-3 text-sm font-semibold shadow-sm transition">取消</button>
        <button @click="save" class="bg-[#1d1d1f] hover:bg-black text-white rounded-full px-8 py-3 text-sm font-semibold shadow-md transition">保存规则</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, computed, onMounted } from 'vue'
import { useAppStore } from '../../stores/app'
import { useToastStore } from '../../stores/toast'
import { ruleApi } from '../../services/api'

const store = useAppStore()
const toast = useToastStore()
const editingRuleId = computed(() => store.editingRuleId)

const form = reactive({
  name: '', conditionExpression: '', level: 'warning', actionType: 'MQTT', responseParams: '{}', enabled: true
})
const builder = reactive({ sensor: 'smoke', operator: '>', threshold: 100 })

const generateExpr = () => { form.conditionExpression = `${builder.sensor} ${builder.operator} ${builder.threshold}` }

const cancel = () => { store.opsSubTab = 'RULE_LIST' }

const save = async () => {
  if (!form.name.trim()) return toast.showToast('请输入规则名称', 'error')
  if (!form.conditionExpression.trim()) return toast.showToast('请先生成或填写逻辑表达式', 'error')
  let parsed = {}
  try { parsed = JSON.parse(form.responseParams || '{}') } catch (e) { return toast.showToast('响应参数不是合法 JSON', 'error') }
  
  const payload = {
    name: form.name.trim(), ruleName: form.name.trim(),
    conditionExpression: form.conditionExpression.trim(), expression: form.conditionExpression.trim(),
    level: form.level, alarmLevel: form.level,
    actionType: form.actionType, action: form.actionType,
    responseParams: parsed, params: parsed,
    enabled: form.enabled ? 1 : 0
  }

  try {
    if (editingRuleId.value) {
      await ruleApi.update(editingRuleId.value, payload)
      toast.showToast('规则修改成功')
    } else {
      await ruleApi.create(payload)
      toast.showToast('规则创建成功')
    }
    store.opsSubTab = 'RULE_LIST'
  } catch (e) { toast.showToast('规则保存失败', 'error') }
}

onMounted(async () => {
  if (editingRuleId.value) {
    try {
      const res = await ruleApi.get(editingRuleId.value)
      const r = res.data || res
      form.name = r.name || ''
      form.conditionExpression = r.conditionExpression || r.expression || ''
      form.level = String(r.level || '').toLowerCase().includes('critical') ? 'critical' : 'warning'
      form.actionType = String(r.actionType || 'MQTT').toUpperCase()
      form.responseParams = JSON.stringify(r.responseParams || r.params || {}, null, 2)
    } catch (e) {}
  }
})
</script>