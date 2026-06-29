variable "shield_drt_access_role_arn_associations" {
  description = <<EOT
Map of shield_drt_access_role_arn_associations, attributes below
Required:
    - role_arn
EOT

  type = map(object({
    role_arn = string
  }))
}
