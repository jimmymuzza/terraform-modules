variable "frontdoor_custom_https_configurations" {
  description = <<EOT
Map of frontdoor_custom_https_configurations, attributes below
Required:
    - custom_https_provisioning_enabled
    - frontend_endpoint_id
Optional:
    - custom_https_configuration
EOT

  type = map(object({
    custom_https_provisioning_enabled = bool
    frontend_endpoint_id              = string
    custom_https_configuration        = optional(list(object({
            azure_key_vault_certificate_secret_name    = optional(string)
            azure_key_vault_certificate_secret_version = optional(string)
            azure_key_vault_certificate_vault_id       = optional(string)
            certificate_source                         = optional(string)
        })))
  }))
}
