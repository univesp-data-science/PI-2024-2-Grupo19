<template>
  <div>
    <Head :title="`${form.first_name} ${form.last_name}`" />
    <trashed-message v-if="user.deleted_at" class="mb-6" @restore="restore"> This user has been deleted. </trashed-message>
    <div class="bg-white rounded-md shadow overflow-hidden">
      <form @submit.prevent="update">
        <div class="flex flex-wrap -mb-8 -mr-6 p-8">
          <p class="w-full pb-8"><strong>Dados pessoais:</strong></p>
          <text-input v-model="form.first_name" :error="form.errors.first_name" class="pb-8 pr-6 w-full lg:w-1/2" label="Nome" />
          <text-input v-model="form.last_name" :error="form.errors.last_name" class="pb-8 pr-6 w-full lg:w-1/2" label="Sobrenome" />
          <text-input v-model="form.email" :error="form.errors.email" class="pb-8 pr-6 w-full lg:w-1/2" label="Email" />
          <text-input v-model="form.password" :error="form.errors.password" class="pb-8 pr-6 w-full lg:w-1/2" type="password" autocomplete="new-password" label="Senha" />
        </div>
        <div class="flex flex-wrap -mb-8 -mr-6 px-8">
          <text-input v-model="userMetaData.cpf" class="pb-8 pr-6 w-full lg:w-1/2" label="CPF" />
          <text-input v-model="userMetaData.birthdate" class="pb-8 pr-6 w-full lg:w-1/2" type="date" label="Data de Nascimento" />
        </div>
        <div class="flex flex-wrap -mb-8 -mr-6 p-8">
          <p class="w-full pb-8"><strong>Endereço:</strong></p>
          <text-input v-model="userMetaData.address.cep" class="pb-8 pr-6 w-full" label="CEP" />
          <text-input v-model="userMetaData.address.street" class="pb-8 pr-6 w-full lg:w-1/3" label="Rua" />
          <text-input v-model="userMetaData.address.number" class="pb-8 pr-6 w-full lg:w-1/3" label="Número" />
          <text-input v-model="userMetaData.address.complement" class="pb-8 pr-6 w-full lg:w-1/3" label="Complemento" />
          <text-input v-model="userMetaData.address.neighborhood" class="pb-8 pr-6 w-full lg:w-1/3" label="Bairro" />
          <text-input v-model="userMetaData.address.city" class="pb-8 pr-6 w-full lg:w-1/3" label="Cidade" />
          <text-input v-model="userMetaData.address.state" class="pb-8 pr-6 w-full lg:w-1/3" label="Estado" />
        </div>

        <div class="flex flex-wrap -mb-8 -mr-6 p-8">
          <p class="w-full pb-8"><strong>Contato:</strong></p>
          <text-input v-model="userMetaData.phone" class="pb-8 pr-6 w-full lg:w-1/2" label="Telefone" />
          <text-input v-model="userMetaData.mobile" class="pb-8 pr-6 w-full lg:w-1/2" label="Celular / WhatsApp" />
        </div>

        <div class="flex flex-wrap -mb-8 -mr-6 p-8">
          <p class="w-full pb-8"><strong>Habilidades:</strong></p>
          <select-input v-model="selectedHardskil" class="pb-8 pr-6 w-full lg:w-1/2" label="Profissionais">
            <option value="" disabled>Selecione</option>
            <option v-for="(strValue) in hardskils" :key="strValue" :value="strValue">
              {{ strValue }}
            </option>
          </select-input>
          <select-input v-model="selectedSoftskil" class="pb-8 pr-6 w-full lg:w-1/2" label="Sociais">
            <option value="" disabled>Selecione</option>
            <option v-for="(strValue) in softskils" :key="strValue" :value="strValue">
              {{ strValue }}
            </option>
          </select-input>
        </div>

        <div class="flex flex-wrap -mb-8 -mr-6 p-8">
          <label for="user-bio" class="w-full pb-8"><strong>Descrição:</strong></label>
          <textarea-input v-model="userMetaData.bio" class="pb-8 pr-6 w-full" id="user-bio" rows="10"></textarea-input>
        </div>

        <div class="flex items-center px-8 py-4 bg-gray-50 border-t border-gray-100">
          <loading-button :loading="form.processing" class="btn-indigo ml-auto" type="submit">Atualizar Cadastro</loading-button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import { Head, Link } from '@inertiajs/vue3'
import Layout from '@/Shared/Layout.vue'
import TextInput from '@/Shared/TextInput.vue'
import TextareaInput from '@/Shared/TextareaInput.vue'
import FileInput from '@/Shared/FileInput.vue'
import SelectInput from '@/Shared/SelectInput.vue'
import LoadingButton from '@/Shared/LoadingButton.vue'
import TrashedMessage from '@/Shared/TrashedMessage.vue'

