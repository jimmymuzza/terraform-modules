variable "appautoscaling_targets" {
  description = <<EOT
Map of appautoscaling_targets, attributes below
Required:
    - max_capacity
    - min_capacity
    - resource_id
    - scalable_dimension
    - service_namespace
Optional:
    - region
    - role_arn
    - tags
    - tags_all
    - suspended_state
EOT

  type = map(object({
    max_capacity       = number
    min_capacity       = number
    resource_id        = string
    scalable_dimension = string
    service_namespace  = string
    region             = optional(string)
    role_arn           = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    suspended_state    = optional(list(object({
            dynamic_scaling_in_suspended  = optional(bool)
            dynamic_scaling_out_suspended = optional(bool)
            scheduled_scaling_suspended   = optional(bool)
        })))
  }))
}
