resource "aws_securitylake_subscriber" "securitylake_subscribers" {
  for_each = var.securitylake_subscribers

  access_type            = each.value.access_type
  region                 = each.value.region
  subscriber_description = each.value.subscriber_description
  subscriber_name        = each.value.subscriber_name
  tags                   = each.value.tags

  dynamic "source" {
    for_each = each.value.source != null ? each.value.source : []
    content {

      dynamic "aws_log_source_resource" {
        for_each = source.value.aws_log_source_resource != null ? source.value.aws_log_source_resource : []
        content {
          source_name    = aws_log_source_resource.value.source_name
          source_version = aws_log_source_resource.value.source_version
        }
      }

      dynamic "custom_log_source_resource" {
        for_each = source.value.custom_log_source_resource != null ? source.value.custom_log_source_resource : []
        content {
          source_name    = custom_log_source_resource.value.source_name
          source_version = custom_log_source_resource.value.source_version
        }
      }
    }
  }

  dynamic "subscriber_identity" {
    for_each = each.value.subscriber_identity != null ? each.value.subscriber_identity : []
    content {
      external_id = subscriber_identity.value.external_id
      principal   = subscriber_identity.value.principal
    }
  }
}
