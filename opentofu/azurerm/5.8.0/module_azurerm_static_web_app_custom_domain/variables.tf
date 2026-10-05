variable "static_web_app_custom_domains" {
  description = <<EOT
Map of static_web_app_custom_domains, attributes below
Required:
    - domain_name
    - static_web_app_id
    - validation_type
EOT

  type = map(object({
    domain_name       = string
    static_web_app_id = string
    validation_type   = string
  }))
}
