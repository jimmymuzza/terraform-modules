variable "container_registry_credential_sets" {
  description = <<EOT
Map of container_registry_credential_sets, attributes below
Required:
    - container_registry_id
    - login_server
    - name
    - authentication_credentials
    - identity
EOT

  type = map(object({
    container_registry_id      = string
    login_server               = string
    name                       = string
    authentication_credentials = list(object({
            password_secret_id = string
            username_secret_id = string
        }))
    identity                   = list(object({
            type = string
        }))
  }))
}
