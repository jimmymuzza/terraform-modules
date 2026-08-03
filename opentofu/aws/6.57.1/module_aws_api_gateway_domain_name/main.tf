resource "aws_api_gateway_domain_name" "api_gateway_domain_names" {
  for_each = var.api_gateway_domain_names

  domain_name                            = each.value.domain_name
  certificate_arn                        = each.value.certificate_arn
  certificate_body                       = each.value.certificate_body
  certificate_chain                      = each.value.certificate_chain
  certificate_name                       = each.value.certificate_name
  certificate_private_key                = each.value.certificate_private_key
  endpoint_access_mode                   = each.value.endpoint_access_mode
  ownership_verification_certificate_arn = each.value.ownership_verification_certificate_arn
  policy                                 = each.value.policy
  region                                 = each.value.region
  regional_certificate_arn               = each.value.regional_certificate_arn
  regional_certificate_name              = each.value.regional_certificate_name
  routing_mode                           = each.value.routing_mode
  security_policy                        = each.value.security_policy
  tags                                   = each.value.tags
  tags_all                               = each.value.tags_all

  dynamic "endpoint_configuration" {
    for_each = each.value.endpoint_configuration != null ? each.value.endpoint_configuration : []
    content {
      types           = endpoint_configuration.value.types
      ip_address_type = endpoint_configuration.value.ip_address_type
    }
  }

  dynamic "mutual_tls_authentication" {
    for_each = each.value.mutual_tls_authentication != null ? each.value.mutual_tls_authentication : []
    content {
      truststore_uri     = mutual_tls_authentication.value.truststore_uri
      truststore_version = mutual_tls_authentication.value.truststore_version
    }
  }
}
