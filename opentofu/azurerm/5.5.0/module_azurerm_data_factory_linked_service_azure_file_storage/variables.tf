variable "data_factory_linked_service_azure_file_storages" {
  description = <<EOT
Map of data_factory_linked_service_azure_file_storages, attributes below
Required:
    - connection_string
    - data_factory_id
    - name
Optional:
    - additional_properties
    - annotations
    - description
    - file_share
    - host
    - integration_runtime_name
    - parameters
    - password
    - user_id
    - key_vault_password
EOT

  type = map(object({
    connection_string        = string
    data_factory_id          = string
    name                     = string
    additional_properties    = optional(map(string))
    annotations              = optional(list(string))
    description              = optional(string)
    file_share               = optional(string)
    host                     = optional(string)
    integration_runtime_name = optional(string)
    parameters               = optional(map(string))
    password                 = optional(string)
    user_id                  = optional(string)
    key_vault_password       = optional(list(object({
            linked_service_name = string
            secret_name         = string
        })))
  }))
}
