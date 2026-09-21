variable "data_factory_linked_service_azure_functions" {
  description = <<EOT
Map of data_factory_linked_service_azure_functions, attributes below
Required:
    - data_factory_id
    - name
    - url
Optional:
    - additional_properties
    - annotations
    - description
    - integration_runtime_name
    - key
    - parameters
    - key_vault_key
EOT

  type = map(object({
    data_factory_id          = string
    name                     = string
    url                      = string
    additional_properties    = optional(map(string))
    annotations              = optional(list(string))
    description              = optional(string)
    integration_runtime_name = optional(string)
    key                      = optional(string)
    parameters               = optional(map(string))
    key_vault_key            = optional(list(object({
            linked_service_name = string
            secret_name         = string
        })))
  }))
}
