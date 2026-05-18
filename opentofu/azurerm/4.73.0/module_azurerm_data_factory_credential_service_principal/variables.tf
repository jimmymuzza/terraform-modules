variable "data_factory_credential_service_principals" {
  description = <<EOT
Map of data_factory_credential_service_principals, attributes below
Required:
    - data_factory_id
    - name
    - service_principal_id
    - tenant_id
Optional:
    - annotations
    - description
    - service_principal_key
EOT

  type = map(object({
    data_factory_id       = string
    name                  = string
    service_principal_id  = string
    tenant_id             = string
    annotations           = optional(list(string))
    description           = optional(string)
    service_principal_key = optional(list(object({
            linked_service_name = string
            secret_name         = string
            secret_version      = optional(string)
        })))
  }))
}
