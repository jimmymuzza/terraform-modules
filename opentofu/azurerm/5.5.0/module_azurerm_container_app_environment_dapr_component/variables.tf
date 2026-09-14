variable "container_app_environment_dapr_components" {
  description = <<EOT
Map of container_app_environment_dapr_components, attributes below
Required:
    - component_type
    - container_app_environment_id
    - name
    - version
Optional:
    - ignore_errors
    - init_timeout
    - scopes
    - metadata
    - secret
EOT

  type = map(object({
    component_type               = string
    container_app_environment_id = string
    name                         = string
    version                      = string
    ignore_errors                = optional(bool)
    init_timeout                 = optional(string)
    scopes                       = optional(list(string))
    metadata                     = optional(list(object({
            name        = string
            secret_name = optional(string)
            value       = optional(string)
        })))
    secret                       = optional(set(object({
            name                = string
            identity            = optional(string)
            key_vault_secret_id = optional(string)
            value               = optional(string)
        })))
  }))
}
