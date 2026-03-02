variable "service_discovery_services" {
  description = <<EOT
Map of service_discovery_services, attributes below
Required:
    - name
Optional:
    - description
    - force_destroy
    - namespace_id
    - region
    - tags
    - tags_all
    - type
    - dns_config
    - health_check_config
    - health_check_custom_config
EOT

  type = map(object({
    name                       = string
    description                = optional(string)
    force_destroy              = optional(bool)
    namespace_id               = optional(string)
    region                     = optional(string)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
    type                       = optional(string)
    dns_config                 = optional(list(object({
            namespace_id   = string
            routing_policy = optional(string)
            dns_records    = list(object({
                ttl  = number
                type = string
            }))
        })))
    health_check_config        = optional(list(object({
            failure_threshold = optional(number)
            resource_path     = optional(string)
            type              = optional(string)
        })))
    health_check_custom_config = optional(list(object({
            failure_threshold = optional(number)
        })))
  }))
}
