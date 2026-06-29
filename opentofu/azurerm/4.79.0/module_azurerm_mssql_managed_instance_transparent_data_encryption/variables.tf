variable "mssql_managed_instance_transparent_data_encryptions" {
  description = <<EOT
Map of mssql_managed_instance_transparent_data_encryptions, attributes below
Required:
    - managed_instance_id
Optional:
    - auto_rotation_enabled
    - key_vault_key_id
    - managed_hsm_key_id
EOT

  type = map(object({
    managed_instance_id   = string
    auto_rotation_enabled = optional(bool)
    key_vault_key_id      = optional(string)
    managed_hsm_key_id    = optional(string)
  }))
}
