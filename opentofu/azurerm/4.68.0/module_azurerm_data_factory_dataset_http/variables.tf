variable "data_factory_dataset_https" {
  description = <<EOT
Map of data_factory_dataset_https, attributes below
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
    - relative_url
    - request_body
    - request_method
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
    relative_url          = optional(string)
    request_body          = optional(string)
    request_method        = optional(string)
    schema_column         = optional(list(object({
            name        = string
            description = optional(string)
            type        = optional(string)
        })))
  }))
}
