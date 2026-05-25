variable "data_factory_linked_service_mysqls" {
  description = <<EOT
Map of data_factory_linked_service_mysqls, attributes below
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
  }))
}
