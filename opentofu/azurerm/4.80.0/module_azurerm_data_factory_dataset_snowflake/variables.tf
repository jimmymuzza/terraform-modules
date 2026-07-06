variable "data_factory_dataset_snowflakes" {
  description = <<EOT
Map of data_factory_dataset_snowflakes, attributes below
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
    - schema_name
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
    schema_name           = optional(string)
    table_name            = optional(string)
    schema_column         = optional(list(object({
            name      = string
            precision = optional(number)
            scale     = optional(number)
            type      = optional(string)
        })))
  }))
}
