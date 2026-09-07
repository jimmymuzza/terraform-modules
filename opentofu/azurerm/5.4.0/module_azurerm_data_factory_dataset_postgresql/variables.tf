variable "data_factory_dataset_postgresqls" {
  description = <<EOT
Map of data_factory_dataset_postgresqls, attributes below
Required:
    - data_factory_id
    - linked_service_name
    - name
Optional:
    - additional_properties
    - annotations
    - description
    - folder
    - parameters
    - table_name
    - schema_column
EOT

  type = map(object({
    data_factory_id       = string
    linked_service_name   = string
    name                  = string
    additional_properties = optional(map(string))
    annotations           = optional(list(string))
    description           = optional(string)
    folder                = optional(string)
    parameters            = optional(map(string))
    table_name            = optional(string)
    schema_column         = optional(list(object({
            name        = string
            description = optional(string)
            type        = optional(string)
        })))
  }))
}
