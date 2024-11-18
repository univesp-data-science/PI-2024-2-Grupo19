<template>
  <div>
    <div class="mb-4">
      <Link class="group flex items-center py-3" href="/">
        <fa-icon name="house-solid" class="mr-2 w-4 h-4" :class="isSection('home') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isSection('home') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Página Inicial</div>
      </Link>
    </div>
    <div class="mb-4">
      <Link class="group flex items-center py-3" :href="`/users/${user.id}/edit/`">
        <fa-icon name="user-gear-solid" class="mr-2 w-4 h-4" :class="isSection('edit') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isSection('edit') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Meus Dados</div>
      </Link>
    </div>
    <div class="mb-4">
      <Link class="group flex items-center py-3" href="/organizations/1/editorg">
        <fa-icon name="building-ngo-solid" class="mr-2 w-4 h-4" :class="isSection('editorg') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isSection('editorg') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Dados da ONG</div>
      </Link>
    </div>
    <div class="mb-4">
      <Link class="group flex items-center py-3" href="/positions">
        <fa-icon name="bookmark-solid" class="mr-2 w-4 h-4" :class="isSection('positions') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isSection('positions') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Vagas Ativas</div>
      </Link>
    </div>
    <div class="mb-4">
      <Link class="group flex items-center py-3" href="/positions-create">
        <fa-icon name="bookmark-regular" class="mr-2 w-4 h-4" :class="isSection('positions-create') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isSection('positions-create') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Cadastrar nova Vaga</div>
      </Link>
    </div>
  </div>
</template>

<script>
import { Link } from '@inertiajs/vue3'
import Icon from '@/Shared/Icon.vue'
import FaIcon from '@/Shared/FaIcon.vue'

export default {
  computed: {
    lastURLSegment() {
      const urlPath = window.location.pathname;

      if(urlPath == '/')
        return 'home';

      return urlPath.split("/").filter(Boolean).pop();
    },
  },
  components: {
    Icon,
    FaIcon,
    Link,
  },
  mounted() {
    this.initComponent();
  },
  methods: {
    initComponent(){
      //const activeLink = document.getElementById("home");
      ///activeLink.classList.add("active");
    },
    isSection(section) {
      const urlPath = this.$page.url;
      let curSection;

      if(urlPath == '/'){
        curSection = 'home';
      } else {
        curSection = urlPath.split("/").filter(Boolean).pop();
      }

      return curSection == section;
    },
  },
  props: {
    user:Object,
  }
}
</script>
