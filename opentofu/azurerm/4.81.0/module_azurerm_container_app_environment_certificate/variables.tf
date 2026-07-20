variable "container_app_environment_certificates" {
  description = <<EOT
Map of container_app_environment_certificates, attributes below
Required:
    - container_app_environment_id
    - name
Optional:
    - certificate_blob_base64
    - certificate_password
    - tags
    - certificate_key_vault
EOT

  type = map(object({
    container_app_environment_id = string
    name                         = string
    certificate_blob_base64      = optional(string)
    certificate_password         = optional(string)
    tags                         = optional(map(string))
    certificate_key_vault        = optional(list(object({
            key_vault_secret_id = string
            identity            = optional(string)
        })))
  }))
}
