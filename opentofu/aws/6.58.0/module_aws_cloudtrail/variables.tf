variable "cloudtrails" {
  description = <<EOT
Map of cloudtrails, attributes below
Required:
    - name
    - s3_bucket_name
Optional:
    - cloud_watch_logs_group_arn
    - cloud_watch_logs_role_arn
    - enable_log_file_validation
    - enable_logging
    - include_global_service_events
    - is_multi_region_trail
    - is_organization_trail
    - kms_key_id
    - region
    - s3_key_prefix
    - sns_topic_name
    - tags
    - tags_all
    - advanced_event_selector
    - event_selector
    - insight_selector
EOT

  type = map(object({
    name                          = string
    s3_bucket_name                = string
    cloud_watch_logs_group_arn    = optional(string)
    cloud_watch_logs_role_arn     = optional(string)
    enable_log_file_validation    = optional(bool)
    enable_logging                = optional(bool)
    include_global_service_events = optional(bool)
    is_multi_region_trail         = optional(bool)
    is_organization_trail         = optional(bool)
    kms_key_id                    = optional(string)
    region                        = optional(string)
    s3_key_prefix                 = optional(string)
    sns_topic_name                = optional(string)
    tags                          = optional(map(string))
    tags_all                      = optional(map(string))
    advanced_event_selector       = optional(list(object({
            name           = optional(string)
            field_selector = set(object({
                field           = string
                ends_with       = optional(list(string))
                equals          = optional(list(string))
                not_ends_with   = optional(list(string))
                not_equals      = optional(list(string))
                not_starts_with = optional(list(string))
                starts_with     = optional(list(string))
            }))
        })))
    event_selector                = optional(list(object({
            exclude_management_event_sources = optional(set(string))
            include_management_events        = optional(bool)
            read_write_type                  = optional(string)
            data_resource                    = optional(list(object({
                type   = string
                values = list(string)
            })))
        })))
    insight_selector              = optional(set(object({
            insight_type = string
        })))
  }))
}
