variable "ssm_default_patch_baselines" {
  description = <<EOT
Map of ssm_default_patch_baselines, attributes below
Required:
    - baseline_id
    - operating_system
Optional:
    - region
EOT

  type = map(object({
    baseline_id      = string
    operating_system = string
    region           = optional(string)
  }))
}
