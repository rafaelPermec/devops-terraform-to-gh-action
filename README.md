## DevOps na Prática - Fase 1 (PUCRS)

### _Aluno_: Rafael Perdigão Melo Castro

Este repositório contém a entrega da **Fase 1 - Configuração e Automação Inicial** da disciplina DevOps na Prática.

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
