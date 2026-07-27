resource "aws_cloudtrail" "cloudtrails" {
  for_each = var.cloudtrails

  name                          = each.value.name
  s3_bucket_name                = each.value.s3_bucket_name
  cloud_watch_logs_group_arn    = each.value.cloud_watch_logs_group_arn
  cloud_watch_logs_role_arn     = each.value.cloud_watch_logs_role_arn
  enable_log_file_validation    = each.value.enable_log_file_validation
  enable_logging                = each.value.enable_logging
  include_global_service_events = each.value.include_global_service_events
  is_multi_region_trail         = each.value.is_multi_region_trail
  is_organization_trail         = each.value.is_organization_trail
  kms_key_id                    = each.value.kms_key_id
  region                        = each.value.region
  s3_key_prefix                 = each.value.s3_key_prefix
  sns_topic_name                = each.value.sns_topic_name
  tags                          = each.value.tags
  tags_all                      = each.value.tags_all

  dynamic "advanced_event_selector" {
    for_each = each.value.advanced_event_selector != null ? each.value.advanced_event_selector : []
    content {
      name = advanced_event_selector.value.name

      dynamic "field_selector" {
        for_each = advanced_event_selector.value.field_selector != null ? advanced_event_selector.value.field_selector : []
        content {
          field           = field_selector.value.field
          ends_with       = field_selector.value.ends_with
          equals          = field_selector.value.equals
          not_ends_with   = field_selector.value.not_ends_with
          not_equals      = field_selector.value.not_equals
          not_starts_with = field_selector.value.not_starts_with
          starts_with     = field_selector.value.starts_with
        }
      }
    }
  }

  dynamic "event_selector" {
    for_each = each.value.event_selector != null ? each.value.event_selector : []
    content {
      exclude_management_event_sources = event_selector.value.exclude_management_event_sources
      include_management_events        = event_selector.value.include_management_events
      read_write_type                  = event_selector.value.read_write_type

      dynamic "data_resource" {
        for_each = event_selector.value.data_resource != null ? event_selector.value.data_resource : []
        content {
          type   = data_resource.value.type
          values = data_resource.value.values
        }
      }
    }
  }

  dynamic "insight_selector" {
    for_each = each.value.insight_selector != null ? each.value.insight_selector : []
    content {
      insight_type = insight_selector.value.insight_type
    }
  }
}
