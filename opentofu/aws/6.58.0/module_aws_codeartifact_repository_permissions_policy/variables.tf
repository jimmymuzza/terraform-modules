variable "codeartifact_repository_permissions_policies" {
  description = <<EOT
Map of codeartifact_repository_permissions_policies, attributes below
Required:
    - domain
    - policy_document
    - repository
Optional:
    - domain_owner
    - policy_revision
    - region
EOT

  type = map(object({
    domain          = string
    policy_document = string
    repository      = string
    domain_owner    = optional(string)
    policy_revision = optional(string)
    region          = optional(string)
  }))
}
