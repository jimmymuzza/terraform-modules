variable "disk_encryption_sets" {
  description = <<EOT
Map of disk_encryption_sets, attributes below
Required:
    - key_vault_key_id
    - location
    - name
    - resource_group_name
    - identity
Optional:
    - auto_key_rotation_enabled
    - encryption_type
    - federated_client_id
    - tags
EOT

  type = map(object({
    key_vault_key_id          = string
    location                  = string
    name                      = string
    resource_group_name       = string
    auto_key_rotation_enabled = optional(bool)
    encryption_type           = optional(string)
    federated_client_id       = optional(string)
    tags                      = optional(map(string))
    identity                  = list(object({
            type         = string
            identity_ids = optional(set(string))
        }))
  }))
}
