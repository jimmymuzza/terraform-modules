variable "shield_drt_access_log_bucket_associations" {
  description = <<EOT
Map of shield_drt_access_log_bucket_associations, attributes below
Required:
    - log_bucket
    - role_arn_association_id
EOT

  type = map(object({
    log_bucket              = string
    role_arn_association_id = string
  }))
}