export default {
  components: {
    FileInput,
    Head,
    Link,
    LoadingButton,
    SelectInput,
    TextInput,
    TextareaInput,
    TrashedMessage,
  },
  layout: Layout,
  props: {
    user: Object,
  },
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        _method: 'put',
        first_name: this.user.first_name,
        last_name: this.user.last_name,
        email: this.user.email,
        password: '',
        owner: this.user.owner,
        photo: null,
        meta_data: this.userMetaData,
      }),
      userMetaData: {
        address:{
          cep:'',
          street:'',
          number:'',
          complement:'',
          neighborhood:'',
          city:'',
          state:'',
        },
        bio:'Olá! Meu nome é...',
      },
      "hardskils": [
        "Administrador",
        "Adestrador de Animais",
        "Advogado",
        "Agricultor",
        "Arquiteto",
        "Assistente Administrativo",
        "Atendente de Telemarketing",
        "Auxiliar de Limpeza",
        "Biólogo",
        "Bombeiro",
        "Cabeleireiro",
        "Caixa de Loja",
        "Carpinteiro",
        "Contador",
        "Cozinheiro",
        "Criador de Animais",
        "Dentista",
        "Designer Gráfico",
        "Desenvolvedor de Software",
        "Economista",
        "Eletricista",
        "Empresário",
        "Encanador",
        "Enfermeiro",
        "Engenheiro Civil",
        "Engenheiro de Software",
        "Farmacêutico",
        "Fisioterapeuta",
        "Garçom",
        "Gerente de Loja",
        "Gestor de Projetos",
        "Instrutor de Academia",
        "Jornalista",
        "Médico",
        "Motoboy",
        "Motorista de Aplicativo",
        "Motorista de Caminhão",
        "Nutricionista",
        "Operador de Empilhadeira",
        "Operador de Máquinas",
        "Pedagogo",
        "Pedreiro",
        "Pintor",
        "Policial Militar",
        "Porteiro",
        "Professor de Ensino Fundamental",
        "Professor de Ensino Médio",
        "Professor Universitário",
        "Programador",
        "Psicólogo",
        "Representante Comercial",
        "Secretária",
        "Soldador",
        "Técnico de Enfermagem",
        "Técnico em Eletrotécnica",
        "Técnico em Informática",
        "Tratador de Animais",
        "Vaqueiro",
        "Vendedor",
        "Veterinário",
        "Vigilante",
        "Zelador",
        "Zootecnista"
      ],
      "softskils": [
        "Accountability (prestação de contas)",
        "Adaptabilidade",
        "Aprendizado contínuo",
        "Assertividade",
        "Atenção plena",
        "Autenticidade",
        "Autoconsciência",
        "Autocontrole emocional",
        "Autodisciplina",
        "Autonomia",
        "Capacidade de adaptação",
        "Capacidade de análise",
        "Capacidade de dar e receber feedback",
        "Capacidade de estabelecer vínculos",
        "Capacidade de influenciar",
        "Capacidade de inspirar",
        "Capacidade de lidar com críticas",
        "Capacidade de mediação",
        "Capacidade de motivar a si mesmo",
        "Capacidade de motivar os outros",
        "Capacidade de observação",
        "Capacidade de persuasão",
        "Carisma",
        "Colaboração",
        "Comprometimento",
        "Comunicação eficaz",
        "Comunicação não verbal",
        "Comunicação verbal",
        "Confiabilidade",
        "Confiança interpessoal",
        "Consciência cultural",
        "Construção de confiança",
        "Controle emocional",
        "Cordialidade",
        "Criatividade",
        "Curiosidade intelectual",
        "Delegação eficaz",
        "Desenvolvimento de talentos",
        "Diplomacia",
        "Disciplina",
        "Disposição para ajudar",
        "Empatia",
        "Escuta ativa",
        "Flexibilidade",
        "Flexibilidade cognitiva",
        "Gestão de equipes",
        "Gestão de estresse",
        "Gestão de mudanças",
        "Gestão de tempo",
        "Gestão do estresse",
        "Gestão do tempo",
        "Habilidade de mentorar",
        "Habilidade de networking",
        "Habilidade de resolução de problemas",
        "Habilidade para dar feedback",
        "Habilidade para delegar",
        "Inovação",
        "Integridade",
        "Inteligência emocional",
        "Liderança",
        "Liderança inspiradora",
        "Mediação de grupos",
        "Motivação intrínseca",
        "Negociação",
        "Organização pessoal",
        "Paciência",
        "Pensamento analítico",
        "Pensamento crítico",
        "Persuasão",
        "Pontualidade",
        "Postura profissional",
        "Proatividade",
        "Receptividade a feedback",
        "Reconhecimento de emoções alheias",
        "Relacionamento interpessoal",
        "Resiliência",
        "Resolução de conflitos",
        "Resolução de problemas",
        "Respeito à diversidade",
        "Responsabilidade",
        "Saber pedir ajuda",
        "Senso de humor",
        "Sustentabilidade e responsabilidade social",
        "Tolerância à ambiguidade",
        "Tolerância à frustração",
        "Tomada de decisão",
        "Trabalho em equipe",
        "Visão estratégica",
        "Ética no trabalho"
      ],
      selectedSoftskil:'',
      selectedHardskil:'',
    }
  },
  methods: {
    update() {
      this.form.post(`/users/${this.user.id}`, {
        onSuccess: () => this.form.reset('password', 'photo'),
      })
    },
    destroy() {
      if (confirm('Are you sure you want to delete this user?')) {
        this.$inertia.delete(`/users/${this.user.id}`)
      }
    },
    restore() {
      if (confirm('Are you sure you want to restore this user?')) {
        this.$inertia.put(`/users/${this.user.id}/restore`)
      }
    },
  },
}
</script>
