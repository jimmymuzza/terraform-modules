variable "automation_accounts" {
  description = <<EOT
Map of automation_accounts, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
Optional:
    - local_authentication_enabled
    - public_network_access_enabled
    - tags
    - encryption
    - identity
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    sku_name                      = string
    local_authentication_enabled  = optional(bool)
    public_network_access_enabled = optional(bool)
    tags                          = optional(map(string))
    encryption                    = optional(list(object({
            key_vault_key_id          = string
            key_source                = optional(string)
            user_assigned_identity_id = optional(string)
        })))
    identity                      = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
