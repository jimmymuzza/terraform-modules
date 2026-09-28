variable "backup_vault_lock_configurations" {
  description = <<EOT
Map of backup_vault_lock_configurations, attributes below
Required:
    - backup_vault_name
Optional:
    - changeable_for_days
    - max_retention_days
    - min_retention_days
    - region
EOT

  type = map(object({
    backup_vault_name   = string
    changeable_for_days = optional(number)
    max_retention_days  = optional(number)
    min_retention_days  = optional(number)
    region              = optional(string)
  }))
}
