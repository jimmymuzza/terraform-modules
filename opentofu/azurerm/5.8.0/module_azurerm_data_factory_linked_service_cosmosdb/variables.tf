variable "data_factory_linked_service_cosmosdbs" {
  description = <<EOT
Map of data_factory_linked_service_cosmosdbs, attributes below
Required:
    - data_factory_id
    - name
Optional:
    - account_endpoint
    - account_key
    - additional_properties
    - annotations
    - connection_string
    - database
    - description
    - integration_runtime_name
    - parameters
EOT

  type = map(object({
    data_factory_id          = string
    name                     = string
    account_endpoint         = optional(string)
    account_key              = optional(string)
    additional_properties    = optional(map(string))
    annotations              = optional(list(string))
    connection_string        = optional(string)
    database                 = optional(string)
    description              = optional(string)
    integration_runtime_name = optional(string)
    parameters               = optional(map(string))
  }))
}
