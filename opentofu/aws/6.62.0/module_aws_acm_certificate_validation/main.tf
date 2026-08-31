resource "aws_acm_certificate_validation" "acm_certificate_validations" {
  for_each = var.acm_certificate_validations

  certificate_arn         = each.value.certificate_arn
  region                  = each.value.region
  validation_record_fqdns = each.value.validation_record_fqdns
}
