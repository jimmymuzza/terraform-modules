variable "data_factory_linked_service_synapses" {
  description = <<EOT
Map of data_factory_linked_service_synapses, attributes below
Required:
    - connection_string
    - data_factory_id
    - name
Optional:
    - additional_properties
    - annotations
    - description
    - integration_runtime_name
    - parameters
    - key_vault_password
EOT

  type = map(object({
    connection_string        = string
    data_factory_id          = string
    name                     = string
    additional_properties    = optional(map(string))
    annotations              = optional(list(string))
    description              = optional(string)
    integration_runtime_name = optional(string)
    parameters               = optional(map(string))
    key_vault_password       = optional(list(object({
            linked_service_name = string
            secret_name         = string
        })))
  }))
}
