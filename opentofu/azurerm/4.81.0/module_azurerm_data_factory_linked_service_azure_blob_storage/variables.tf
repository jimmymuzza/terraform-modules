variable "data_factory_linked_service_azure_blob_storages" {
  description = <<EOT
Map of data_factory_linked_service_azure_blob_storages, attributes below
Required:
    - data_factory_id
    - name
Optional:
    - additional_properties
    - annotations
    - connection_string
    - connection_string_insecure
    - description
    - integration_runtime_name
    - parameters
    - sas_uri
    - service_endpoint
    - service_principal_id
    - service_principal_key
    - storage_kind
    - tenant_id
    - use_managed_identity
    - key_vault_sas_token
    - sas_token_linked_key_vault_key
    - service_principal_linked_key_vault_key
EOT

  type = map(object({
    data_factory_id                        = string
    name                                   = string
    additional_properties                  = optional(map(string))
    annotations                            = optional(list(string))
    connection_string                      = optional(string)
    connection_string_insecure             = optional(string)
    description                            = optional(string)
    integration_runtime_name               = optional(string)
    parameters                             = optional(map(string))
    sas_uri                                = optional(string)
    service_endpoint                       = optional(string)
    service_principal_id                   = optional(string)
    service_principal_key                  = optional(string)
    storage_kind                           = optional(string)
    tenant_id                              = optional(string)
    use_managed_identity                   = optional(bool)
    key_vault_sas_token                    = optional(list(object({
            linked_service_name = string
            secret_name         = string
        })))
    sas_token_linked_key_vault_key         = optional(list(object({
            linked_service_name = string
            secret_name         = string
        })))
    service_principal_linked_key_vault_key = optional(list(object({
            linked_service_name = string
            secret_name         = string
        })))
  }))
}
