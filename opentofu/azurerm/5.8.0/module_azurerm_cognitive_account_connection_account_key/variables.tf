variable "cognitive_account_connection_account_keys" {
  description = <<EOT
Map of cognitive_account_connection_account_keys, attributes below
Required:
    - account_key
    - category
    - cognitive_account_id
    - metadata
    - name
    - target
EOT

  type = map(object({
    account_key          = string
    category             = string
    cognitive_account_id = string
    metadata             = map(string)
    name                 = string
    target               = string
  }))
}
