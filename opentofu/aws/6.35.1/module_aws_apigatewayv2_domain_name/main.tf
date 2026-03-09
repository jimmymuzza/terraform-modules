resource "aws_apigatewayv2_domain_name" "apigatewayv2_domain_names" {
  for_each = var.apigatewayv2_domain_names

  domain_name  = each.value.domain_name
  region       = each.value.region
  routing_mode = each.value.routing_mode
  tags         = each.value.tags
  tags_all     = each.value.tags_all

  dynamic "domain_name_configuration" {
    for_each = each.value.domain_name_configuration != null ? each.value.domain_name_configuration : []
    content {
      certificate_arn                        = domain_name_configuration.value.certificate_arn
      endpoint_type                          = domain_name_configuration.value.endpoint_type
      security_policy                        = domain_name_configuration.value.security_policy
      ip_address_type                        = domain_name_configuration.value.ip_address_type
      ownership_verification_certificate_arn = domain_name_configuration.value.ownership_verification_certificate_arn
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
