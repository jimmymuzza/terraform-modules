variable "redshiftserverless_workgroups" {
  description = <<EOT
Map of redshiftserverless_workgroups, attributes below
Required:
    - namespace_name
    - workgroup_name
Optional:
    - base_capacity
    - enhanced_vpc_routing
    - max_capacity
    - port
    - publicly_accessible
    - region
    - security_group_ids
    - subnet_ids
    - tags
    - tags_all
    - track_name
    - config_parameter
    - price_performance_target
EOT

  type = map(object({
    namespace_name           = string
    workgroup_name           = string
    base_capacity            = optional(number)
    enhanced_vpc_routing     = optional(bool)
    max_capacity             = optional(number)
    port                     = optional(number)
    publicly_accessible      = optional(bool)
    region                   = optional(string)
    security_group_ids       = optional(set(string))
    subnet_ids               = optional(set(string))
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    track_name               = optional(string)
    config_parameter         = optional(set(object({
            parameter_key   = string
            parameter_value = string
        })))
    price_performance_target = optional(list(object({
            enabled = bool
            level   = optional(number)
        })))
  }))
}
