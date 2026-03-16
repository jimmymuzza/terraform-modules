variable "opensearch_package_associations" {
  description = <<EOT
Map of opensearch_package_associations, attributes below
Required:
    - domain_name
    - package_id
Optional:
    - region
EOT

  type = map(object({
    domain_name = string
    package_id  = string
    region      = optional(string)
  }))
}
