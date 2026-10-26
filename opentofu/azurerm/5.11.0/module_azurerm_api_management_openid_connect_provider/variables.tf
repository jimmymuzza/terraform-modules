variable "api_management_openid_connect_providers" {
  description = <<EOT
Map of api_management_openid_connect_providers, attributes below
Required:
    - api_management_name
    - client_id
    - client_secret
    - display_name
    - metadata_endpoint
    - name
    - resource_group_name
Optional:
    - description
EOT

  type = map(object({
    api_management_name = string
    client_id           = string
    client_secret       = string
    display_name        = string
    metadata_endpoint   = string
    name                = string
    resource_group_name = string
    description         = optional(string)
  }))
}
