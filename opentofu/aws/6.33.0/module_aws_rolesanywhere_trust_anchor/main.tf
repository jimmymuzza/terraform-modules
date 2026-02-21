resource "aws_rolesanywhere_trust_anchor" "rolesanywhere_trust_anchors" {
  for_each = var.rolesanywhere_trust_anchors

  name     = each.value.name
  enabled  = each.value.enabled
  tags     = each.value.tags
  tags_all = each.value.tags_all

  dynamic "notification_settings" {
    for_each = each.value.notification_settings != null ? each.value.notification_settings : []
    content {
      channel   = notification_settings.value.channel
      enabled   = notification_settings.value.enabled
      event     = notification_settings.value.event
      threshold = notification_settings.value.threshold
    }
  }

  dynamic "source" {
    for_each = each.value.source != null ? each.value.source : []
    content {
      source_type = source.value.source_type

      dynamic "source_data" {
        for_each = source.value.source_data != null ? source.value.source_data : []
        content {
          acm_pca_arn           = source_data.value.acm_pca_arn
          x509_certificate_data = source_data.value.x509_certificate_data
        }
      }
    }
  }
}
