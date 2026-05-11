variable "data_factory_linked_service_kustos" {
  description = <<EOT
Map of data_factory_linked_service_kustos, attributes below
Required:
    - data_factory_id
    - kusto_database_name
    - kusto_endpoint
    - name
Optional:
    - additional_properties
    - annotations
    - description
    - integration_runtime_name
    - parameters
    - service_principal_id
    - service_principal_key
    - tenant
    - use_managed_identity
EOT

  type = map(object({
    data_factory_id          = string
    kusto_database_name      = string
    kusto_endpoint           = string
    name                     = string
    additional_properties    = optional(map(string))
    annotations              = optional(list(string))
    description              = optional(string)
    integration_runtime_name = optional(string)
    parameters               = optional(map(string))
    service_principal_id     = optional(string)
    service_principal_key    = optional(string)
    tenant                   = optional(string)
    use_managed_identity     = optional(bool)
  }))
}
