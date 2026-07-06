variable "log_analytics_workspaces" {
  description = <<EOT
Map of log_analytics_workspaces, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - allow_resource_only_permissions
    - cmk_for_query_forced
    - daily_quota_gb
    - data_collection_rule_id
    - immediate_data_purge_on_30_days_enabled
    - internet_ingestion_enabled
    - internet_query_enabled
    - local_authentication_disabled
    - local_authentication_enabled
    - reservation_capacity_in_gb_per_day
    - retention_in_days
    - sku
    - tags
    - identity
EOT

  type = map(object({
    location                                = string
    name                                    = string
    resource_group_name                     = string
    allow_resource_only_permissions         = optional(bool)
    cmk_for_query_forced                    = optional(bool)
    daily_quota_gb                          = optional(number)
    data_collection_rule_id                 = optional(string)
    immediate_data_purge_on_30_days_enabled = optional(bool)
    internet_ingestion_enabled              = optional(bool)
    internet_query_enabled                  = optional(bool)
    local_authentication_disabled           = optional(bool)
    local_authentication_enabled            = optional(bool)
    reservation_capacity_in_gb_per_day      = optional(number)
    retention_in_days                       = optional(number)
    sku                                     = optional(string)
    tags                                    = optional(map(string))
    identity                                = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
