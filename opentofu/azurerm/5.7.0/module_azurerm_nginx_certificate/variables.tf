variable "nginx_certificates" {
  description = <<EOT
Map of nginx_certificates, attributes below
Required:
    - certificate_virtual_path
    - key_vault_secret_id
    - key_virtual_path
    - name
    - nginx_deployment_id
EOT

  type = map(object({
    certificate_virtual_path = string
    key_vault_secret_id      = string
    key_virtual_path         = string
    name                     = string
    nginx_deployment_id      = string
  }))
}
