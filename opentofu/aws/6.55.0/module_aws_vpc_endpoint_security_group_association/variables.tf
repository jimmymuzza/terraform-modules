variable "vpc_endpoint_security_group_associations" {
  description = <<EOT
Map of vpc_endpoint_security_group_associations, attributes below
Required:
    - security_group_id
    - vpc_endpoint_id
Optional:
    - region
    - replace_default_association
EOT

  type = map(object({
    security_group_id           = string
    vpc_endpoint_id             = string
    region                      = optional(string)
    replace_default_association = optional(bool)
  }))
}
