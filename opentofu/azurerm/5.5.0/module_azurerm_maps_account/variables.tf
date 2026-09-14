variable "maps_accounts" {
  description = <<EOT
Map of maps_accounts, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
Optional:
    - local_authentication_enabled
    - tags
    - cors
    - data_store
    - identity
EOT

  type = map(object({
    location                     = string
    name                         = string
    resource_group_name          = string
    sku_name                     = string
    local_authentication_enabled = optional(bool)
    tags                         = optional(map(string))
    cors                         = optional(list(object({
            allowed_origins = list(string)
        })))
    data_store                   = optional(list(object({
            unique_name        = string
            storage_account_id = optional(string)
        })))
    identity                     = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
