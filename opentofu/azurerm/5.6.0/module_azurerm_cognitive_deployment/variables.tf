variable "cognitive_deployments" {
  description = <<EOT
Map of cognitive_deployments, attributes below
Required:
    - cognitive_account_id
    - name
    - model
    - sku
Optional:
    - dynamic_throttling_enabled
    - rai_policy_name
    - version_upgrade_option
EOT

  type = map(object({
    cognitive_account_id       = string
    name                       = string
    dynamic_throttling_enabled = optional(bool)
    rai_policy_name            = optional(string)
    version_upgrade_option     = optional(string)
    model                      = list(object({
            format  = string
            name    = string
            version = optional(string)
        }))
    sku                        = list(object({
            name     = string
            capacity = optional(number)
            family   = optional(string)
            size     = optional(string)
            tier     = optional(string)
        }))
  }))
}
