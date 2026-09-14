variable "data_factory_linked_service_cosmosdb_mongoapis" {
  description = <<EOT
Map of data_factory_linked_service_cosmosdb_mongoapis, attributes below
Required:
    - data_factory_id
    - name
Optional:
    - additional_properties
    - annotations
    - connection_string
    - database
    - description
    - integration_runtime_name
    - parameters
    - server_version_is_32_or_higher
EOT

  type = map(object({
    data_factory_id                = string
    name                           = string
    additional_properties          = optional(map(string))
    annotations                    = optional(list(string))
    connection_string              = optional(string)
    database                       = optional(string)
    description                    = optional(string)
    integration_runtime_name       = optional(string)
    parameters                     = optional(map(string))
    server_version_is_32_or_higher = optional(bool)
  }))
}
