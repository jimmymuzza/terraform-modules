variable "api_management_named_values" {
  description = <<EOT
Map of api_management_named_values, attributes below
Required:
    - api_management_name
    - display_name
    - name
    - resource_group_name
Optional:
    - secret
    - tags
    - value
    - value_from_key_vault
EOT

  type = map(object({
    api_management_name  = string
    display_name         = string
    name                 = string
    resource_group_name  = string
    secret               = optional(bool)
    tags                 = optional(list(string))
    value                = optional(string)
    value_from_key_vault = optional(list(object({
            secret_id          = string
            identity_client_id = optional(string)
        })))
  }))
}
