variable "ssm_maintenance_window_targets" {
  description = <<EOT
Map of ssm_maintenance_window_targets, attributes below
Required:
    - resource_type
    - window_id
    - targets
Optional:
    - description
    - name
    - owner_information
    - region
EOT

  type = map(object({
    resource_type     = string
    window_id         = string
    description       = optional(string)
    name              = optional(string)
    owner_information = optional(string)
    region            = optional(string)
    targets           = list(object({
            key    = string
            values = list(string)
        }))
  }))
}
