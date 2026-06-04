# Configuracao do provedor de nuvem utilizado no projeto
provider "aws" {
  region = "us-east-1"
}

# Declaracao estrutural do bucket S3 para armazenamento de arquivos estaticos
resource "aws_s3_bucket" "bucket_projeto_pucrs" {
  bucket = "pucrs-devops-projeto-basico-rafael"

  tags = {
    Name        = "Bucket Projeto Academico"
    Environment = "Fase 1 - Estrutural"
    Project     = "DevOps na Pratica"
  }
}