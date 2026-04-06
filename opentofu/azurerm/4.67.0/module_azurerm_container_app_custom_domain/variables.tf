variable "container_app_custom_domains" {
  description = <<EOT
Map of container_app_custom_domains, attributes below
Required:
    - container_app_id
    - name
Optional:
    - certificate_binding_type
    - container_app_environment_certificate_id
EOT

  type = map(object({
    container_app_id                         = string
    name                                     = string
    certificate_binding_type                 = optional(string)
    container_app_environment_certificate_id = optional(string)
  }))
}
