variable "machine_learning_workspaces" {
  description = <<EOT
Map of machine_learning_workspaces, attributes below
Required:
    - application_insights_id
    - key_vault_id
    - location
    - name
    - resource_group_name
    - storage_account_id
    - identity
Optional:
    - container_registry_id
    - description
    - friendly_name
    - high_business_impact
    - image_build_compute_name
    - kind
    - primary_user_assigned_identity
    - public_network_access_enabled
    - service_side_encryption_enabled
    - sku_name
    - storage_account_access_type
    - tags
    - v1_legacy_mode_enabled
    - encryption
    - feature_store
    - managed_network
    - serverless_compute
EOT

  type = map(object({
    application_insights_id         = string
    key_vault_id                    = string
    location                        = string
    name                            = string
    resource_group_name             = string
    storage_account_id              = string
    container_registry_id           = optional(string)
    description                     = optional(string)
    friendly_name                   = optional(string)
    high_business_impact            = optional(bool)
    image_build_compute_name        = optional(string)
    kind                            = optional(string)
    primary_user_assigned_identity  = optional(string)
    public_network_access_enabled   = optional(bool)
    service_side_encryption_enabled = optional(bool)
    sku_name                        = optional(string)
    storage_account_access_type     = optional(string)
    tags                            = optional(map(string))
    v1_legacy_mode_enabled          = optional(bool)
    encryption                      = optional(list(object({
            key_id                    = string
            key_vault_id              = string
            user_assigned_identity_id = optional(string)
        })))
    feature_store                   = optional(list(object({
            computer_spark_runtime_version = optional(string)
            offline_connection_name        = optional(string)
            online_connection_name         = optional(string)
        })))
    identity                        = list(object({
            type         = string
            identity_ids = optional(set(string))
        }))
    managed_network                 = optional(list(object({
            isolation_mode                = optional(string)
            provision_on_creation_enabled = optional(bool)
        })))
    serverless_compute              = optional(list(object({
            public_ip_enabled = optional(bool)
            subnet_id         = optional(string)
        })))
  }))
}
