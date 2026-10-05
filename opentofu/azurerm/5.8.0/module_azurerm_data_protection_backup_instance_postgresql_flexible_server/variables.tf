variable "data_protection_backup_instance_postgresql_flexible_servers" {
  description = <<EOT
Map of data_protection_backup_instance_postgresql_flexible_servers, attributes below
Required:
    - backup_policy_id
    - location
    - name
    - server_id
    - vault_id
EOT

  type = map(object({
    backup_policy_id = string
    location         = string
    name             = string
    server_id        = string
    vault_id         = string
  }))
}
