variable "key_vault_managed_storage_account_sas_token_definitions" {
  description = <<EOT
Map of key_vault_managed_storage_account_sas_token_definitions, attributes below
Required:
    - managed_storage_account_id
    - name
    - sas_template_uri
    - sas_type
    - validity_period
Optional:
    - tags
EOT

  type = map(object({
    managed_storage_account_id = string
    name                       = string
    sas_template_uri           = string
    sas_type                   = string
    validity_period            = string
    tags                       = optional(map(string))
  }))
}
