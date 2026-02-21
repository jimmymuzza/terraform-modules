variable "bedrockagentcore_api_key_credential_providers" {
  description = <<EOT
Map of bedrockagentcore_api_key_credential_providers, attributes below
Required:
    - name
Optional:
    - api_key
    - api_key_wo
    - api_key_wo_version
    - region
EOT

  type = map(object({
    name               = string
    api_key            = optional(string)
    api_key_wo         = optional(string)
    api_key_wo_version = optional(number)
    region             = optional(string)
  }))
}
