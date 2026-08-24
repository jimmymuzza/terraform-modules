variable "cognitive_account_connection_account_managed_identities" {
  description = <<EOT
Map of cognitive_account_connection_account_managed_identities, attributes below
Required:
    - category
    - cognitive_account_id
    - metadata
    - name
    - target
EOT

  type = map(object({
    category             = string
    cognitive_account_id = string
    metadata             = map(string)
    name                 = string
    target               = string
  }))
}
