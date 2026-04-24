import { h } from 'vue'
import * as icons from 'lucide-vue-next'

export default {
  props: { name: String, class: String },
  setup(props) {
    const iconName = props.name.split('-').map(s => s.charAt(0).toUpperCase() + s.slice(1)).join('')
    const IconComponent = icons[iconName]
    return () => IconComponent ? h(IconComponent, { class: props.class }) : null
  }
}
