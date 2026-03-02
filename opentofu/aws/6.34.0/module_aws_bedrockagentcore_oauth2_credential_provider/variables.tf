variable "bedrockagentcore_oauth2_credential_providers" {
  description = <<EOT
Map of bedrockagentcore_oauth2_credential_providers, attributes below
Required:
    - credential_provider_vendor
    - name
Optional:
    - region
    - tags
    - oauth2_provider_config
EOT

  type = map(object({
    credential_provider_vendor = string
    name                       = string
    region                     = optional(string)
    tags                       = optional(map(string))
    oauth2_provider_config     = optional(list(object({
            custom_oauth2_provider_config     = optional(list(object({
                client_credentials_wo_version = optional(number)
                client_id                     = optional(string)
                client_id_wo                  = optional(string)
                client_secret                 = optional(string)
                client_secret_wo              = optional(string)
                oauth_discovery               = optional(list(object({
                    discovery_url                 = optional(string)
                    authorization_server_metadata = optional(list(object({
                        authorization_endpoint = string
                        issuer                 = string
                        token_endpoint         = string
                        response_types         = optional(set(string))
                    })))
                })))
            })))
            github_oauth2_provider_config     = optional(list(object({
                client_credentials_wo_version = optional(number)
                client_id                     = optional(string)
                client_id_wo                  = optional(string)
                client_secret                 = optional(string)
                client_secret_wo              = optional(string)
            })))
            google_oauth2_provider_config     = optional(list(object({
                client_credentials_wo_version = optional(number)
                client_id                     = optional(string)
                client_id_wo                  = optional(string)
                client_secret                 = optional(string)
                client_secret_wo              = optional(string)
            })))
            microsoft_oauth2_provider_config  = optional(list(object({
                client_credentials_wo_version = optional(number)
                client_id                     = optional(string)
                client_id_wo                  = optional(string)
                client_secret                 = optional(string)
                client_secret_wo              = optional(string)
            })))
            salesforce_oauth2_provider_config = optional(list(object({
                client_credentials_wo_version = optional(number)
                client_id                     = optional(string)
                client_id_wo                  = optional(string)
                client_secret                 = optional(string)
                client_secret_wo              = optional(string)
            })))
            slack_oauth2_provider_config      = optional(list(object({
                client_credentials_wo_version = optional(number)
                client_id                     = optional(string)
                client_id_wo                  = optional(string)
                client_secret                 = optional(string)
                client_secret_wo              = optional(string)
            })))
        })))
  }))
}
