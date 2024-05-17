data "aws_cloudfront_cache_policy" "caching_optimized" {
  name = "Managed-CachingOptimized"
}

locals {
  cloudfront_s3_origin_id = "s3origin"
}

resource "aws_cloudfront_distribution" "created" {
  enabled             = true
  is_ipv6_enabled     = true
  aliases             = [var.domain_name]
  default_root_object = var.aws_cloudfront_default_root_object
  price_class         = var.aws_cloudfront_price_class
  http_version        = "http2and3"
  origin {
    domain_name              = aws_s3_bucket.created.bucket_regional_domain_name
    origin_id                = local.cloudfront_s3_origin_id
    origin_access_control_id = aws_cloudfront_origin_access_control.s3_access.id
  }
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    cache_policy_id        = data.aws_cloudfront_cache_policy.caching_optimized.id
    target_origin_id       = local.cloudfront_s3_origin_id
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }
  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.created.arn
    minimum_protocol_version = var.aws_cloudfront_minimum_protocol_version
    ssl_support_method       = "sni-only"
  }

  depends_on = [aws_acm_certificate_validation.created]
}

resource "aws_cloudfront_origin_access_control" "s3_access" {
  name                              = "${var.domain_name}_s3"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}
