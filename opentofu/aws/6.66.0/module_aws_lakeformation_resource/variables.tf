variable "lakeformation_resources" {
  description = <<EOT
Map of lakeformation_resources, attributes below
Required:
    - arn
Optional:
    - hybrid_access_enabled
    - region
    - role_arn
    - use_service_linked_role
    - with_federation
    - with_privileged_access
EOT

  type = map(object({
    arn                     = string
    hybrid_access_enabled   = optional(bool)
    region                  = optional(string)
    role_arn                = optional(string)
    use_service_linked_role = optional(bool)
    with_federation         = optional(bool)
    with_privileged_access  = optional(bool)
  }))
}
