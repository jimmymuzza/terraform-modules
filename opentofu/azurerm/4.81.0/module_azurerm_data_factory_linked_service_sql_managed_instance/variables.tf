variable "data_factory_linked_service_sql_managed_instances" {
  description = <<EOT
Map of data_factory_linked_service_sql_managed_instances, attributes below
Required:
    - data_factory_id
    - name
Optional:
    - annotations
    - connection_string
    - description
    - integration_runtime_name
    - parameters
    - service_principal_id
    - service_principal_key
    - tenant
    - key_vault_connection_string
    - key_vault_password
EOT

  type = map(object({
    data_factory_id             = string
    name                        = string
    annotations                 = optional(list(string))
    connection_string           = optional(string)
    description                 = optional(string)
    integration_runtime_name    = optional(string)
    parameters                  = optional(map(string))
    service_principal_id        = optional(string)
    service_principal_key       = optional(string)
    tenant                      = optional(string)
    key_vault_connection_string = optional(list(object({
            linked_service_name = string
            secret_name         = string
        })))
    key_vault_password          = optional(list(object({
            linked_service_name = string
            secret_name         = string
        })))
  }))
}
