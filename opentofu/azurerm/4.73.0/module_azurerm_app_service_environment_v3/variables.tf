variable "app_service_environment_v3s" {
  description = <<EOT
Map of app_service_environment_v3s, attributes below
Required:
    - name
    - resource_group_name
    - subnet_id
Optional:
    - allow_new_private_endpoint_connections
    - dedicated_host_count
    - internal_load_balancing_mode
    - remote_debugging_enabled
    - tags
    - zone_redundant
    - cluster_setting
EOT

  type = map(object({
    name                                   = string
    resource_group_name                    = string
    subnet_id                              = string
    allow_new_private_endpoint_connections = optional(bool)
    dedicated_host_count                   = optional(number)
    internal_load_balancing_mode           = optional(string)
    remote_debugging_enabled               = optional(bool)
    tags                                   = optional(map(string))
    zone_redundant                         = optional(bool)
    cluster_setting                        = optional(list(object({
            name  = string
            value = string
        })))
  }))
}
