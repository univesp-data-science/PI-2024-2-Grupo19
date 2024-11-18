<template>
    <div>
      <Head title="Criar nova vaga" />
      <h1 class="mb-8 text-3xl font-bold text-indigo-400">Cadastro de nova vaga</h1>
      <div class="bg-white rounded-md shadow overflow-hidden">
        <form @submit.prevent="store">
          <div class="flex flex-wrap -mb-8 -mr-6 p-8">
            <text-input v-model="form.name" class="pb-8 pr-6 w-full" label="Nome da Vaga" />
          </div>

          <div class="flex flex-wrap -mb-8 -mr-6 p-8">
            <p class="w-full pb-8"><strong>Endereço:</strong></p>
            <text-input v-model="positionMetaData.address.cep" class="pb-8 pr-6 w-full" label="CEP" />
            <text-input v-model="positionMetaData.address.street" class="pb-8 pr-6 w-full lg:w-1/3" label="Rua" />
            <text-input v-model="positionMetaData.address.number" class="pb-8 pr-6 w-full lg:w-1/3" label="Número" />
            <text-input v-model="positionMetaData.address.complement" class="pb-8 pr-6 w-full lg:w-1/3" label="Complemento" />
            <text-input v-model="positionMetaData.address.neighborhood" class="pb-8 pr-6 w-full lg:w-1/3" label="Bairro" />
            <text-input v-model="positionMetaData.address.city" class="pb-8 pr-6 w-full lg:w-1/3" label="Cidade" />
            <text-input v-model="positionMetaData.address.state" class="pb-8 pr-6 w-full lg:w-1/3" label="Estado" />
          </div>

          <div class="flex flex-wrap -mb-8 -mr-6 p-8">
            <p class="w-full pb-8"><strong>Data do Evento:</strong></p>
            <text-input v-model="form.date_from" class="pb-8 pr-6 w-1/2 lg:w-1/4" label="De" type="date" />
            <text-input v-model="form.date_to" class="pb-8 pr-6 w-1/2 lg:w-1/4" label="Até" type="date" />
            <text-input v-model="positionMetaData.period" class="pb-8 pr-6 w-full lg:w-1/2" label="Período" placeholder="Integral, Manhã, Tarde, etc..." />
            
            <select-input v-model="positionMetaData.format" class="pb-8 pr-6 w-full lg:w-1/2" label="Formato">
              <option disabled>Selecione</option>
              <option value="Presencial">Presencial</option>
              <option value="Online">Online</option>
              <option value="Híbrido">Híbrido</option>
            </select-input>

            <text-input v-model="positionMetaData.recurrence" class="pb-8 pr-6 w-full lg:w-1/3" label="Recorrência" placeholder="Diariamente, Semanalmente, etc..."/>
          </div>

          <div class="flex flex-wrap -mb-8 -mr-6 p-8">
            <p class="w-full pb-8"><strong>Habilidades necessárias:</strong></p>
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
            <label for="position-description" class="w-full pb-8"><strong>Descrição da Vaga:</strong></label>
            <textarea-input v-model="positionMetaData.description" class="pb-8 pr-6 w-full" id="position-description" rows="10"></textarea-input>
          </div>

          <div class="flex items-center justify-end px-8 py-4 bg-gray-50 border-t border-gray-100">
            <loading-button :loading="form.processing" class="btn-indigo" type="submit">Criar Vaga</loading-button>
          </div>
        </form>
      </div>
    </div>
  </template>
  
  <script>
  import { Head, Link } from '@inertiajs/vue3'
  import Layout from '@/Shared/Layout.vue'
  import FileInput from '@/Shared/FileInput.vue'
  import TextInput from '@/Shared/TextInput.vue'
  import TextareaInput from '@/Shared/TextareaInput.vue'
  import SelectInput from '@/Shared/SelectInput.vue'
  import LoadingButton from '@/Shared/LoadingButton.vue'
  
  export default {
    components: {
      FileInput,
      Head,
      Link,
      LoadingButton,
      SelectInput,
      TextInput,
      TextareaInput,
    },
    layout: Layout,
    remember: 'form',
    data() {
      return {
        form: this.$inertia.form({
          name: '',
          date_from: '',
          date_to: '',
          meta_data:{},
        }),
        positionMetaData:{
          address:{

          }
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
      store() {
        this.form.meta_data = JSON.stringify(this.positionMetaData);
        this.form.post('/positions');
      },
    },
  }
  </script>
  