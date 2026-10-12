resource "aws_iot_ca_certificate" "iot_ca_certificates" {
  for_each = var.iot_ca_certificates

  active                       = each.value.active
  allow_auto_registration      = each.value.allow_auto_registration
  ca_certificate_pem           = each.value.ca_certificate_pem
  certificate_mode             = each.value.certificate_mode
  region                       = each.value.region
  tags                         = each.value.tags
  tags_all                     = each.value.tags_all
  verification_certificate_pem = each.value.verification_certificate_pem

  dynamic "registration_config" {
    for_each = each.value.registration_config != null ? each.value.registration_config : []
    content {
      role_arn      = registration_config.value.role_arn
      template_body = registration_config.value.template_body
      template_name = registration_config.value.template_name
    }
  }
}
