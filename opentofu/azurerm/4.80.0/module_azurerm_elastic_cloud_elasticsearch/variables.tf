variable "elastic_cloud_elasticsearches" {
  description = <<EOT
Map of elastic_cloud_elasticsearches, attributes below
Required:
    - elastic_cloud_email_address
    - location
    - name
    - resource_group_name
    - sku_name
Optional:
    - monitoring_enabled
    - tags
    - logs
EOT

  type = map(object({
    elastic_cloud_email_address = string
    location                    = string
    name                        = string
    resource_group_name         = string
    sku_name                    = string
    monitoring_enabled          = optional(bool)
    tags                        = optional(map(string))
    logs                        = optional(list(object({
            send_activity_logs     = optional(bool)
            send_azuread_logs      = optional(bool)
            send_subscription_logs = optional(bool)
            filtering_tag          = optional(list(object({
                action = string
                name   = string
                value  = string
            })))
        })))
  }))
}
