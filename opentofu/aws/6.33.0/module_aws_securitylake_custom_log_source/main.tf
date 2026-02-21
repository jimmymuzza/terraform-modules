resource "aws_securitylake_custom_log_source" "securitylake_custom_log_sources" {
  for_each = var.securitylake_custom_log_sources

  source_name    = each.value.source_name
  event_classes  = each.value.event_classes
  region         = each.value.region
  source_version = each.value.source_version

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {

      dynamic "crawler_configuration" {
        for_each = configuration.value.crawler_configuration != null ? configuration.value.crawler_configuration : []
        content {
          role_arn = crawler_configuration.value.role_arn
        }
      }

      dynamic "provider_identity" {
        for_each = configuration.value.provider_identity != null ? configuration.value.provider_identity : []
        content {
          external_id = provider_identity.value.external_id
          principal   = provider_identity.value.principal
        }
      }
    }
  }
}
