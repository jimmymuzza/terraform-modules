variable "eks_pod_identity_associations" {
  description = <<EOT
Map of eks_pod_identity_associations, attributes below
Required:
    - cluster_name
    - namespace
    - role_arn
    - service_account
Optional:
    - disable_session_tags
    - region
    - tags
    - target_role_arn
EOT

  type = map(object({
    cluster_name         = string
    namespace            = string
    role_arn             = string
    service_account      = string
    disable_session_tags = optional(bool)
    region               = optional(string)
    tags                 = optional(map(string))
    target_role_arn      = optional(string)
  }))
}
