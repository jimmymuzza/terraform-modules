variable "ssm_patch_groups" {
  description = <<EOT
Map of ssm_patch_groups, attributes below
Required:
    - baseline_id
    - patch_group
Optional:
    - region
EOT

  type = map(object({
    baseline_id = string
    patch_group = string
    region      = optional(string)
  }))
}
