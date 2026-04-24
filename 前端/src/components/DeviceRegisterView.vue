<template>
  <div class="apple-card p-10 max-w-3xl mx-auto">
    <div class="mb-8 border-b border-gray-100 pb-4">
      <h3 class="text-2xl font-semibold text-[#1d1d1f]">新设备资产入库</h3>
      <p class="text-sm text-gray-500 mt-1">将新的硬件节点注册至数字孪生中枢</p>
    </div>
    <div class="space-y-6">
      <div class="flex items-center gap-6">
        <label class="w-24 text-right text-sm font-semibold text-gray-700 shrink-0">设备 ID <span class="text-red-500">*</span></label>
        <input v-model="form.deviceId" class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-sm focus:outline-none focus:bg-white focus:border-[#0071e3] transition-all" placeholder="例：M-GW-001">
      </div>
      <div class="flex items-center gap-6">
        <label class="w-24 text-right text-sm font-semibold text-gray-700 shrink-0">设备名称 <span class="text-red-500">*</span></label>
        <input v-model="form.name" class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-sm focus:outline-none focus:bg-white focus:border-[#0071e3] transition-all" placeholder="请输入直观的设备名称">
      </div>
      <div class="flex items-center gap-6">
        <label class="w-24 text-right text-sm font-semibold text-gray-700 shrink-0">部署展厅</label>
        <input v-model="form.region" class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-sm focus:outline-none focus:bg-white focus:border-[#0071e3] transition-all" placeholder="例如：A区 / B区">
      </div>
      <div class="flex items-center gap-6">
        <label class="w-24 text-right text-sm font-semibold text-gray-700 shrink-0">部署位置</label>
        <input v-model="form.location" class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-sm focus:outline-none focus:bg-white focus:border-[#0071e3] transition-all" placeholder="例如：一层大厅东侧展柜">
      </div>
      <div class="pt-6 border-t border-gray-100 flex justify-end gap-3 mt-8">
        <button @click="reset" class="bg-white border border-gray-200 text-gray-700 hover:bg-gray-50 rounded-full px-8 py-3 text-sm font-semibold shadow-sm transition">清空表单</button>
        <button @click="submit" class="bg-[#1d1d1f] hover:bg-black text-white rounded-full px-8 py-3 text-sm font-semibold shadow-md transition">立即注册绑定</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { reactive } from 'vue'
import { useAppStore } from '../../stores/app'
import { useToastStore } from '../../stores/toast'
import { deviceApi } from '../../services/api'

const store = useAppStore()
const toast = useToastStore()
const form = reactive({ deviceId: '', name: '', region: '', location: '' })

const reset = () => { form.deviceId = ''; form.name = ''; form.region = ''; form.location = '' }

const submit = async () => {
  if (!form.deviceId.trim()) return toast.showToast('请输入设备ID', 'error')
  if (!form.name.trim()) return toast.showToast('请输入设备名称', 'error')
  try {
    await deviceApi.create({ deviceId: form.deviceId.trim(), name: form.name.trim(), region: form.region.trim(), location: form.location.trim() })
    toast.showToast('注册成功')
    reset()
    store.opsSubTab = 'DEVICE_LEDGER'
  } catch (e) { toast.showToast('注册失败', 'error') }
}
</script>