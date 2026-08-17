variable "resiliencehubv2_services" {
  description = <<EOT
Map of resiliencehubv2_services, attributes below
Required:
    - name
    - regions
Optional:
    - dependency_discovery
    - description
    - kms_key_id
    - policy_arn
    - region
    - tags
    - permission_model
EOT

  type = map(object({
    name                 = string
    regions              = set(string)
    dependency_discovery = optional(string)
    description          = optional(string)
    kms_key_id           = optional(string)
    policy_arn           = optional(string)
    region               = optional(string)
    tags                 = optional(map(string))
    permission_model     = optional(list(object({
            invoker_role_name  = string
            cross_account_role = optional(list(object({
                cross_account_role_arn = string
                external_id            = optional(string)
            })))
        })))
  }))
}
