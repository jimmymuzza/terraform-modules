variable "fluid_relay_servers" {
  description = <<EOT
Map of fluid_relay_servers, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - storage_sku
    - tags
    - customer_managed_key
    - identity
EOT

  type = map(object({
    location             = string
    name                 = string
    resource_group_name  = string
    storage_sku          = optional(string)
    tags                 = optional(map(string))
    customer_managed_key = optional(list(object({
            key_vault_key_id          = string
            user_assigned_identity_id = string
        })))
    identity             = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
