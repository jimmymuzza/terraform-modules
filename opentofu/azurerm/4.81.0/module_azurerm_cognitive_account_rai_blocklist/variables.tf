variable "cognitive_account_rai_blocklists" {
  description = <<EOT
Map of cognitive_account_rai_blocklists, attributes below
Required:
    - cognitive_account_id
    - name
Optional:
    - description
    - tags
EOT

  type = map(object({
    cognitive_account_id = string
    name                 = string
    description          = optional(string)
    tags                 = optional(map(string))
  }))
}
