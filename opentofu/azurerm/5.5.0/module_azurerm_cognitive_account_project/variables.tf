variable "cognitive_account_projects" {
  description = <<EOT
Map of cognitive_account_projects, attributes below
Required:
    - cognitive_account_id
    - location
    - name
    - identity
Optional:
    - description
    - display_name
    - tags
EOT

  type = map(object({
    cognitive_account_id = string
    location             = string
    name                 = string
    description          = optional(string)
    display_name         = optional(string)
    tags                 = optional(map(string))
    identity             = list(object({
            type         = string
            identity_ids = optional(set(string))
        }))
  }))
}
