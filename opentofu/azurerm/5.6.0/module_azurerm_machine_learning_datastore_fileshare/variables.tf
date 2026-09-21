variable "machine_learning_datastore_fileshares" {
  description = <<EOT
Map of machine_learning_datastore_fileshares, attributes below
Required:
    - name
    - storage_fileshare_id
    - workspace_id
Optional:
    - account_key
    - description
    - service_data_identity
    - shared_access_signature
    - tags
EOT

  type = map(object({
    name                    = string
    storage_fileshare_id    = string
    workspace_id            = string
    account_key             = optional(string)
    description             = optional(string)
    service_data_identity   = optional(string)
    shared_access_signature = optional(string)
    tags                    = optional(map(string))
  }))
}
