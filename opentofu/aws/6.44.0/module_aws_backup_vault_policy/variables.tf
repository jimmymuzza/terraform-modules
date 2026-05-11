variable "backup_vault_policies" {
  description = <<EOT
Map of backup_vault_policies, attributes below
Required:
    - backup_vault_name
    - policy
Optional:
    - region
EOT

  type = map(object({
    backup_vault_name = string
    policy            = string
    region            = optional(string)
  }))
}
