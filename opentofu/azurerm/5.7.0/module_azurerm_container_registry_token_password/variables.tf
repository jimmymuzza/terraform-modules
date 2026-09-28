variable "container_registry_token_passwords" {
  description = <<EOT
Map of container_registry_token_passwords, attributes below
Required:
    - container_registry_token_id
    - password1
Optional:
    - password2
EOT

  type = map(object({
    container_registry_token_id = string
    password1                   = list(object({
            expiry = optional(string)
        }))
    password2                   = optional(list(object({
            expiry = optional(string)
        })))
  }))
}
