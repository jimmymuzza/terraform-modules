variable "accountaccess_entitlements" {
  description = <<EOT
Map of accountaccess_entitlements, attributes below
Required:
    - application_arn
Optional:
    - region
    - entitlement
EOT

  type = map(object({
    application_arn = string
    region          = optional(string)
    entitlement     = optional(list(object({
            principal_role = optional(list(object({
                role_arn  = string
                principal = optional(list(object({
                    identity_center = optional(list(object({
                        group_id = optional(string)
                        user_id  = optional(string)
                    })))
                })))
            })))
        })))
  }))
}
