variable "vpclattice_services" {
  description = <<EOT
Map of vpclattice_services, attributes below
Required:
    - name
Optional:
    - auth_type
    - certificate_arn
    - custom_domain_name
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name               = string
    auth_type          = optional(string)
    certificate_arn    = optional(string)
    custom_domain_name = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
  }))
}
