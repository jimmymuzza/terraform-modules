variable "api_management_identity_provider_aads" {
  description = <<EOT
Map of api_management_identity_provider_aads, attributes below
Required:
    - allowed_tenants
    - api_management_name
    - client_id
    - client_secret
    - resource_group_name
Optional:
    - client_library
    - signin_tenant
EOT

  type = map(object({
    allowed_tenants     = list(string)
    api_management_name = string
    client_id           = string
    client_secret       = string
    resource_group_name = string
    client_library      = optional(string)
    signin_tenant       = optional(string)
  }))
}
