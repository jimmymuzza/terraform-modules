variable "app_service_certificates" {
  description = <<EOT
Map of app_service_certificates, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - app_service_plan_id
    - key_vault_id
    - key_vault_secret_id
    - password
    - pfx_blob
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    app_service_plan_id = optional(string)
    key_vault_id        = optional(string)
    key_vault_secret_id = optional(string)
    password            = optional(string)
    pfx_blob            = optional(string)
    tags                = optional(map(string))
  }))
}
