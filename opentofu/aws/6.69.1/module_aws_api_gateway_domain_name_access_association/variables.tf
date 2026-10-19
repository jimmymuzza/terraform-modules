variable "api_gateway_domain_name_access_associations" {
  description = <<EOT
Map of api_gateway_domain_name_access_associations, attributes below
Required:
    - access_association_source
    - access_association_source_type
    - domain_name_arn
Optional:
    - region
    - tags
EOT

  type = map(object({
    access_association_source      = string
    access_association_source_type = string
    domain_name_arn                = string
    region                         = optional(string)
    tags                           = optional(map(string))
  }))
}
