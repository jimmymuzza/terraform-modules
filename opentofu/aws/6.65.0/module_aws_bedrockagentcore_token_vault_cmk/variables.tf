variable "bedrockagentcore_token_vault_cmks" {
  description = <<EOT
Map of bedrockagentcore_token_vault_cmks, attributes below
Optional:
    - region
    - token_vault_id
    - kms_configuration
EOT

  type = map(object({
    region            = optional(string)
    token_vault_id    = optional(string)
    kms_configuration = optional(list(object({
            key_type    = string
            kms_key_arn = optional(string)
        })))
  }))
}
