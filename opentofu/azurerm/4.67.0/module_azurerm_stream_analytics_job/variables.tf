variable "stream_analytics_jobs" {
  description = <<EOT
Map of stream_analytics_jobs, attributes below
Required:
    - location
    - name
    - resource_group_name
    - transformation_query
Optional:
    - compatibility_level
    - content_storage_policy
    - data_locale
    - events_late_arrival_max_delay_in_seconds
    - events_out_of_order_max_delay_in_seconds
    - events_out_of_order_policy
    - output_error_policy
    - sku_name
    - stream_analytics_cluster_id
    - streaming_units
    - tags
    - type
    - identity
    - job_storage_account
EOT

  type = map(object({
    location                                 = string
    name                                     = string
    resource_group_name                      = string
    transformation_query                     = string
    compatibility_level                      = optional(string)
    content_storage_policy                   = optional(string)
    data_locale                              = optional(string)
    events_late_arrival_max_delay_in_seconds = optional(number)
    events_out_of_order_max_delay_in_seconds = optional(number)
    events_out_of_order_policy               = optional(string)
    output_error_policy                      = optional(string)
    sku_name                                 = optional(string)
    stream_analytics_cluster_id              = optional(string)
    streaming_units                          = optional(number)
    tags                                     = optional(map(string))
    type                                     = optional(string)
    identity                                 = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    job_storage_account                      = optional(list(object({
            account_name        = string
            account_key         = optional(string)
            authentication_mode = optional(string)
        })))
  }))
}
