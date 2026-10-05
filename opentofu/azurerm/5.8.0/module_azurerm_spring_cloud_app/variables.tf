variable "spring_cloud_apps" {
  description = <<EOT
Map of spring_cloud_apps, attributes below
Required:
    - name
    - resource_group_name
    - service_name
Optional:
    - addon_json
    - https_only
    - is_public
    - public_endpoint_enabled
    - tls_enabled
    - custom_persistent_disk
    - identity
    - ingress_settings
    - persistent_disk
EOT

  type = map(object({
    name                    = string
    resource_group_name     = string
    service_name            = string
    addon_json              = optional(string)
    https_only              = optional(bool)
    is_public               = optional(bool)
    public_endpoint_enabled = optional(bool)
    tls_enabled             = optional(bool)
    custom_persistent_disk  = optional(list(object({
            mount_path        = string
            share_name        = string
            storage_name      = string
            mount_options     = optional(set(string))
            read_only_enabled = optional(bool)
        })))
    identity                = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    ingress_settings        = optional(list(object({
            backend_protocol        = optional(string)
            read_timeout_in_seconds = optional(number)
            send_timeout_in_seconds = optional(number)
            session_affinity        = optional(string)
            session_cookie_max_age  = optional(number)
        })))
    persistent_disk         = optional(list(object({
            size_in_gb = number
            mount_path = optional(string)
        })))
  }))
}
