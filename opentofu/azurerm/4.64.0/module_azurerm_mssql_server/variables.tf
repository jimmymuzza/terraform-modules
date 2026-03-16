variable "mssql_servers" {
  description = <<EOT
Map of mssql_servers, attributes below
Required:
    - location
    - name
    - resource_group_name
    - version
Optional:
    - administrator_login
    - administrator_login_password
    - administrator_login_password_wo
    - administrator_login_password_wo_version
    - connection_policy
    - express_vulnerability_assessment_enabled
    - minimum_tls_version
    - outbound_network_restriction_enabled
    - primary_user_assigned_identity_id
    - public_network_access_enabled
    - tags
    - transparent_data_encryption_key_vault_key_id
    - azuread_administrator
    - identity
EOT

  type = map(object({
    location                                     = string
    name                                         = string
    resource_group_name                          = string
    version                                      = string
    administrator_login                          = optional(string)
    administrator_login_password                 = optional(string)
    administrator_login_password_wo              = optional(string)
    administrator_login_password_wo_version      = optional(number)
    connection_policy                            = optional(string)
    express_vulnerability_assessment_enabled     = optional(bool)
    minimum_tls_version                          = optional(string)
    outbound_network_restriction_enabled         = optional(bool)
    primary_user_assigned_identity_id            = optional(string)
    public_network_access_enabled                = optional(bool)
    tags                                         = optional(map(string))
    transparent_data_encryption_key_vault_key_id = optional(string)
    azuread_administrator                        = optional(list(object({
            login_username              = string
            object_id                   = string
            azuread_authentication_only = optional(bool)
            tenant_id                   = optional(string)
        })))
    identity                                     = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
