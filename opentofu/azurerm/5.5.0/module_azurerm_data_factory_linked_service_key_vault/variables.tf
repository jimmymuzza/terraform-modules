variable "data_factory_linked_service_key_vaults" {
  description = <<EOT
Map of data_factory_linked_service_key_vaults, attributes below
Required:
    - data_factory_id
    - key_vault_id
    - name
Optional:
    - additional_properties
    - annotations
    - description
    - integration_runtime_name
    - parameters
EOT

  type = map(object({
    data_factory_id          = string
    key_vault_id             = string
    name                     = string
    additional_properties    = optional(map(string))
    annotations              = optional(list(string))
    description              = optional(string)
    integration_runtime_name = optional(string)
    parameters               = optional(map(string))
  }))
}
