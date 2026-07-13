variable "static_site_custom_domains" {
  description = <<EOT
Map of static_site_custom_domains, attributes below
Required:
    - domain_name
    - static_site_id
Optional:
    - validation_type
EOT

  type = map(object({
    domain_name     = string
    static_site_id  = string
    validation_type = optional(string)
  }))
}
