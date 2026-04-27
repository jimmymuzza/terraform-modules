variable "postgresql_server_keys" {
  description = <<EOT
Map of postgresql_server_keys, attributes below
Required:
    - key_vault_key_id
    - server_id
EOT

  type = map(object({
    key_vault_key_id = string
    server_id        = string
  }))
}
