resource "aws_acmpca_certificate" "acmpca_certificates" {
  for_each = var.acmpca_certificates

  certificate_authority_arn   = each.value.certificate_authority_arn
  certificate_signing_request = each.value.certificate_signing_request
  signing_algorithm           = each.value.signing_algorithm
  api_passthrough             = each.value.api_passthrough
  region                      = each.value.region
  template_arn                = each.value.template_arn

  dynamic "validity" {
    for_each = each.value.validity != null ? each.value.validity : []
    content {
      type  = validity.value.type
      value = validity.value.value
    }
  }
}
