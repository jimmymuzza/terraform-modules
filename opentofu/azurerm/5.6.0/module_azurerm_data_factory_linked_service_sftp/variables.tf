variable "data_factory_linked_service_sftps" {
  description = <<EOT
Map of data_factory_linked_service_sftps, attributes below
Required:
    - authentication_type
    - data_factory_id
    - host
    - name
    - port
    - username
Optional:
    - additional_properties
    - annotations
    - description
    - host_key_fingerprint
    - integration_runtime_name
    - parameters
    - password
    - private_key_content_base64
    - private_key_passphrase
    - private_key_path
    - skip_host_key_validation
    - key_vault_password
    - key_vault_private_key_content_base64
    - key_vault_private_key_passphrase
EOT

  type = map(object({
    authentication_type                  = string
    data_factory_id                      = string
    host                                 = string
    name                                 = string
    port                                 = number
    username                             = string
    additional_properties                = optional(map(string))
    annotations                          = optional(list(string))
    description                          = optional(string)
    host_key_fingerprint                 = optional(string)
    integration_runtime_name             = optional(string)
    parameters                           = optional(map(string))
    password                             = optional(string)
    private_key_content_base64           = optional(string)
    private_key_passphrase               = optional(string)
    private_key_path                     = optional(string)
    skip_host_key_validation             = optional(bool)
    key_vault_password                   = optional(list(object({
            linked_service_name = string
            secret_name         = string
        })))
    key_vault_private_key_content_base64 = optional(list(object({
            linked_service_name = string
            secret_name         = string
        })))
    key_vault_private_key_passphrase     = optional(list(object({
            linked_service_name = string
            secret_name         = string
        })))
  }))
}
