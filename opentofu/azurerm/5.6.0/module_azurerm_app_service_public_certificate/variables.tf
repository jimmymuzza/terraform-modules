variable "app_service_public_certificates" {
  description = <<EOT
Map of app_service_public_certificates, attributes below
Required:
    - app_service_name
    - blob
    - certificate_location
    - certificate_name
    - resource_group_name
EOT

  type = map(object({
    app_service_name     = string
    blob                 = string
    certificate_location = string
    certificate_name     = string
    resource_group_name  = string
  }))
}
