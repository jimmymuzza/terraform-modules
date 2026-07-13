variable "rds_cluster_role_associations" {
  description = <<EOT
Map of rds_cluster_role_associations, attributes below
Required:
    - db_cluster_identifier
    - role_arn
Optional:
    - feature_name
    - region
EOT

  type = map(object({
    db_cluster_identifier = string
    role_arn              = string
    feature_name          = optional(string)
    region                = optional(string)
  }))
}
