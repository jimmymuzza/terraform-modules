variable "appsync_domain_name_api_associations" {
  description = <<EOT
Map of appsync_domain_name_api_associations, attributes below
Required:
    - api_id
    - domain_name
Optional:
    - region
EOT

  type = map(object({
    api_id      = string
    domain_name = string
    region      = optional(string)
  }))
}
