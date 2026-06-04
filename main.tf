# 1. Criacao do Bucket S3
resource "aws_s3_bucket" "bucket_projeto_pucrs" {
  bucket        = var.bucket_name
  force_destroy = true # Permite deletar o bucket na fase 2 mesmo se ele contiver arquivos

  tags = {
    Name        = "Bucket Site Estatico"
    Environment = var.environment
    Project     = "DevOps na Pratica"
  }
}

# 2. Configurando as regras de Hospedagem de Site Estatico
resource "aws_s3_bucket_website_configuration" "site_config" {
  bucket = aws_s3_bucket.bucket_projeto_pucrs.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}

# 3. Removendo o Bloqueio de Acesso Publico Padrao da AWS (Obrigatorio para Sites Web)
resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket = aws_s3_bucket.bucket_projeto_pucrs.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# 4. Politica do Bucket (Bucket Policy) para permitir que qualquer usuario leia o site
resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket     = aws_s3_bucket.bucket_projeto_pucrs.id
  depends_on = [aws_s3_bucket_public_access_block.public_block] # Garante que a trava publica ja foi removida antes

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.bucket_projeto_pucrs.arn}/*"
      }
    ]
  })
}
