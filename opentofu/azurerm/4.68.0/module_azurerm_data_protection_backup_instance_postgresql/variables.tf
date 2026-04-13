variable "data_protection_backup_instance_postgresqls" {
  description = <<EOT
Map of data_protection_backup_instance_postgresqls, attributes below
Required:
    - backup_policy_id
    - database_id
    - location
    - name
    - vault_id
Optional:
    - database_credential_key_vault_secret_id
EOT

  type = map(object({
    backup_policy_id                        = string
    database_id                             = string
    location                                = string
    name                                    = string
    vault_id                                = string
    database_credential_key_vault_secret_id = optional(string)
  }))
}
