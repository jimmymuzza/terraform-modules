variable "data_factory_dataset_azure_sql_tables" {
  description = <<EOT
Map of data_factory_dataset_azure_sql_tables, attributes below
Required:
    - data_factory_id
    - linked_service_id
    - name
Optional:
    - additional_properties
    - annotations
    - description
    - folder
    - parameters
    - schema
    - table
    - schema_column
EOT

  type = map(object({
    data_factory_id       = string
    linked_service_id     = string
    name                  = string
    additional_properties = optional(map(string))
    annotations           = optional(list(string))
    description           = optional(string)
    folder                = optional(string)
    parameters            = optional(map(string))
    schema                = optional(string)
    table                 = optional(string)
    schema_column         = optional(list(object({
            name        = string
            description = optional(string)
            type        = optional(string)
        })))
  }))
}
