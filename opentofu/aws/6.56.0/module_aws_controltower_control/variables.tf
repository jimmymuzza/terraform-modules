variable "controltower_controls" {
  description = <<EOT
Map of controltower_controls, attributes below
Required:
    - control_identifier
    - target_identifier
Optional:
    - region
    - parameters
EOT

  type = map(object({
    control_identifier = string
    target_identifier  = string
    region             = optional(string)
    parameters         = optional(set(object({
            key   = string
            value = string
        })))
  }))
}
