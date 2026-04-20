variable "redshiftserverless_custom_domain_associations" {
  description = <<EOT
Map of redshiftserverless_custom_domain_associations, attributes below
Required:
    - custom_domain_certificate_arn
    - custom_domain_name
    - workgroup_name
Optional:
    - region
EOT

  type = map(object({
    custom_domain_certificate_arn = string
    custom_domain_name            = string
    workgroup_name                = string
    region                        = optional(string)
  }))
}
