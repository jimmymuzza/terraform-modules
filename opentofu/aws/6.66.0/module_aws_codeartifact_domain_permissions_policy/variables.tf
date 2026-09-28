variable "codeartifact_domain_permissions_policies" {
  description = <<EOT
Map of codeartifact_domain_permissions_policies, attributes below
Required:
    - domain
Optional:
    - domain_owner
    - policy_document
    - policy_revision
    - region
EOT

  type = map(object({
    domain          = string
    domain_owner    = optional(string)
    policy_document = optional(string)
    policy_revision = optional(string)
    region          = optional(string)
  }))
}
