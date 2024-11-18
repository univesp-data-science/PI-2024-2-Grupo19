<template>
  <Head title="Cadastro" />
  <div class="flex items-center justify-center p-6 min-h-screen bg-indigo-800">
    <div class="w-full max-w-md">
      <logo class="block mx-auto w-full max-w-xs fill-white" height="50" />
      <form class="mt-8 bg-white rounded-lg shadow-xl overflow-hidden" @submit.prevent="register">
        <div class="px-10 py-12">
          <h1 class="text-center text-3xl font-bold">Faça seu Cadastro</h1>
          <div class="mt-6 mx-auto w-24 border-b-2" />
          <text-input v-model="form.first_name" :error="form.errors.first_name" class="mt-10" label="Nome" type="text" autofocus />
          <text-input v-model="form.last_name" :error="form.errors.last_name" class="mt-2" label="Sobrenome" type="text" />
          <text-input v-model="form.email" :error="form.errors.email" class="mt-10" label="Email" type="email" autocapitalize="off" />
          <text-input v-model="form.password" :error="form.errors.password" class="mt-6" label="Senha" type="password" />
          <text-input v-model="form.password_confirmation" :error="form.errors.password_confirmation" class="mt-6" label="Confirmar Senha" type="password" />
        </div>
        <div class="flex px-10 py-4 bg-gray-100 border-t border-gray-100">
          <p>Já é cadastrado?<br><a href="/login" class="text-blue-600">Faça o login.</a></p>
          <loading-button :loading="form.processing" class="btn-indigo ml-auto" type="submit">Cadastrar</loading-button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import { Head } from '@inertiajs/vue3'
import Logo from '@/Shared/Logo.vue'
import TextInput from '@/Shared/TextInput.vue'
import LoadingButton from '@/Shared/LoadingButton.vue'

export default {
  components: {
    Head,
    LoadingButton,
    Logo,
    TextInput,
  },
  data() {
    return {
      form: this.$inertia.form({
        first_name: '',
        last_name: '',
        email: '',
        password: '',
        password_confirmation: '',
        account_id: 1
      }),
    }
  },
  methods: {
    register() {
      this.form.post('/register')
    },
  },
}
</script>