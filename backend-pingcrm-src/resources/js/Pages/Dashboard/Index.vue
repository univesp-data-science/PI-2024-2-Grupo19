<template>
  <div>
    <Head title="Dashboard" />
    <h1 class="mb-8 text-3xl font-bold">Painel de notificações</h1>
    <p class="mb-8 leading-normal">Aqui estão suas notificações:</p>
    <p class="p-4 bg-gray-200"><small>Você não tem notificações no momento</small></p>
  </div>
</template>

<script>
import { Head } from '@inertiajs/vue3'
import Layout from '@/Shared/Layout.vue'

export default {
  components: {
    Head,
  },
  layout: Layout,
}
</script>
