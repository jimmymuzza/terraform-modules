variable "organizations_organizations" {
  description = <<EOT
Map of organizations_organizations, attributes below
Optional:
    - aws_service_access_principals
    - enabled_policy_types
    - feature_set
    - return_organization_only
EOT

  type = map(object({
    aws_service_access_principals = optional(set(string))
    enabled_policy_types          = optional(set(string))
    feature_set                   = optional(string)
    return_organization_only      = optional(bool)
  }))
}
