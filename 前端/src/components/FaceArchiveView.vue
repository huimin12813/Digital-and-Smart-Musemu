<template>
  <div class="apple-card p-8">
    <div class="flex items-center justify-between mb-8">
      <h3 class="text-2xl font-semibold text-[#1d1d1f] flex items-center gap-2"><LucideIcon name="users" class="w-6 h-6 text-[#0071e3]" />人员系统档案</h3>
      <button @click="showModal = true" class="bg-[#0071e3] hover:bg-[#0077ED] text-white px-5 py-2.5 rounded-full text-sm font-semibold transition shadow-sm flex items-center gap-2">+ 新人员录入</button>
    </div>

    <div class="flex items-center gap-3 mb-6 bg-gray-50 p-3 rounded-2xl border border-gray-100">
      <input v-model="search" class="bg-white border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#0071e3] w-[240px]" placeholder="搜索姓名...">
      <select v-model="roleFilter" class="bg-white border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#0071e3] w-[180px]">
        <option value="">全部身份</option>
        <option value="admin">管理员 (Admin)</option>
        <option value="staff">工作人员 (Staff)</option>
        <option value="visitor">访客 (Visitor)</option>
      </select>
      <button @click="load(1)" class="bg-[#1d1d1f] text-white px-5 py-2 rounded-lg text-sm font-semibold hover:bg-black transition shadow-sm flex items-center gap-2"><LucideIcon name="search" class="w-4 h-4" /> 查询</button>
    </div>

    <div class="overflow-x-auto border border-gray-100 rounded-[24px]">
      <table class="w-full text-left text-sm whitespace-nowrap">
        <thead>
          <tr class="bg-gray-50 border-b border-gray-100 text-gray-500 text-xs uppercase tracking-wider">
            <th class="px-6 py-4 font-semibold w-[220px]">ID</th>
            <th class="px-6 py-4 font-semibold">姓名 (Name)</th>
            <th class="px-6 py-4 font-semibold">系统角色 (Role)</th>
            <th class="px-6 py-4 font-semibold">附加信息</th>
            <th class="px-6 py-4 font-semibold">注册时间</th>
            <th class="px-6 py-4 font-semibold w-[120px]">操作</th>
          </tr>
        </thead>
        <tbody class="text-gray-800">
          <tr v-if="loading"><td colspan="6" class="px-6 py-8 text-center text-gray-400 font-medium">数据加载中...</td></tr>
          <tr v-for="f in filteredList" :key="f.id" class="border-b border-gray-50 hover:bg-gray-50/50 transition-colors">
            <td class="px-6 py-4 font-mono text-xs text-gray-500">{{ f.id }}</td>
            <td class="px-6 py-4 font-semibold text-[#1d1d1f]">{{ f.name }}</td>
            <td class="px-6 py-4"><span class="text-[11px] font-bold px-3 py-1 rounded-full border" :class="f.role === 'staff' ? 'bg-blue-50 text-blue-600 border-blue-100' : (f.role === 'admin' ? 'bg-purple-50 text-purple-600 border-purple-100' : 'bg-gray-100 text-gray-600 border-gray-200')">{{ f.role === 'staff' ? '工作人员' : (f.role === 'admin' ? 'Admin' : '普通访客') }}</span></td>
            <td class="px-6 py-4 font-mono text-xs text-gray-400 truncate max-w-[200px]">{{ f.metadata ? JSON.stringify(f.metadata) : '--' }}</td>
            <td class="px-6 py-4 text-xs text-gray-500">{{ formatTime(f.createTime) }}</td>
            <td class="px-6 py-4"><button @click="remove(f)" class="text-red-500 hover:text-red-600 flex items-center gap-1 font-medium"><LucideIcon name="trash-2" class="w-4 h-4" />删除</button></td>
          </tr>
          <tr v-if="!loading && filteredList.length === 0"><td colspan="6" class="px-6 py-10 text-center text-gray-400 font-medium">暂无人员数据</td></tr>
        </tbody>
      </table>
    </div>

    <div class="flex items-center justify-between mt-6">
      <span class="text-sm font-medium text-gray-500">共查找到 {{ total }} 条记录</span>
      <div class="flex items-center gap-2">
        <button @click="page > 1 && load(page - 1)" class="w-8 h-8 rounded-full bg-gray-50 border border-gray-200 flex items-center justify-center text-gray-600 hover:bg-gray-100 disabled:opacity-50" :disabled="page <= 1"><LucideIcon name="chevron-left" class="w-4 h-4" /></button>
        <span class="text-sm font-semibold text-[#1d1d1f] px-2">{{ page }} / {{ totalPages }}</span>
        <button @click="page < totalPages && load(page + 1)" class="w-8 h-8 rounded-full bg-gray-50 border border-gray-200 flex items-center justify-center text-gray-600 hover:bg-gray-100 disabled:opacity-50" :disabled="page >= totalPages"><LucideIcon name="chevron-right" class="w-4 h-4" /></button>
      </div>
    </div>

    <div v-if="showModal" class="fixed inset-0 z-[1200] bg-black/20 backdrop-blur-sm flex items-center justify-center p-4 transition-all">
      <div class="w-[500px] apple-card overflow-hidden shadow-2xl animate-fade-in">
        <div class="px-8 py-6 border-b border-gray-100 flex items-center justify-between bg-white">
          <h4 class="text-xl font-semibold text-[#1d1d1f]">新人员档案录入</h4>
          <button @click="showModal = false" class="w-8 h-8 rounded-full bg-gray-50 flex items-center justify-center text-gray-500 hover:bg-gray-100 transition"><LucideIcon name="x" class="w-4 h-4" /></button>
        </div>
        <div class="p-8 space-y-5 bg-gray-50/30">
          <div>
            <label class="block text-xs font-bold text-gray-500 uppercase tracking-wider mb-2">真实姓名 <span class="text-red-500">*</span></label>
            <input v-model="regForm.name" class="w-full bg-white border border-gray-200 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:border-[#0071e3] transition-shadow shadow-sm" placeholder="请输入系统登记名">
          </div>
          <div>
            <label class="block text-xs font-bold text-gray-500 uppercase tracking-wider mb-2">授权角色 <span class="text-red-500">*</span></label>
            <select v-model="regForm.role" class="w-full bg-white border border-gray-200 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:border-[#0071e3] transition-shadow shadow-sm">
              <option value="admin">系统管理员 (Admin)</option>
              <option value="staff">工作人员 (Staff)</option>
              <option value="visitor">外部访客 (Visitor)</option>
            </select>
          </div>
          <div>
            <label class="block text-xs font-bold text-gray-500 uppercase tracking-wider mb-2">附加属性 (Metadata JSON)</label>
            <textarea v-model="regForm.metadataStr" class="w-full bg-white border border-gray-200 rounded-xl px-4 py-2.5 text-sm font-mono focus:outline-none focus:border-[#0071e3] transition-shadow shadow-sm" rows="2" placeholder='例如：{"dept": "安保巡逻"}'></textarea>
          </div>
          <div>
            <label class="block text-xs font-bold text-gray-500 uppercase tracking-wider mb-2">生物特征 (人脸照片)</label>
            <input type="file" accept="image/*" @change="onFileChange" class="w-full bg-white border border-gray-200 rounded-xl px-4 py-2 text-sm text-gray-500 file:mr-4 file:py-1 file:px-3 file:rounded-full file:border-0 file:text-xs file:font-semibold file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100 shadow-sm cursor-pointer">
            <div v-if="regForm.imageBase64" class="mt-3 p-1 bg-white border border-gray-200 rounded-xl inline-block shadow-sm"><img :src="regForm.imageBase64" class="w-24 h-24 object-cover rounded-lg"></div>
          </div>
          <div class="flex justify-end gap-3 pt-4 border-t border-gray-100 mt-6">
            <button @click="showModal = false" class="px-6 py-2.5 rounded-full bg-white border border-gray-200 text-sm font-semibold text-gray-700 hover:bg-gray-50 shadow-sm transition">取消</button>
            <button @click="submitRegister" class="px-6 py-2.5 rounded-full bg-[#1d1d1f] hover:bg-black text-sm font-semibold text-white shadow-md transition">立即提交入库</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, computed, onMounted } from 'vue'
