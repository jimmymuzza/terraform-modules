variable "eks_access_policy_associations" {
  description = <<EOT
Map of eks_access_policy_associations, attributes below
Required:
    - cluster_name
    - policy_arn
    - principal_arn
    - access_scope
Optional:
    - region
EOT

  type = map(object({
    cluster_name  = string
    policy_arn    = string
    principal_arn = string
    region        = optional(string)
    access_scope  = list(object({
            type       = string
            namespaces = optional(set(string))
        }))
  }))
}
