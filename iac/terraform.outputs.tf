output "aws_account_id" {
  value       = data.aws_caller_identity.current.account_id
  description = "ID of the AWS account."
}

output "s3_bucket" {
  value       = aws_s3_bucket.created.id
  description = "name of the created S3 bucket."
}

output "cloudfront_distribution" {
  value       = aws_cloudfront_distribution.created.id
  description = "ID of the created CloudFront distribution."
}

output "acm_certificate_arn" {
  value       = aws_acm_certificate.created.arn
  description = "ARN of the created ACM certificate."
}

output "acm_validation_options" {
  value       = aws_acm_certificate.created.domain_validation_options
  description = "ACM domain validation records."
}

output "iam_access_key_id" {
  value       = aws_iam_access_key.publisher.id
  description = "access key ID of the publisher IAM user."
}

output "iam_secret_access_key" {
  value       = aws_iam_access_key.publisher.secret
  sensitive   = true
  description = "secret access key of the publisher IAM user."
}

output "domain_name" {
  value       = var.domain_name
  description = "target publishing domain name."
}