import { useToastStore } from '../../stores/toast'
import { faceApi } from '../../services/api'
import LucideIcon from '../LucideIcon.js'

const toast = useToastStore()
const search = ref('')
const roleFilter = ref('')
const faceList = ref([])
const page = ref(1)
const pageSize = 8
const total = ref(0)
const loading = ref(false)
const showModal = ref(false)

const regForm = reactive({ name: '', role: 'visitor', metadataStr: '{}', imageBase64: '' })

const filteredList = computed(() => {
  let list = faceList.value
  if (search.value.trim()) { const kw = search.value.trim().toLowerCase(); list = list.filter(f => f.name.toLowerCase().includes(kw)) }
  if (roleFilter.value) list = list.filter(f => f.role === roleFilter.value)
  return list
})

const totalPages = computed(() => Math.max(1, Math.ceil((total.value || 0) / pageSize)))

const formatTime = (t) => { if (!t) return '--'; try { return t.replace('T', ' ').split('.')[0] } catch (e) { return t } }

const load = async (p) => {
  page.value = p
  loading.value = true
  try {
    const res = await faceApi.list({ page: p, size: pageSize })
    const items = Array.isArray(res) ? res : (res.data?.items || res.data?.records || res.data || [])
    const tot = res?.total || res?.data?.total || items.length
    faceList.value = items.map(f => ({
      ...f,
      id: f.id,
      name: f.name || '未命名',
      role: f.role || 'visitor',
      metadata: typeof f.metadata === 'string' ? (() => { try { return JSON.parse(f.metadata) } catch(e) { return {} } })() : (f.metadata || {}),
      createTime: f.create_time || f.createTime
    }))
    total.value = tot
  } catch (e) { toast.showToast('加载失败', 'error') }
  finally { loading.value = false }
}

const remove = async (face) => {
  if (!confirm(`确认删除 ${face.name} 的档案吗？`)) return
  try {
    await faceApi.delete(face.id)
    toast.showToast('档案已删除')
    load(page.value)
  } catch (e) { toast.showToast('删除失败', 'error') }
}

const onFileChange = (event) => {
  const file = event.target.files?.[0]
  if (!file) return
  const reader = new FileReader()
  reader.onload = () => { regForm.imageBase64 = String(reader.result || '') }
  reader.readAsDataURL(file)
}

const submitRegister = async () => {
  if (!regForm.name.trim()) return toast.showToast('请输入姓名', 'error')
  let meta = {}
  try { if (regForm.metadataStr.trim()) meta = JSON.parse(regForm.metadataStr) } catch (e) { return toast.showToast('附加信息必须是合法 JSON', 'error') }
  meta.name = regForm.name.trim()
  try {
    await faceApi.register({ imageBase64: regForm.imageBase64, role: regForm.role, metadata: meta })
    showModal.value = false
    toast.showToast('录入成功')
    load(1)
  } catch (e) { toast.showToast('录入失败', 'error') }
}

onMounted(() => load(1))
</script>