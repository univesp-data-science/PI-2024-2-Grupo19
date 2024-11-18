<template>
  <div>
    <Head :title="form.name" />
    <h1 class="mb-8 text-3xl font-bold text-indigo-400">{{ form.name }}</h1>
    <trashed-message v-if="organization.deleted_at" class="mb-6" @restore="restore"> This organization has been deleted. </trashed-message>
    <div class="bg-white rounded-md shadow overflow-hidden">
      <form @submit.prevent="update">
        <div class="flex flex-wrap -mb-8 -mr-6 p-8">
          <p class="w-full pb-8"><strong>Dados da ONG:</strong></p>
          <text-input v-model="form.name" :error="form.errors.name" class="pb-8 pr-6 w-full lg:w-1/2" label="Nome" />
          <text-input v-model="orgMetaData.cnpj" class="pb-8 pr-6 w-full lg:w-1/2" label="CNPJ" />
        </div>
        <div class="flex flex-wrap -mb-8 -mr-6 p-8">
          <p class="w-full pb-8"><strong>Endereço:</strong></p>
          <text-input v-model="orgMetaData.address.cep" class="pb-8 pr-6 w-full" label="CEP" />
          <text-input v-model="orgMetaData.address.street" class="pb-8 pr-6 w-full lg:w-1/3" label="Rua" />
          <text-input v-model="orgMetaData.address.number" class="pb-8 pr-6 w-full lg:w-1/3" label="Número" />
          <text-input v-model="orgMetaData.address.complement" class="pb-8 pr-6 w-full lg:w-1/3" label="Complemento" />
          <text-input v-model="orgMetaData.address.neighborhood" class="pb-8 pr-6 w-full lg:w-1/3" label="Bairro" />
          <text-input v-model="orgMetaData.address.city" class="pb-8 pr-6 w-full lg:w-1/3" label="Cidade" />
          <text-input v-model="orgMetaData.address.state" class="pb-8 pr-6 w-full lg:w-1/3" label="Estado" />
        </div>

        <div class="flex flex-wrap -mb-8 -mr-6 p-8">
          <p class="w-full pb-8"><strong>Contato:</strong></p>
          <text-input v-model="form.email" :error="form.errors.email" class="pb-8 pr-6 w-full lg:w-1/2" label="Email" />
          <text-input v-model="form.phone" :error="form.errors.phone" class="pb-8 pr-6 w-full lg:w-1/2" label="Phone" />
        </div>

        <div class="flex flex-wrap -mb-8 -mr-6 p-8">
          <p class="w-full pb-8"><strong>Atividades:</strong></p>
          <select-input v-model="selectedActivityFild" class="pb-8 pr-6 w-full lg:w-1/2" label="Área de Atuação">
            <option value="" disabled>Selecione</option>
            <option v-for="(strValue) in activityFildList" :key="strValue" :value="strValue">
              {{ strValue }}
            </option>
          </select-input>
        </div>

        <div class="flex flex-wrap -mb-8 -mr-6 p-8">
          <label for="ong-bio" class="w-full pb-8"><strong>Descrição:</strong></label>
          <textarea-input v-model="orgMetaData.bio" class="pb-8 pr-6 w-full" id="ong-bio" rows="10"></textarea-input>
        </div>
        
        <div class="flex items-center px-8 py-4 bg-gray-50 border-t border-gray-100">
          <loading-button :loading="form.processing" class="btn-indigo ml-auto" type="submit">Atualizar Dados</loading-button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import { Head, Link } from '@inertiajs/vue3'
import Icon from '@/Shared/Icon.vue'
import Layout from '@/Shared/Layout.vue'
import TextInput from '@/Shared/TextInput.vue'
import TextareaInput from '@/Shared/TextareaInput.vue'
import SelectInput from '@/Shared/SelectInput.vue'
import LoadingButton from '@/Shared/LoadingButton.vue'
import TrashedMessage from '@/Shared/TrashedMessage.vue'

export default {
  components: {
    Head,
    Icon,
    Link,
    LoadingButton,
    SelectInput,
    TextInput,
    TextareaInput,
    TrashedMessage,
  },
  layout: Layout,
  props: {
    organization: Object,
  },
  remember: 'form',
  mounted() {
    //
  },
  data() {
    return {
      form: this.$inertia.form({
        _method: 'put',
        name: this.organization.name,
        email: this.organization.email,
        phone: this.organization.phone,
        meta_data: this.organization.meta_data,
      }),
      orgMetaData: Object.assign({}, {
        address: {},
        cnpj: '',
        bio: ''
      }, JSON.parse(this.organization.meta_data)),
      activityFildList: [
        'Adoção de Animais',
        'Resgate de Animais',
      ],
      selectedActivityFild:''
    }
  },
  methods: {
    update() {
      this.form.meta_data = JSON.stringify(this.orgMetaData);
      this.form.put(`/organizations/${this.organization.id}`)
    },
    destroy() {
      if (confirm('Are you sure you want to delete this organization?')) {
        this.$inertia.delete(`/organizations/${this.organization.id}`)
      }
    },
    restore() {
      if (confirm('Are you sure you want to restore this organization?')) {
        this.$inertia.put(`/organizations/${this.organization.id}/restore`)
      }
    },
  },
}
</script>
