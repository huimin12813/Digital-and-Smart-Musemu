<template>
  <div class="apple-card p-8">
    <div class="flex items-center justify-between mb-8">
      <h3 class="text-2xl font-semibold text-[#1d1d1f] flex items-center gap-2"><LucideIcon name="monitor" class="w-6 h-6 text-[#0071e3]" />全馆资产台账</h3>
      <div class="flex items-center gap-3 bg-gray-50 p-1.5 rounded-2xl border border-gray-100">
        <select v-model="statusFilter" class="bg-white border border-gray-200 rounded-lg px-3 py-1.5 text-sm focus:outline-none focus:border-[#0071e3] w-[120px]">
          <option value="ALL">全部状态</option>
          <option value="ONLINE">仅在线</option>
          <option value="OFFLINE">仅离线</option>
        </select>
        <button @click="store.opsSubTab = 'DEVICE_REGISTER'" class="text-sm font-semibold px-4 py-1.5 bg-[#0071e3] text-white rounded-lg hover:bg-blue-600 transition flex items-center gap-1.5"><LucideIcon name="plus" class="w-4 h-4" />入库</button>
      </div>
    </div>

    <div class="overflow-x-auto border border-gray-100 rounded-[24px]">
      <table class="w-full text-left text-sm whitespace-nowrap">
        <thead>
          <tr class="bg-gray-50 border-b border-gray-100 text-gray-500 text-xs uppercase tracking-wider">
            <th class="px-6 py-4 font-semibold">设备 ID</th>
            <th class="px-6 py-4 font-semibold">名称</th>
            <th class="px-6 py-4 font-semibold">部署区/位置</th>
            <th class="px-6 py-4 font-semibold">通讯状态</th>
            <th class="px-6 py-4 font-semibold">心跳更新时间</th>
            <th class="px-6 py-4 font-semibold">安防布防</th>
            <th class="px-6 py-4 font-semibold">操作</th>
          </tr>
        </thead>
        <tbody class="text-gray-800">
          <tr v-for="dev in filteredList" :key="dev.deviceId || dev.device_id" class="border-b border-gray-50 hover:bg-gray-50/50 transition-colors">
            <td class="px-6 py-4"><span class="bg-gray-100 text-gray-600 px-2 py-1 rounded font-mono text-xs border border-gray-200">{{ dev.deviceId || dev.device_id }}</span></td>
            <td class="px-6 py-4 font-semibold text-[#1d1d1f]">{{ dev.name || '--' }}</td>
            <td class="px-6 py-4 text-gray-500 text-xs"><span class="font-bold text-[#0071e3]">{{ dev.region || '--' }}</span><br/>{{ dev.location || '--' }}</td>
            <td class="px-6 py-4">
              <span class="inline-flex items-center gap-2 text-xs font-bold px-2.5 py-1 rounded-full border"
                    :class="isOnline(dev) ? 'bg-green-50 text-green-600 border-green-100' : 'bg-gray-100 text-gray-500 border-gray-200'">
                <span class="w-1.5 h-1.5 rounded-full" :class="isOnline(dev) ? 'bg-green-500' : 'bg-gray-400'"></span>
                {{ isOnline(dev) ? 'ONLINE' : 'OFFLINE' }}
              </span>
            </td>
            <td class="px-6 py-4 text-xs text-gray-500 font-mono">{{ formatTime(dev.lastHeartbeat || dev.last_heartbeat || dev.update_time || dev.updateTime) }}</td>
            <td class="px-6 py-4"><label class="ios-switch scale-75 origin-left"><input type="checkbox" :checked="dev.armStatus === 1 || dev.arm_status === 1" @change="toggleArm(dev)"><span class="slider"></span></label></td>
            <td class="px-6 py-4"><button @click="editDevice(dev)" class="text-[#0071e3] hover:underline font-medium mr-4">修改</button><button @click="remove(dev)" class="text-red-500 hover:underline font-medium">注销</button></td>
          </tr>
          <tr v-if="filteredList.length === 0"><td colspan="7" class="px-6 py-10 text-center text-gray-400 font-medium">台账内暂无符合条件的设备记录</td></tr>
        </tbody>
      </table>
    </div>

    <div v-if="editingDevice" class="fixed inset-0 z-[1200] bg-black/20 backdrop-blur-sm flex items-center justify-center p-4 transition-all">
      <div class="w-[500px] apple-card overflow-hidden shadow-2xl animate-fade-in">
        <div class="px-8 py-6 border-b border-gray-100 flex items-center justify-between bg-white">
          <h4 class="text-xl font-semibold text-[#1d1d1f]">修改资产信息</h4>
          <button @click="editingDevice = null" class="w-8 h-8 rounded-full bg-gray-50 flex items-center justify-center text-gray-500 hover:bg-gray-100 transition"><LucideIcon name="x" class="w-4 h-4" /></button>
        </div>
        <div class="p-8 space-y-5 bg-gray-50/30">
          <div><label class="block text-xs font-bold text-gray-500 uppercase tracking-wider mb-2">设备名称</label><input v-model="editForm.name" class="w-full bg-white border border-gray-200 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:border-[#0071e3] transition-shadow shadow-sm"></div>
          <div><label class="block text-xs font-bold text-gray-500 uppercase tracking-wider mb-2">部署展区</label><input v-model="editForm.region" class="w-full bg-white border border-gray-200 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:border-[#0071e3] transition-shadow shadow-sm"></div>
          <div><label class="block text-xs font-bold text-gray-500 uppercase tracking-wider mb-2">详细位置</label><input v-model="editForm.location" class="w-full bg-white border border-gray-200 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:border-[#0071e3] transition-shadow shadow-sm"></div>
          <div class="flex justify-end gap-3 pt-4 border-t border-gray-100 mt-6">
            <button @click="editingDevice = null" class="px-6 py-2.5 rounded-full bg-white border border-gray-200 text-sm font-semibold text-gray-700 hover:bg-gray-50 shadow-sm transition">取消</button>
            <button @click="saveEdit" class="px-6 py-2.5 rounded-full bg-[#0071e3] hover:bg-blue-600 text-sm font-semibold text-white shadow-md transition">保存更改</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, computed, inject, onMounted } from 'vue'
