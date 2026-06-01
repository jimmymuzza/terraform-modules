variable "ecr_pull_through_cache_rules" {
  description = <<EOT
Map of ecr_pull_through_cache_rules, attributes below
Required:
    - ecr_repository_prefix
    - upstream_registry_url
Optional:
    - credential_arn
    - custom_role_arn
    - region
    - upstream_repository_prefix
EOT

  type = map(object({
    ecr_repository_prefix      = string
    upstream_registry_url      = string
    credential_arn             = optional(string)
    custom_role_arn            = optional(string)
    region                     = optional(string)
    upstream_repository_prefix = optional(string)
  }))
}
