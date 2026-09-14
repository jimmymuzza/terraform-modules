variable "machine_learning_datastore_datalake_gen2s" {
  description = <<EOT
Map of machine_learning_datastore_datalake_gen2s, attributes below
Required:
    - name
    - storage_container_id
    - workspace_id
Optional:
    - authority_url
    - client_id
    - client_secret
    - description
    - service_data_identity
    - tags
    - tenant_id
EOT

  type = map(object({
    name                  = string
    storage_container_id  = string
    workspace_id          = string
    authority_url         = optional(string)
    client_id             = optional(string)
    client_secret         = optional(string)
    description           = optional(string)
    service_data_identity = optional(string)
    tags                  = optional(map(string))
    tenant_id             = optional(string)
  }))
}
