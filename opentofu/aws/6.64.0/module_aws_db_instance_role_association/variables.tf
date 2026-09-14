variable "db_instance_role_associations" {
  description = <<EOT
Map of db_instance_role_associations, attributes below
Required:
    - db_instance_identifier
    - feature_name
    - role_arn
Optional:
    - region
EOT

  type = map(object({
    db_instance_identifier = string
    feature_name           = string
    role_arn               = string
    region                 = optional(string)
  }))
}
