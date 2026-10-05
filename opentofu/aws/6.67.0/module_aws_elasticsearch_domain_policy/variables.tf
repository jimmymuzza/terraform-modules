variable "elasticsearch_domain_policies" {
  description = <<EOT
Map of elasticsearch_domain_policies, attributes below
Required:
    - access_policies
    - domain_name
Optional:
    - region
EOT

  type = map(object({
    access_policies = string
    domain_name     = string
    region          = optional(string)
  }))
}
