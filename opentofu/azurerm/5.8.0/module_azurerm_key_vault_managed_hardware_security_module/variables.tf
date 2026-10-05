variable "key_vault_managed_hardware_security_modules" {
  description = <<EOT
Map of key_vault_managed_hardware_security_modules, attributes below
Required:
    - admin_object_ids
    - location
    - name
    - resource_group_name
    - sku_name
    - tenant_id
Optional:
    - public_network_access_enabled
    - purge_protection_enabled
    - security_domain_key_vault_certificate_ids
    - security_domain_quorum
    - soft_delete_retention_days
    - tags
    - network_acls
EOT

  type = map(object({
    admin_object_ids                          = set(string)
    location                                  = string
    name                                      = string
    resource_group_name                       = string
    sku_name                                  = string
    tenant_id                                 = string
    public_network_access_enabled             = optional(bool)
    purge_protection_enabled                  = optional(bool)
    security_domain_key_vault_certificate_ids = optional(list(string))
    security_domain_quorum                    = optional(number)
    soft_delete_retention_days                = optional(number)
    tags                                      = optional(map(string))
    network_acls                              = optional(list(object({
            bypass         = string
            default_action = string
        })))
  }))
}
