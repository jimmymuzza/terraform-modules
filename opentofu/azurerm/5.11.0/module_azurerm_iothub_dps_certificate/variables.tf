variable "iothub_dps_certificates" {
  description = <<EOT
Map of iothub_dps_certificates, attributes below
Required:
    - certificate_content
    - iot_dps_name
    - name
    - resource_group_name
Optional:
    - is_verified
EOT

  type = map(object({
    certificate_content = string
    iot_dps_name        = string
    name                = string
    resource_group_name = string
    is_verified         = optional(bool)
  }))
}
