<template>
  <div>
    <div class="mb-4">
      <Link id="home" class="group flex items-center py-3" href="/">
        <fa-icon name="house-solid" class="mr-2 w-4 h-4" :class="isSection('home') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isSection('home') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Página Inicial</div>
      </Link>
    </div>
    <div class="mb-4">
      <Link id="user-edit" class="group flex items-center py-3" :href="`/users/${user.id}/edit/`">
        <fa-icon name="user-gear-solid" class="mr-2 w-4 h-4" :class="isSection('edit') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isSection('edit') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Meus Dados</div>
      </Link>
    </div>
    <div class="mb-4">
      <Link id="positions" class="group flex items-center py-3" href="/users/positions">
        <fa-icon name="bookmark-solid" class="mr-2 w-4 h-4" :class="isSection('positions') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isSection('positions') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Vagas Disponíveis</div>
      </Link>
    </div>
    <div class="mb-4">
      <Link id="positions-applied" class="group flex items-center py-3" href="/positions/applied">
        <fa-icon name="bookmark-solid" class="mr-2 w-4 h-4" :class="isSection('applied') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isSection('applied') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Minhas Inscrições</div>
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
