resource "aws_acm_certificate" "created" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
  subject_alternative_names = []
  validation_option {
    domain_name       = var.domain_name
    validation_domain = var.domain_name
  }
}

resource "aws_acm_certificate_validation" "created" {
  certificate_arn = aws_acm_certificate.created.arn
}
