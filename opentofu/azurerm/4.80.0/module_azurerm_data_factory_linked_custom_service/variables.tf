variable "data_factory_linked_custom_services" {
  description = <<EOT
Map of data_factory_linked_custom_services, attributes below
Required:
    - data_factory_id
    - name
    - type
    - type_properties_json
Optional:
    - additional_properties
    - annotations
    - description
    - parameters
    - integration_runtime
EOT

  type = map(object({
    data_factory_id       = string
    name                  = string
    type                  = string
    type_properties_json  = string
    additional_properties = optional(map(string))
    annotations           = optional(list(string))
    description           = optional(string)
    parameters            = optional(map(string))
    integration_runtime   = optional(list(object({
            name       = string
            parameters = optional(map(string))
        })))
  }))
}
