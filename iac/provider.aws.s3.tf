resource "aws_s3_bucket" "created" {
  bucket_prefix = var.aws_s3_use_domain_prefix ? var.domain_name : var.aws_s3_bucket_prefix
  force_destroy = var.aws_s3_force_destroy
}

resource "aws_s3_bucket_public_access_block" "created" {
  bucket                  = aws_s3_bucket.created.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "created" {
  bucket = aws_s3_bucket.created.id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = "aws/s3"
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_policy" "created" {
  bucket = aws_s3_bucket.created.id
  policy = data.aws_iam_policy_document.s3_cloudfront_access.json
}
