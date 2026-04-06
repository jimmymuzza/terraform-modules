variable "key_vaults" {
  description = <<EOT
Map of key_vaults, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
    - tenant_id
Optional:
    - access_policy
    - enable_rbac_authorization
    - enabled_for_deployment
    - enabled_for_disk_encryption
    - enabled_for_template_deployment
    - public_network_access_enabled
    - purge_protection_enabled
    - rbac_authorization_enabled
    - soft_delete_retention_days
    - tags
    - contact
    - network_acls
EOT

  type = map(object({
    location                        = string
    name                            = string
    resource_group_name             = string
    sku_name                        = string
    tenant_id                       = string
    access_policy                   = optional(list(object({
            application_id = string
            certificate_permissions = list(string)
            key_permissions = list(string)
            object_id = string
            secret_permissions = list(string)
            storage_permissions = list(string)
            tenant_id = string
        })))
    enable_rbac_authorization       = optional(bool)
    enabled_for_deployment          = optional(bool)
    enabled_for_disk_encryption     = optional(bool)
    enabled_for_template_deployment = optional(bool)
    public_network_access_enabled   = optional(bool)
    purge_protection_enabled        = optional(bool)
    rbac_authorization_enabled      = optional(bool)
    soft_delete_retention_days      = optional(number)
    tags                            = optional(map(string))
    contact                         = optional(set(object({
            email = string
            name  = optional(string)
            phone = optional(string)
        })))
    network_acls                    = optional(list(object({
            bypass                     = string
            default_action             = string
            ip_rules                   = optional(set(string))
            virtual_network_subnet_ids = optional(set(string))
        })))
  }))
}
