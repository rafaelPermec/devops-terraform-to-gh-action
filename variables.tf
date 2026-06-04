variable "aws_region" {
  description = "Regiao da AWS onde os recursos serao provisionados"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Nome globalmente unico do bucket S3"
  type        = string
  default     = "pucrs-devops-projeto-basico-rafael"
}

variable "environment" {
  description = "Ambiente de execucao do projeto"
  type        = string
  default     = "Fase 1 - Completo"
}
