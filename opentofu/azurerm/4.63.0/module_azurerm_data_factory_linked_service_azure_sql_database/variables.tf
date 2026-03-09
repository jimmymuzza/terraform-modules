variable "data_factory_linked_service_azure_sql_databases" {
  description = <<EOT
Map of data_factory_linked_service_azure_sql_databases, attributes below
Required:
    - data_factory_id
    - name
Optional:
    - additional_properties
    - annotations
    - connection_string
    - credential_name
    - description
    - integration_runtime_name
    - parameters
    - service_principal_id
    - service_principal_key
    - tenant_id
    - use_managed_identity
    - key_vault_connection_string
    - key_vault_password
EOT

  type = map(object({
    data_factory_id             = string
    name                        = string
    additional_properties       = optional(map(string))
    annotations                 = optional(list(string))
    connection_string           = optional(string)
    credential_name             = optional(string)
    description                 = optional(string)
    integration_runtime_name    = optional(string)
    parameters                  = optional(map(string))
    service_principal_id        = optional(string)
    service_principal_key       = optional(string)
    tenant_id                   = optional(string)
    use_managed_identity        = optional(bool)
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
