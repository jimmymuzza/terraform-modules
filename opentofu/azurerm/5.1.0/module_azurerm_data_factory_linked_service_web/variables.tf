variable "data_factory_linked_service_webs" {
  description = <<EOT
Map of data_factory_linked_service_webs, attributes below
Required:
    - authentication_type
    - data_factory_id
    - name
    - url
Optional:
    - additional_properties
    - annotations
    - description
    - integration_runtime_name
    - parameters
    - password
    - username
EOT

  type = map(object({
    authentication_type      = string
    data_factory_id          = string
    name                     = string
    url                      = string
    additional_properties    = optional(map(string))
    annotations              = optional(list(string))
    description              = optional(string)
    integration_runtime_name = optional(string)
    parameters               = optional(map(string))
    password                 = optional(string)
    username                 = optional(string)
  }))
}
