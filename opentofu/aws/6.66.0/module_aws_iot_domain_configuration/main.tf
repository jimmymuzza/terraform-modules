resource "aws_iot_domain_configuration" "iot_domain_configurations" {
  for_each = var.iot_domain_configurations

  name                       = each.value.name
  application_protocol       = each.value.application_protocol
  authentication_type        = each.value.authentication_type
  domain_name                = each.value.domain_name
  region                     = each.value.region
  server_certificate_arns    = each.value.server_certificate_arns
  service_type               = each.value.service_type
  status                     = each.value.status
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all
  validation_certificate_arn = each.value.validation_certificate_arn

  dynamic "authorizer_config" {
    for_each = each.value.authorizer_config != null ? each.value.authorizer_config : []
    content {
      allow_authorizer_override = authorizer_config.value.allow_authorizer_override
      default_authorizer_name   = authorizer_config.value.default_authorizer_name
    }
  }

  dynamic "tls_config" {
    for_each = each.value.tls_config != null ? each.value.tls_config : []
    content {
      security_policy = tls_config.value.security_policy
    }
  }
}
