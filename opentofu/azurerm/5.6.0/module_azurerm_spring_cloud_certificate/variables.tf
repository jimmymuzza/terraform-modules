variable "spring_cloud_certificates" {
  description = <<EOT
Map of spring_cloud_certificates, attributes below
Required:
    - name
    - resource_group_name
    - service_name
Optional:
    - certificate_content
    - exclude_private_key
    - key_vault_certificate_id
EOT

  type = map(object({
    name                     = string
    resource_group_name      = string
    service_name             = string
    certificate_content      = optional(string)
    exclude_private_key      = optional(bool)
    key_vault_certificate_id = optional(string)
  }))
}
