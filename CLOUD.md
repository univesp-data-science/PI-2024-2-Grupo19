### Infraestrutura em Nuvem do Projeto

Para garantir uma infraestrutura robusta, escalável e eficiente, nosso projeto utiliza diversos serviços da Google Cloud Platform (GCP). Abaixo, detalhamos os principais componentes e ferramentas que compõem nosso ambiente em nuvem:

1. **Google Cloud Platform (GCP)**: 
   A base da nossa infraestrutura em nuvem é a Google Cloud Platform. Utilizamos GCP para gerenciar e hospedar nossa aplicação, garantindo alta disponibilidade, segurança e desempenho escalável. [Saiba mais](https://cloud.google.com/).

2. **Docker**: 
   Para assegurar que a aplicação possa ser executada de maneira consistente em qualquer ambiente, utilizamos Docker. Essa ferramenta de containerização nos permite empacotar a aplicação com todas as suas dependências, facilitando o desenvolvimento, teste e implantação. [Saiba mais](https://www.docker.com/).

3. **Google Cloud Run**: 
   Nossa aplicação é executada no Google Cloud Run, um serviço de computação sem servidor que permite implantar e dimensionar rapidamente aplicativos containerizados. Cloud Run gerencia automaticamente a infraestrutura subjacente, permitindo que nossa equipe se concentre no desenvolvimento de funcionalidades. [Saiba mais](https://cloud.google.com/run).

4. **Google Cloud SQL**: 
   Utilizamos o Google Cloud SQL para gerenciar nosso banco de dados. Este serviço de banco de dados gerenciado oferece alta disponibilidade, backups automáticos e segurança integrada, permitindo que nossos dados sejam armazenados de forma confiável e acessível. [Saiba mais](https://cloud.google.com/sql).

5. **Google Cloud Storage**: 
   Para armazenamento de arquivos e planilhas, recorremos ao Google Cloud Storage. Este serviço oferece armazenamento escalável e seguro, com alta durabilidade e disponibilidade, garantindo que nossos arquivos estejam sempre acessíveis. [Saiba mais](https://cloud.google.com/storage).

6. **PhpMyAdmin**: 
   Para facilitar a gestão do banco de dados, utilizamos o PhpMyAdmin. Esta ferramenta web permite administrar nosso banco de dados de forma intuitiva, oferecendo uma interface gráfica para executar consultas SQL, gerenciar tabelas e realizar outras operações de administração de banco de dados. [Saiba mais](https://www.phpmyadmin.net/).

Esta combinação de tecnologias e serviços garante que nosso ambiente em nuvem seja eficiente, seguro e escalável, proporcionando uma base sólida para o desenvolvimento e operação contínua de nossa aplicação.