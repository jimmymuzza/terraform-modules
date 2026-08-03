variable "app_configuration_keys" {
  description = <<EOT
Map of app_configuration_keys, attributes below
Required:
    - configuration_store_id
    - key
Optional:
    - content_type
    - etag
    - label
    - locked
    - tags
    - type
    - value
    - vault_key_reference
EOT

  type = map(object({
    configuration_store_id = string
    key                    = string
    content_type           = optional(string)
    etag                   = optional(string)
    label                  = optional(string)
    locked                 = optional(bool)
    tags                   = optional(map(string))
    type                   = optional(string)
    value                  = optional(string)
    vault_key_reference    = optional(string)
  }))
}
