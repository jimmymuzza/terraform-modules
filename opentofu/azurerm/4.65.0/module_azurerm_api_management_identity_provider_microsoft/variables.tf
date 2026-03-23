variable "api_management_identity_provider_microsofts" {
  description = <<EOT
Map of api_management_identity_provider_microsofts, attributes below
Required:
    - api_management_name
    - client_id
    - client_secret
    - resource_group_name
EOT

  type = map(object({
    api_management_name = string
    client_id           = string
    client_secret       = string
    resource_group_name = string
  }))
}
