resource "aws_acm_certificate" "created" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
  subject_alternative_names = []
}

resource "aws_acm_certificate_validation" "created" {
  certificate_arn = aws_acm_certificate.created.arn
  depends_on      = [terraform_data.print_acm_validation_records]
}


# HACK: im sorry

resource "terraform_data" "print_acm_validation_records" {
  provisioner "local-exec" {
    command = <<-EOT
      echo -en '\n\n\n\n\n\n
      add the following records to associated DNS server:\n\n
      ${local.acm_validation_records_provisioner_string}
      \n\n\n\n\n\n'
    EOT
  }
}

locals {
  acm_validation_records_provisioner_string = join("\n", [
    for map in aws_acm_certificate.created.domain_validation_options :
    join("\n", [
      join(" | ", keys(map)),
      join(" | ", values(map))
    ])
  ])
}
