variable "storage_containers" {
  description = <<EOT
Map of storage_containers, attributes below
Required:
    - name
Optional:
    - container_access_type
    - default_encryption_scope
    - encryption_scope_override_enabled
    - metadata
    - storage_account_id
    - storage_account_name
EOT

  type = map(object({
    name                              = string
    container_access_type             = optional(string)
    default_encryption_scope          = optional(string)
    encryption_scope_override_enabled = optional(bool)
    metadata                          = optional(map(string))
    storage_account_id                = optional(string)
    storage_account_name              = optional(string)
  }))
}
