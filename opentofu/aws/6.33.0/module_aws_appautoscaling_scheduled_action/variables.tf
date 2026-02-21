variable "appautoscaling_scheduled_actions" {
  description = <<EOT
Map of appautoscaling_scheduled_actions, attributes below
Required:
    - name
    - resource_id
    - scalable_dimension
    - schedule
    - service_namespace
    - scalable_target_action
Optional:
    - end_time
    - region
    - start_time
    - timezone
EOT

  type = map(object({
    name                   = string
    resource_id            = string
    scalable_dimension     = string
    schedule               = string
    service_namespace      = string
    end_time               = optional(string)
    region                 = optional(string)
    start_time             = optional(string)
    timezone               = optional(string)
    scalable_target_action = list(object({
            max_capacity = optional(string)
            min_capacity = optional(string)
        }))
  }))
}
