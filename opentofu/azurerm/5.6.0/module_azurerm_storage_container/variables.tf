variable "storage_containers" {
  description = <<EOT
Map of storage_containers, attributes below
Required:
    - name
    - storage_account_id
Optional:
    - container_access_type
    - default_encryption_scope
    - encryption_scope_override_enabled
    - metadata
EOT

  type = map(object({
    name                              = string
    storage_account_id                = string
    container_access_type             = optional(string)
    default_encryption_scope          = optional(string)
    encryption_scope_override_enabled = optional(bool)
    metadata                          = optional(map(string))
  }))
}
