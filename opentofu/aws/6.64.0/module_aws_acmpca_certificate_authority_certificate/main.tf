resource "aws_acmpca_certificate_authority_certificate" "acmpca_certificate_authority_certificates" {
  for_each = var.acmpca_certificate_authority_certificates

  certificate               = each.value.certificate
  certificate_authority_arn = each.value.certificate_authority_arn
  certificate_chain         = each.value.certificate_chain
  region                    = each.value.region
}
