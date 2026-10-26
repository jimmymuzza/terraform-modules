resource "aws_cloudwatchomni_domain" "cloudwatchomni_domains" {
  for_each = var.cloudwatchomni_domains

  identity_providers = each.value.identity_providers
  name               = each.value.name
  region             = each.value.region

  dynamic "identity_provider_configuration" {
    for_each = each.value.identity_provider_configuration != null ? each.value.identity_provider_configuration : []
    content {

      dynamic "identity_center_configuration" {
        for_each = identity_provider_configuration.value.identity_center_configuration != null ? identity_provider_configuration.value.identity_center_configuration : []
        content {
          identity_center_instance_arn = identity_center_configuration.value.identity_center_instance_arn
        }
      }
    }
  }
}
