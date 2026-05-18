variable "app_service_managed_certificates" {
  description = <<EOT
Map of app_service_managed_certificates, attributes below
Required:
    - custom_hostname_binding_id
Optional:
    - tags
EOT

  type = map(object({
    custom_hostname_binding_id = string
    tags                       = optional(map(string))
  }))
}
