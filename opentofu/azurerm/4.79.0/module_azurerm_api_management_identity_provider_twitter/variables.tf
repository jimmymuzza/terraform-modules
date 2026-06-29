variable "api_management_identity_provider_twitters" {
  description = <<EOT
Map of api_management_identity_provider_twitters, attributes below
Required:
    - api_key
    - api_management_name
    - api_secret_key
    - resource_group_name
EOT

  type = map(object({
    api_key             = string
    api_management_name = string
    api_secret_key      = string
    resource_group_name = string
  }))
}
