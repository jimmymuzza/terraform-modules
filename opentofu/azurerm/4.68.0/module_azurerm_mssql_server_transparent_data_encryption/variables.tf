variable "mssql_server_transparent_data_encryptions" {
  description = <<EOT
Map of mssql_server_transparent_data_encryptions, attributes below
Required:
    - server_id
Optional:
    - auto_rotation_enabled
    - key_vault_key_id
    - managed_hsm_key_id
EOT

  type = map(object({
    server_id             = string
    auto_rotation_enabled = optional(bool)
    key_vault_key_id      = optional(string)
    managed_hsm_key_id    = optional(string)
  }))
}
