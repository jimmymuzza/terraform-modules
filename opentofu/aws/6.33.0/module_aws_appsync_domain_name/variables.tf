variable "appsync_domain_names" {
  description = <<EOT
Map of appsync_domain_names, attributes below
Required:
    - certificate_arn
    - domain_name
Optional:
    - description
    - region
EOT

  type = map(object({
    certificate_arn = string
    domain_name     = string
    description     = optional(string)
    region          = optional(string)
  }))
}
