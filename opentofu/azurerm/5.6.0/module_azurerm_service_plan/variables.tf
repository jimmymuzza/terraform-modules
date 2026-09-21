variable "service_plans" {
  description = <<EOT
Map of service_plans, attributes below
Required:
    - location
    - name
    - os_type
    - resource_group_name
    - sku_name
Optional:
    - app_service_environment_id
    - maximum_elastic_worker_count
    - per_site_scaling_enabled
    - premium_plan_auto_scale_enabled
    - tags
    - worker_count
    - zone_balancing_enabled
EOT

  type = map(object({
    location                        = string
    name                            = string
    os_type                         = string
    resource_group_name             = string
    sku_name                        = string
    app_service_environment_id      = optional(string)
    maximum_elastic_worker_count    = optional(number)
    per_site_scaling_enabled        = optional(bool)
    premium_plan_auto_scale_enabled = optional(bool)
    tags                            = optional(map(string))
    worker_count                    = optional(number)
    zone_balancing_enabled          = optional(bool)
  }))
}