import { useAppStore } from '../../stores/app'
import { useToastStore } from '../../stores/toast'
import { deviceApi } from '../../services/api'
import LucideIcon from '../LucideIcon.js'

const store = useAppStore()
const toast = useToastStore()
const devices = inject('deviceList', ref([]))
const fetchData = inject('fetchAllData', async () => {})

const statusFilter = ref('ALL')
const editingDevice = ref(null)
const editForm = reactive({ name: '', region: '', location: '' })

const filteredList = computed(() => {
  if (statusFilter.value === 'ALL') return devices.value
  return devices.value.filter(d => {
    const on = isOnline(d)
    return statusFilter.value === 'ONLINE' ? on : !on
  })
})

const isOnline = (d) => d.status === 1 || d.status === '1' || d.status === '在线'

const formatTime = (t) => { if (!t) return '--'; try { return t.replace('T', ' ').split('.')[0] } catch (e) { return t } }

const toggleArm = async (d) => {
  const did = d.deviceId || d.device_id
  const isArmed = d.armStatus === 1 || d.arm_status === 1
  try {
    if (isArmed) await deviceApi.disarm(did)
    else await deviceApi.arm(did)
    await fetchData()
  } catch (e) { toast.showToast('操作失败', 'error') }
}

const editDevice = (d) => {
  editingDevice.value = d
  editForm.name = d.name || ''
  editForm.region = d.region || ''
  editForm.location = d.location || ''
}

const saveEdit = async () => {
  const did = editingDevice.value.deviceId || editingDevice.value.device_id
  try {
    await deviceApi.update(did, { name: editForm.name, region: editForm.region, location: editForm.location })
    editingDevice.value = null
    await fetchData()
    toast.showToast('设备信息已更新')
  } catch (e) { toast.showToast('更新失败', 'error') }
}

const remove = async (d) => {
  const did = d.deviceId || d.device_id
  if (!confirm(`确认注销设备 ${d.name || did} 吗？`)) return
  try {
    await deviceApi.delete(did)
    await fetchData()
    toast.showToast('设备已注销')
  } catch (e) { toast.showToast('删除失败', 'error') }
}
</script>