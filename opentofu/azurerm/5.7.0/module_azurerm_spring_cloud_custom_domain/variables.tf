variable "spring_cloud_custom_domains" {
  description = <<EOT
Map of spring_cloud_custom_domains, attributes below
Required:
    - name
    - spring_cloud_app_id
Optional:
    - certificate_name
    - thumbprint
EOT

  type = map(object({
    name                = string
    spring_cloud_app_id = string
    certificate_name    = optional(string)
    thumbprint          = optional(string)
  }))
}
