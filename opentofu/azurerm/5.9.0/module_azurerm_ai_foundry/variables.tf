variable "ai_foundries" {
  description = <<EOT
Map of ai_foundries, attributes below
Required:
    - key_vault_id
    - location
    - name
    - resource_group_name
    - storage_account_id
    - identity
Optional:
    - application_insights_id
    - container_registry_id
    - description
    - friendly_name
    - high_business_impact_enabled
    - primary_user_assigned_identity
    - public_network_access
    - tags
    - encryption
    - managed_network
EOT

  type = map(object({
    key_vault_id                   = string
    location                       = string
    name                           = string
    resource_group_name            = string
    storage_account_id             = string
    application_insights_id        = optional(string)
    container_registry_id          = optional(string)
    description                    = optional(string)
    friendly_name                  = optional(string)
    high_business_impact_enabled   = optional(bool)
    primary_user_assigned_identity = optional(string)
    public_network_access          = optional(string)
    tags                           = optional(map(string))
    encryption                     = optional(list(object({
            key_id                    = string
            key_vault_id              = string
            user_assigned_identity_id = optional(string)
        })))
    identity                       = list(object({
            type         = string
            identity_ids = optional(set(string))
        }))
    managed_network                = optional(list(object({
            isolation_mode = optional(string)
        })))
  }))
}
