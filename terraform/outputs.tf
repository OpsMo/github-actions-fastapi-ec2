output "staging_public_ip" {
  value = aws_instance.fastapi_staging.public_ip
}

output "production_public_ip" {
  value = aws_instance.fastapi_prod.public_ip
}

output "ecr_repo_url" {
  value = aws_ecr_repository.fastapi-ecr.repository_url
}

output "ecr_image_url" {
  value = aws_ecr_repository.fastapi-ecr.repository_url
  
}