variable "cognitive_account_connection_custom_keys" {
  description = <<EOT
Map of cognitive_account_connection_custom_keys, attributes below
Required:
    - category
    - cognitive_account_id
    - custom_keys
    - name
    - target
Optional:
    - metadata
EOT

  type = map(object({
    category             = string
    cognitive_account_id = string
    custom_keys          = map(string)
    name                 = string
    target               = string
    metadata             = optional(map(string))
  }))
}
