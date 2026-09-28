variable "api_management_authorization_servers" {
  description = <<EOT
Map of api_management_authorization_servers, attributes below
Required:
    - api_management_name
    - authorization_endpoint
    - authorization_methods
    - client_id
    - client_registration_endpoint
    - display_name
    - grant_types
    - name
    - resource_group_name
Optional:
    - bearer_token_sending_methods
    - client_authentication_method
    - client_secret
    - default_scope
    - description
    - resource_owner_password
    - resource_owner_username
    - support_state
    - token_endpoint
    - token_body_parameter
EOT

  type = map(object({
    api_management_name          = string
    authorization_endpoint       = string
    authorization_methods        = set(string)
    client_id                    = string
    client_registration_endpoint = string
    display_name                 = string
    grant_types                  = set(string)
    name                         = string
    resource_group_name          = string
    bearer_token_sending_methods = optional(set(string))
    client_authentication_method = optional(set(string))
    client_secret                = optional(string)
    default_scope                = optional(string)
    description                  = optional(string)
    resource_owner_password      = optional(string)
    resource_owner_username      = optional(string)
    support_state                = optional(bool)
    token_endpoint               = optional(string)
    token_body_parameter         = optional(list(object({
            name  = string
            value = string
        })))
  }))
}
