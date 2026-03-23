variable "mssql_managed_instances" {
  description = <<EOT
Map of mssql_managed_instances, attributes below
Required:
    - license_type
    - location
    - name
    - resource_group_name
    - sku_name
    - storage_size_in_gb
    - subnet_id
    - vcores
Optional:
    - administrator_login
    - administrator_login_password
    - collation
    - database_format
    - dns_zone_partner_id
    - hybrid_secondary_usage
    - maintenance_configuration_name
    - minimum_tls_version
    - proxy_override
    - public_data_endpoint_enabled
    - service_principal_type
    - storage_account_type
    - tags
    - timezone_id
    - zone_redundant_enabled
    - azure_active_directory_administrator
    - identity
EOT

  type = map(object({
    license_type                         = string
    location                             = string
    name                                 = string
    resource_group_name                  = string
    sku_name                             = string
    storage_size_in_gb                   = number
    subnet_id                            = string
    vcores                               = number
    administrator_login                  = optional(string)
    administrator_login_password         = optional(string)
    collation                            = optional(string)
    database_format                      = optional(string)
    dns_zone_partner_id                  = optional(string)
    hybrid_secondary_usage               = optional(string)
    maintenance_configuration_name       = optional(string)
    minimum_tls_version                  = optional(string)
    proxy_override                       = optional(string)
    public_data_endpoint_enabled         = optional(bool)
    service_principal_type               = optional(string)
    storage_account_type                 = optional(string)
    tags                                 = optional(map(string))
    timezone_id                          = optional(string)
    zone_redundant_enabled               = optional(bool)
    azure_active_directory_administrator = optional(list(object({
            login_username                      = string
            object_id                           = string
            principal_type                      = string
            azuread_authentication_only_enabled = optional(bool)
            tenant_id                           = optional(string)
        })))
    identity                             = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
