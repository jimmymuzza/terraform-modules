resource "aws_cloudtrail_event_data_store" "cloudtrail_event_data_stores" {
  for_each = var.cloudtrail_event_data_stores

  name                           = each.value.name
  billing_mode                   = each.value.billing_mode
  kms_key_id                     = each.value.kms_key_id
  multi_region_enabled           = each.value.multi_region_enabled
  organization_enabled           = each.value.organization_enabled
  region                         = each.value.region
  retention_period               = each.value.retention_period
  suspend                        = each.value.suspend
  tags                           = each.value.tags
  tags_all                       = each.value.tags_all
  termination_protection_enabled = each.value.termination_protection_enabled

  dynamic "advanced_event_selector" {
    for_each = each.value.advanced_event_selector != null ? each.value.advanced_event_selector : []
    content {
      name = advanced_event_selector.value.name

      dynamic "field_selector" {
        for_each = advanced_event_selector.value.field_selector != null ? advanced_event_selector.value.field_selector : []
        content {
          ends_with       = field_selector.value.ends_with
          equals          = field_selector.value.equals
          field           = field_selector.value.field
          not_ends_with   = field_selector.value.not_ends_with
          not_equals      = field_selector.value.not_equals
          not_starts_with = field_selector.value.not_starts_with
          starts_with     = field_selector.value.starts_with
        }
      }
    }
  }
}
