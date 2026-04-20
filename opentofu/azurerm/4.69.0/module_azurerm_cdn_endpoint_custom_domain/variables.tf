variable "cdn_endpoint_custom_domains" {
  description = <<EOT
Map of cdn_endpoint_custom_domains, attributes below
Required:
    - cdn_endpoint_id
    - host_name
    - name
Optional:
    - cdn_managed_https
    - user_managed_https
EOT

  type = map(object({
    cdn_endpoint_id    = string
    host_name          = string
    name               = string
    cdn_managed_https  = optional(list(object({
            certificate_type = string
            protocol_type    = string
            tls_version      = optional(string)
        })))
    user_managed_https = optional(list(object({
            key_vault_secret_id = string
            tls_version         = optional(string)
        })))
  }))
}
