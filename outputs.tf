output "website_url" {
  description = "URL publica oficial de acesso ao site hospedado no Amazon S3"
  value       = aws_s3_bucket_website_configuration.site_config.website_endpoint
}
