variable "cloudsearch_domain_service_access_policies" {
  description = <<EOT
Map of cloudsearch_domain_service_access_policies, attributes below
Required:
    - access_policy
    - domain_name
Optional:
    - region
EOT

  type = map(object({
    access_policy = string
    domain_name   = string
    region        = optional(string)
  }))
}
