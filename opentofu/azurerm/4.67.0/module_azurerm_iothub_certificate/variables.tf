variable "iothub_certificates" {
  description = <<EOT
Map of iothub_certificates, attributes below
Required:
    - certificate_content
    - iothub_name
    - name
    - resource_group_name
Optional:
    - is_verified
EOT

  type = map(object({
    certificate_content = string
    iothub_name         = string
    name                = string
    resource_group_name = string
    is_verified         = optional(bool)
  }))
}
