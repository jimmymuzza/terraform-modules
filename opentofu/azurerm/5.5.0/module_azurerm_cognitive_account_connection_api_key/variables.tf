variable "cognitive_account_connection_api_keys" {
  description = <<EOT
Map of cognitive_account_connection_api_keys, attributes below
Required:
    - api_key
    - category
    - cognitive_account_id
    - name
Optional:
    - metadata
    - target
EOT

  type = map(object({
    api_key              = string
    category             = string
    cognitive_account_id = string
    name                 = string
    metadata             = optional(map(string))
    target               = optional(string)
  }))
}
