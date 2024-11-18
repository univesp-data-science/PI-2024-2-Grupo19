<template>
    <div>
      <Head title="Reports" />
      <h1 class="mb-8 text-3xl font-bold">Seleção de Voluntários</h1>
      <div class="mt-6 bg-white rounded shadow overflow-x-auto">
        <table class="w-full whitespace-nowrap">
          <tr class="text-left font-bold">
            <th class="pb-4 pt-6 px-6">Nome</th>
            <th class="pb-4 pt-6 px-6 text-center">Ações</th>
            <th class="pb-4 pt-6 px-6 text-center">Selecionar</th>
          </tr>
          <tr v-for="volunteer in volunteers" :key="volunteer.id" class="hover:bg-gray-100 focus-within:bg-gray-100">
            <td class="border-t">
              <p class="flex items-center px-6 py-4 focus:text-indigo-500">
                {{ volunteer.name }}
              </p>
            </td>
            <td class="border-t text-center">
                <button class="text-white bg-blue-600 py-2 px-4 ml-2 rounded">Ver Perfil</button>
            </td>
            <td class="border-t text-center">
                <input type="checkbox" value="1">
            </td>
          </tr>
          <tr v-if="volunteers.length === 0">
            <td class="px-6 py-4 border-t" colspan="4">Não há voluntários para essa vaga</td>
          </tr>
        </table>

        <div class="flex items-center px-8 py-4 bg-gray-50 border-t border-gray-100">
          <loading-button class="btn-indigo bg-green-500 hover:bg-green-600 ml-auto mt-8" onclick="return false;">Confirmar Seleção</loading-button>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import { Head, Link } from '@inertiajs/vue3'
  import Icon from '@/Shared/Icon.vue'
  import Layout from '@/Shared/Layout.vue'
  import LoadingButton from '@/Shared/LoadingButton.vue'
  
  export default {
    components: {
      Head,
      Icon,
      Link,
      LoadingButton,
    },
    /*
    props: {
      filters: Object,
      volunteers: Array,
    },
    */
    layout: Layout,
    mounted() {
      //console.log(this.volunteers);
    },
    data() {
      return {
        volunteers:[
            {
              id:1,
              name:'Taticia Ikeda',
            },
            {
              id:2,
              name:'Denis Aparecido',
            },
            {
              id:3,
              name:'Jonas Arqueros',
            },
            {
              id:4,
              name:'Thiago de Oliveira',
            },
            {
              id:5,
              name:'Aleksej Kozlakowski',
            },
          ]
      }
    }
  }
  </script>
  