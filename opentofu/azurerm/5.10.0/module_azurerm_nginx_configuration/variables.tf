variable "nginx_configurations" {
  description = <<EOT
Map of nginx_configurations, attributes below
Required:
    - nginx_deployment_id
    - root_file
Optional:
    - package_data
    - config_file
    - protected_file
EOT

  type = map(object({
    nginx_deployment_id = string
    root_file           = string
    package_data        = optional(string)
    config_file         = optional(set(object({
            content      = string
            virtual_path = string
        })))
    protected_file      = optional(set(object({
            content      = string
            virtual_path = string
        })))
  }))
}
