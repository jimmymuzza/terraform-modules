variable "route53recoveryreadiness_recovery_groups" {
  description = <<EOT
Map of route53recoveryreadiness_recovery_groups, attributes below
Required:
    - recovery_group_name
Optional:
    - cells
    - tags
    - tags_all
EOT

  type = map(object({
    recovery_group_name = string
    cells               = optional(list(string))
    tags                = optional(map(string))
    tags_all            = optional(map(string))
  }))
}
