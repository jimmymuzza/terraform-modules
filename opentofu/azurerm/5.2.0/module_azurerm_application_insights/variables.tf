variable "application_insights" {
  description = <<EOT
Map of application_insights, attributes below
Required:
    - application_type
    - location
    - name
    - resource_group_name
Optional:
    - daily_data_cap_in_gb
    - daily_data_cap_notifications_enabled
    - force_customer_storage_for_profiler
    - internet_ingestion_enabled
    - internet_query_enabled
    - ip_masking_enabled
    - local_authentication_enabled
    - retention_in_days
    - sampling_percentage
    - tags
    - workspace_id
EOT

  type = map(object({
    application_type                     = string
    location                             = string
    name                                 = string
    resource_group_name                  = string
    daily_data_cap_in_gb                 = optional(number)
    daily_data_cap_notifications_enabled = optional(bool)
    force_customer_storage_for_profiler  = optional(bool)
    internet_ingestion_enabled           = optional(bool)
    internet_query_enabled               = optional(bool)
    ip_masking_enabled                   = optional(bool)
    local_authentication_enabled         = optional(bool)
    retention_in_days                    = optional(number)
    sampling_percentage                  = optional(number)
    tags                                 = optional(map(string))
    workspace_id                         = optional(string)
  }))
}
