variable "data_factory_linked_service_azure_searches" {
  description = <<EOT
Map of data_factory_linked_service_azure_searches, attributes below
Required:
    - data_factory_id
    - name
    - search_service_key
    - url
Optional:
    - additional_properties
    - annotations
    - description
    - integration_runtime_name
    - parameters
EOT

  type = map(object({
    data_factory_id          = string
    name                     = string
    search_service_key       = string
    url                      = string
    additional_properties    = optional(map(string))
    annotations              = optional(list(string))
    description              = optional(string)
    integration_runtime_name = optional(string)
    parameters               = optional(map(string))
  }))
}
