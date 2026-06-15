variable "autoscaling_lifecycle_hooks" {
  description = <<EOT
Map of autoscaling_lifecycle_hooks, attributes below
Required:
    - autoscaling_group_name
    - lifecycle_transition
    - name
Optional:
    - default_result
    - heartbeat_timeout
    - notification_metadata
    - notification_target_arn
    - region
    - role_arn
EOT

  type = map(object({
    autoscaling_group_name  = string
    lifecycle_transition    = string
    name                    = string
    default_result          = optional(string)
    heartbeat_timeout       = optional(number)
    notification_metadata   = optional(string)
    notification_target_arn = optional(string)
    region                  = optional(string)
    role_arn                = optional(string)
  }))
}
