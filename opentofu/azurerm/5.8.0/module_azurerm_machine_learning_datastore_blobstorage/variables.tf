variable "machine_learning_datastore_blobstorages" {
  description = <<EOT
Map of machine_learning_datastore_blobstorages, attributes below
Required:
    - name
    - storage_container_id
    - workspace_id
Optional:
    - account_key
    - description
    - is_default
    - service_data_auth_identity
    - shared_access_signature
    - tags
EOT

  type = map(object({
    name                       = string
    storage_container_id       = string
    workspace_id               = string
    account_key                = optional(string)
    description                = optional(string)
    is_default                 = optional(bool)
    service_data_auth_identity = optional(string)
    shared_access_signature    = optional(string)
    tags                       = optional(map(string))
  }))
}
