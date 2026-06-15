variable "ecs_daemons" {
  description = <<EOT
Map of ecs_daemons, attributes below
Required:
    - capacity_provider_arns
    - daemon_task_definition_arn
    - name
Optional:
    - cluster_arn
    - enable_ecs_managed_tags
    - enable_execute_command
    - propagate_tags
    - region
    - tags
    - deployment_configuration
EOT

  type = map(object({
    capacity_provider_arns     = set(string)
    daemon_task_definition_arn = string
    name                       = string
    cluster_arn                = optional(string)
    enable_ecs_managed_tags    = optional(bool)
    enable_execute_command     = optional(bool)
    propagate_tags             = optional(string)
    region                     = optional(string)
    tags                       = optional(map(string))
    deployment_configuration   = optional(list(object({
            bake_time_in_minutes = optional(number)
            drain_percent        = optional(number)
            alarms               = optional(list(object({
                alarm_names = optional(list(string))
                enable      = optional(bool)
            })))
        })))
  }))
}
