<template>
    <div>
      <Head title="Vagas Disponíveis" />
      <h1 class="mb-8 text-3xl font-bold">Vagas ativas</h1>
      <div class="mt-6 bg-white rounded shadow overflow-x-auto">
        <table class="w-full whitespace-nowrap">
          <tr class="text-left font-bold">
            <th class="pb-4 pt-6 px-6">Nome</th>
            <th class="pb-4 pt-6 px-6 text-center">Data da Atividade</th>
            <th class="pb-4 pt-6 px-6 text-center">Ações</th>
          </tr>
          <tr v-for="position in positions" :key="position.id" class="hover:bg-gray-100 focus-within:bg-gray-100">
            <td class="border-t">
              <p class="flex items-center px-6 py-4 focus:text-indigo-500">
                {{ position.name }}
              </p>
            </td>
            <td class="border-t text-center">
              <p class="px-6 py-4 text-center">
                {{ position.date_from }}
              </p>
            </td>
            <td class="border-t text-center">
              <button class="text-white bg-blue-600 py-2 px-4 ml-2 rounded">Ver Detalhes</button>
            </td>
          </tr>
          <tr v-if="positions.length === 0">
            <td class="px-6 py-4 border-t" colspan="4">Não há vagas disponíveis</td>
          </tr>
        </table>
      </div>
    </div>
  </template>
  
  <script>
  import { Head, Link } from '@inertiajs/vue3'
  import Icon from '@/Shared/Icon.vue'
  import Layout from '@/Shared/Layout.vue'
  
  export default {
    components: {
      Head,
      Icon,
      Link,
    },
    props: {
      filters: Object,
      positions: Array,
    },
    layout: Layout,
    mounted() {
      console.log(this.positions);
    },
    data() {
      return {
        form: {
          search: this.filters.search,
          trashed: this.filters.trashed,
        },
      }
    },
  }
  </script>
  