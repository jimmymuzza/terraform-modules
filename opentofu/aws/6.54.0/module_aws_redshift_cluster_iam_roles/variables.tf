variable "redshift_cluster_iam_roles" {
  description = <<EOT
Map of redshift_cluster_iam_roles, attributes below
Required:
    - cluster_identifier
Optional:
    - default_iam_role_arn
    - iam_role_arns
    - region
EOT

  type = map(object({
    cluster_identifier   = string
    default_iam_role_arn = optional(string)
    iam_role_arns        = optional(set(string))
    region               = optional(string)
  }))
}
