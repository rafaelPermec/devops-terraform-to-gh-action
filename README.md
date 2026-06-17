## DevOps na Prática - Fase 2 (PUCRS)

### _Aluno_: Rafael Perdigão Melo Castro

Este repositório contém a entrega da **Fase 2 - Implementação de Pipeline de Deploy** da disciplina DevOps na Prática.

## 🚀 Tecnologias Utilizadas

- **Controle de Versão:** GitHub
- **Ambiente de CI/CD:** GitHub Actions
- **Conteinerização:** Docker
- **Infraestrutura como Código (IaC):** Terraform (Modelo Estrutural)

## 🛠️ O que foi implementado:

1. **Pipeline de CI:** Configurado para disparar automaticamente a cada `push` na branch `main`.
2. **Docker Validation:** O pipeline executa um comando real de `docker build` para garantir que o empacotamento da aplicação esteja funcionando corretamente.
3. **Simulações de Validação:** Passos simulados de Linter, Testes Automatizados e Quality Gate.
4. **Ambientes lógicos:** Simulação de deploy em esteira progressiva (DEV -> TST -> HOL -> PRD).
5. **Infraestrutura com IaC:** Arquivo `main.tf` estruturado com o provedor AWS e o recurso de bucket S3 para a região `us-east-1`.

## 📁 Arquitetura do Projeto (File Tree)

A estrutura de arquivos do projeto adota o princípio de separação de responsabilidades para garantir a modularidade e facilitar a manutenção:

```text
devops-terraform-to-gh-action/
├── .github/
│   └── workflows/
│       └── ci.yml
├── src/
│   ├── index.html
│   └── 404.html
├── Dockerfile
├── deploy.sh
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
└── README.md
```

## ☁️ Estrutura de Infraestrutura como Código (Terraform)
Nesta fase, a infraestrutura foi mapeada de maneira estrutural e teórica utilizando as melhores práticas da HashiCorp:

Região Padrão: Centralizada em us-east-1 (Norte da Virgínia).

Recursos Mapeados:

Criação do Bucket S3 exclusivo (aws_s3_bucket).

Configuração de hospedagem para site estático (aws_s3_bucket_website_configuration).

Remoção completa de bloqueios públicos padrão da AWS (aws_s3_bucket_public_access_block).

Política de acesso público do bucket (aws_s3_bucket_policy) liberando a ação s3:GetObject para leitura na web.

Outputs: Mapeamento de saída configurado para expor automaticamente a URL de acesso público do endpoint S3 após o deploy.

## 💻 Como Executar e Validar Localmente
Pré-requisitos
Ter o Docker instalado localmente.

Ter o Terraform (versão >= 1.0.0) instalado localmente.

Testando o Container Docker
Para simular o funcionamento do servidor web localmente, execute na raiz do projeto:

```bash
# 1. Construir a imagem localmente
docker build -t app-pucrs-local .

# 2. Executar o container mapeando a porta 80
docker run -d -p 8080:80 --name site-pucrs app-pucrs-local

# Abra o seu navegador e acesse: http://localhost:8080
```

Validando a Infraestrutura Terraform
Para simular a validação sintática da sua infraestrutura localmente sem precisar injetar credenciais da AWS, execute:

```bash
# 1. Inicializar o Terraform ignorando o backend remoto
terraform init -backend=false

# 2. Verificar se a formatação dos arquivos está correta
terraform fmt -check

# 3. Validar a consistência lógica do código
terraform validate
```
