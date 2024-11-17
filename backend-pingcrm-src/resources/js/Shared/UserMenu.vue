<template>
  <div>
    <div class="mb-4">
      <Link id="home" class="group flex items-center py-3" href="/">
        <fa-icon name="house-solid" class="mr-2 w-4 h-4" :class="isUrl('') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Página Inicial</div>
      </Link>
    </div>
    <div class="mb-4">
      <Link id="user-edit" class="group flex items-center py-3" :href="`/users/${user.id}/edit/`">
        <fa-icon name="user-gear-solid" class="mr-2 w-4 h-4" :class="isUrl('edit') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('organizations') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Meus Dados</div>
      </Link>
    </div>
    <div class="mb-4">
      <Link id="positions" class="group flex items-center py-3" href="/positions">
        <fa-icon name="bookmark-solid" class="mr-2 w-4 h-4" :class="isUrl('positions') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('positions') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Vagas Disponíveis</div>
      </Link>
    </div>
    <div class="mb-4">
      <Link id="positions-applied" class="group flex items-center py-3" href="/positions/applied">
        <fa-icon name="bookmark-solid" class="mr-2 w-4 h-4" :class="isUrl('reports') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('reports') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Minhas Inscrições</div>
      </Link>
    </div>
  </div>
</template>

<script>
import { Link } from '@inertiajs/vue3'
import Icon from '@/Shared/Icon.vue'
import FaIcon from '@/Shared/FaIcon.vue'

export default {
  components: {
    Icon,
    FaIcon,
    Link,
  },
  methods: {
    isUrl(...urls) {
      console.log(this.$page.url);
      let currentUrl = this.$page.url.substr(1)
      if (urls[0] === '') {
        return currentUrl === ''
      }
      return urls.filter((url) => currentUrl.startsWith(url)).length
    },
  },
  props: {
    user:Object,
  }
}
</script>
