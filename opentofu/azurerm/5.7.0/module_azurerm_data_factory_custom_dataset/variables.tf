variable "data_factory_custom_datasets" {
  description = <<EOT
Map of data_factory_custom_datasets, attributes below
Required:
    - data_factory_id
    - name
    - type
    - type_properties_json
    - linked_service
Optional:
    - additional_properties
    - annotations
    - description
    - folder
    - parameters
    - schema_json
EOT

  type = map(object({
    data_factory_id       = string
    name                  = string
    type                  = string
    type_properties_json  = string
    additional_properties = optional(map(string))
    annotations           = optional(list(string))
    description           = optional(string)
    folder                = optional(string)
    parameters            = optional(map(string))
    schema_json           = optional(string)
    linked_service        = list(object({
            name       = string
            parameters = optional(map(string))
        }))
  }))
}
