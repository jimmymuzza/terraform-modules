variable "controltower_baselines" {
  description = <<EOT
Map of controltower_baselines, attributes below
Required:
    - baseline_identifier
    - baseline_version
    - target_identifier
Optional:
    - region
    - tags
    - parameters
EOT

  type = map(object({
    baseline_identifier = string
    baseline_version    = string
    target_identifier   = string
    region              = optional(string)
    tags                = optional(map(string))
    parameters          = optional(list(object({
            key   = string
            value = string
        })))
  }))
}
