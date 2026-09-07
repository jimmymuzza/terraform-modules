variable "eks_access_entries" {
  description = <<EOT
Map of eks_access_entries, attributes below
Required:
    - cluster_name
    - principal_arn
Optional:
    - kubernetes_groups
    - region
    - tags
    - tags_all
    - type
    - user_name
EOT

  type = map(object({
    cluster_name      = string
    principal_arn     = string
    kubernetes_groups = optional(set(string))
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    type              = optional(string)
    user_name         = optional(string)
  }))
}
