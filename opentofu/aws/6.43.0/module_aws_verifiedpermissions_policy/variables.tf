variable "verifiedpermissions_policies" {
  description = <<EOT
Map of verifiedpermissions_policies, attributes below
Required:
    - policy_store_id
Optional:
    - region
    - definition
EOT

  type = map(object({
    policy_store_id = string
    region          = optional(string)
    definition      = optional(list(object({
            static          = optional(list(object({
                statement   = string
                description = optional(string)
            })))
            template_linked = optional(list(object({
                policy_template_id = string
                principal          = optional(list(object({
                    entity_id   = string
                    entity_type = string
                })))
                resource           = optional(list(object({
                    entity_id   = string
                    entity_type = string
                })))
            })))
        })))
  }))
}
