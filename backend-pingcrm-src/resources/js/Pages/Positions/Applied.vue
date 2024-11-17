<template>
    <div>
      <Head title="Vagas aplicadas" />
      <h1 class="mb-8 text-3xl font-bold">Vagas Aplicadas</h1>
      <p>Hello, moto applied!</p>
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
  