variable "api_management_apis" {
  description = <<EOT
Map of api_management_apis, attributes below
Required:
    - api_management_name
    - name
    - resource_group_name
    - revision
Optional:
    - api_type
    - description
    - display_name
    - path
    - protocols
    - revision_description
    - service_url
    - source_api_id
    - subscription_required
    - terms_of_service_url
    - version
    - version_description
    - version_set_id
    - contact
    - import
    - license
    - oauth2_authorization
    - openid_authentication
    - subscription_key_parameter_names
EOT

  type = map(object({
    api_management_name              = string
    name                             = string
    resource_group_name              = string
    revision                         = string
    api_type                         = optional(string)
    description                      = optional(string)
    display_name                     = optional(string)
    path                             = optional(string)
    protocols                        = optional(set(string))
    revision_description             = optional(string)
    service_url                      = optional(string)
    source_api_id                    = optional(string)
    subscription_required            = optional(bool)
    terms_of_service_url             = optional(string)
    version                          = optional(string)
    version_description              = optional(string)
    version_set_id                   = optional(string)
    contact                          = optional(list(object({
            email = optional(string)
            name  = optional(string)
            url   = optional(string)
        })))
    import                           = optional(list(object({
            content_format = string
            content_value  = string
            wsdl_selector  = optional(list(object({
                endpoint_name = string
                service_name  = string
            })))
        })))
    license                          = optional(list(object({
            name = optional(string)
            url  = optional(string)
        })))
    oauth2_authorization             = optional(list(object({
            authorization_server_name = string
            scope                     = optional(string)
        })))
    openid_authentication            = optional(list(object({
            openid_provider_name         = string
            bearer_token_sending_methods = optional(set(string))
        })))
    subscription_key_parameter_names = optional(list(object({
            header = string
            query  = string
        })))
  }))
}
