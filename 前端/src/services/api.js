import axios from 'axios'

const API_BASE = 'http://localhost:8080'

const api = axios.create({
  baseURL: API_BASE,
  timeout: 10000,
  headers: { 'Content-Type': 'application/json' }
})

api.interceptors.response.use(
  response => response.data,
  error => Promise.reject(error)
)

export const deviceApi = {
  list: (params) => api.get('/api/devices', { params }),
  get: (deviceId) => api.get(`/api/devices/${deviceId}`),
  create: (data) => api.post('/api/devices', data),
  update: (deviceId, data) => api.put(`/api/devices/${deviceId}`, data),
  delete: (deviceId) => api.delete(`/api/devices/${deviceId}`),
  arm: (deviceId) => api.post(`/api/device/${deviceId}/arm`),
  disarm: (deviceId) => api.post(`/api/device/${deviceId}/disarm`),
  control: (deviceId, type, action) => api.post(`/api/device/${deviceId}/${type}/${action}`)
}

export const sensorApi = {
  latest: () => api.get('/api/sensors/latest'),
  trend: (params) => api.get('/api/statistics/sensors/trend', { params })
}

export const alarmApi = {
  recent: (limit = 50) => api.get('/api/alarms/recent', { params: { limit } }),
  statistics: () => api.get('/api/statistics/alarms'),
  confirm: (id, handler) => api.put(`/api/alarms/${id}/confirm`, null, { params: { handler } }),
  handle: (id, handler) => api.put(`/api/alarms/${id}/handle`, null, { params: { handler } })
}

export const ruleApi = {
  list: () => api.get('/api/rules'),
  get: (id) => api.get(`/api/rules/${id}`),
  create: (data) => api.post('/api/rules', data),
  update: (id, data) => api.put(`/api/rules/${id}`, data),
  delete: (id) => api.delete(`/api/rules/${id}`),
  toggle: (id, enabled) => api.post(`/api/rules/${id}/toggle`, { enabled })
}

export const workOrderApi = {
  list: (params) => api.get('/api/workorders', { params }),
  get: (id) => api.get(`/api/workorders/${id}`),
  create: (data) => api.post('/api/workorders', data),
  assign: (id, assignee) => api.put(`/api/workorders/${id}/assign`, { assignee }),
  updateStatus: (id, status) => api.put(`/api/workorders/${id}/status`, { status }),
  delete: (id) => api.delete(`/api/workorders/${id}`)
}

export const faceApi = {
  register: (data) => api.post('/api/face-rec/register', data),
  login: (imageBase64) => api.post('/api/face-rec/login', { imageBase64 }),
  list: (params) => api.get('/api/face-rec/list', { params }),
  search: (data) => api.post('/api/face-rec/search', data),
  delete: (id) => api.delete(`/api/face-rec/persons/${id}`),
  accessLogs: () => api.get('/api/face-rec/access-logs')
}

export const agentApi = {
  chat: (question, sessionId) => api.post('/api/agent/chat', { question, sessionId })
}

export const visionApi = {
  fireMonitor: (formData) => api.post('/api/vision/fire-monitor', formData, { headers: { 'Content-Type': 'multipart/form-data' } }),
  behaviorMonitor: (formData) => api.post('/api/vision/behavior-monitor', formData, { headers: { 'Content-Type': 'multipart/form-data' } })
}

export default api