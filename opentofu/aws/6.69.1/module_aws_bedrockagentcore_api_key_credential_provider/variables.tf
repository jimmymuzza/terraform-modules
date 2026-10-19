variable "bedrockagentcore_api_key_credential_providers" {
  description = <<EOT
Map of bedrockagentcore_api_key_credential_providers, attributes below
Required:
    - name
Optional:
    - api_key
    - api_key_secret_source
    - api_key_wo
    - api_key_wo_version
    - region
    - tags
    - api_key_secret_config
EOT

  type = map(object({
    name                  = string
    api_key               = optional(string)
    api_key_secret_source = optional(string)
    api_key_wo            = optional(string)
    api_key_wo_version    = optional(number)
    region                = optional(string)
    tags                  = optional(map(string))
    api_key_secret_config = optional(list(object({
            json_key  = string
            secret_id = string
        })))
  }))
}
