variable "app_service_plans" {
  description = <<EOT
Map of app_service_plans, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - app_service_environment_id
    - is_xenon
    - kind
    - maximum_elastic_worker_count
    - per_site_scaling
    - reserved
    - tags
    - zone_redundant
EOT

  type = map(object({
    location                     = string
    name                         = string
    resource_group_name          = string
    app_service_environment_id   = optional(string)
    is_xenon                     = optional(bool)
    kind                         = optional(string)
    maximum_elastic_worker_count = optional(number)
    per_site_scaling             = optional(bool)
    reserved                     = optional(bool)
    tags                         = optional(map(string))
    zone_redundant               = optional(bool)
    sku                          = list(object({
            size     = string
            tier     = string
            capacity = optional(number)
        }))
  }))
}
