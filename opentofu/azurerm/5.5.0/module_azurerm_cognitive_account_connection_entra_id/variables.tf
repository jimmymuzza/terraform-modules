variable "cognitive_account_connection_entra_ids" {
  description = <<EOT
Map of cognitive_account_connection_entra_ids, attributes below
Required:
    - category
    - cognitive_account_id
    - name
    - target
Optional:
    - metadata
EOT

  type = map(object({
    category             = string
    cognitive_account_id = string
    name                 = string
    target               = string
    metadata             = optional(map(string))
  }))
}
