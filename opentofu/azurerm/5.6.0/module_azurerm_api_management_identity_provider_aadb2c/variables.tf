variable "api_management_identity_provider_aadb2cs" {
  description = <<EOT
Map of api_management_identity_provider_aadb2cs, attributes below
Required:
    - allowed_tenant
    - api_management_name
    - authority
    - client_id
    - client_secret
    - resource_group_name
    - signin_policy
    - signin_tenant
    - signup_policy
Optional:
    - client_library
    - password_reset_policy
    - profile_editing_policy
EOT

  type = map(object({
    allowed_tenant         = string
    api_management_name    = string
    authority              = string
    client_id              = string
    client_secret          = string
    resource_group_name    = string
    signin_policy          = string
    signin_tenant          = string
    signup_policy          = string
    client_library         = optional(string)
    password_reset_policy  = optional(string)
    profile_editing_policy = optional(string)
  }))
}
