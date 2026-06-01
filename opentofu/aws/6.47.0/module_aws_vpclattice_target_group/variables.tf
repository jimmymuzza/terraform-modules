variable "vpclattice_target_groups" {
  description = <<EOT
Map of vpclattice_target_groups, attributes below
Required:
    - name
    - type
Optional:
    - region
    - tags
    - tags_all
    - config
EOT

  type = map(object({
    name     = string
    type     = string
    region   = optional(string)
    tags     = optional(map(string))
    tags_all = optional(map(string))
    config   = optional(list(object({
            ip_address_type                = optional(string)
            lambda_event_structure_version = optional(string)
            port                           = optional(number)
            protocol                       = optional(string)
            protocol_version               = optional(string)
            vpc_identifier                 = optional(string)
            health_check                   = optional(list(object({
                enabled                       = optional(bool)
                health_check_interval_seconds = optional(number)
                health_check_timeout_seconds  = optional(number)
                healthy_threshold_count       = optional(number)
                path                          = optional(string)
                port                          = optional(number)
                protocol                      = optional(string)
                protocol_version              = optional(string)
                unhealthy_threshold_count     = optional(number)
                matcher                       = optional(list(object({
                    value = optional(string)
                })))
            })))
        })))
  }))
}
