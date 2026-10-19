variable "ai_foundry_projects" {
  description = <<EOT
Map of ai_foundry_projects, attributes below
Required:
    - ai_services_hub_id
    - location
    - name
Optional:
    - description
    - friendly_name
    - high_business_impact_enabled
    - primary_user_assigned_identity
    - tags
    - identity
EOT

  type = map(object({
    ai_services_hub_id             = string
    location                       = string
    name                           = string
    description                    = optional(string)
    friendly_name                  = optional(string)
    high_business_impact_enabled   = optional(bool)
    primary_user_assigned_identity = optional(string)
    tags                           = optional(map(string))
    identity                       = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
