variable "api_management_identity_provider_googles" {
  description = <<EOT
Map of api_management_identity_provider_googles, attributes below
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
