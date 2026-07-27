variable "workspacesweb_user_settings" {
  description = <<EOT
Map of workspacesweb_user_settings, attributes below
Required:
    - copy_allowed
    - download_allowed
    - paste_allowed
    - print_allowed
    - upload_allowed
Optional:
    - additional_encryption_context
    - customer_managed_key
    - deep_link_allowed
    - disconnect_timeout_in_minutes
    - idle_disconnect_timeout_in_minutes
    - region
    - tags
    - cookie_synchronization_configuration
    - toolbar_configuration
EOT

  type = map(object({
    copy_allowed                         = string
    download_allowed                     = string
    paste_allowed                        = string
    print_allowed                        = string
    upload_allowed                       = string
    additional_encryption_context        = optional(map(string))
    customer_managed_key                 = optional(string)
    deep_link_allowed                    = optional(string)
    disconnect_timeout_in_minutes        = optional(number)
    idle_disconnect_timeout_in_minutes   = optional(number)
    region                               = optional(string)
    tags                                 = optional(map(string))
    cookie_synchronization_configuration = optional(list(object({
            allowlist = optional(list(object({
                domain = string
                name   = optional(string)
                path   = optional(string)
            })))
            blocklist = optional(list(object({
                domain = string
                name   = optional(string)
                path   = optional(string)
            })))
        })))
    toolbar_configuration                = optional(list(object({
            hidden_toolbar_items   = optional(list(string))
            max_display_resolution = optional(string)
            toolbar_type           = optional(string)
            visual_mode            = optional(string)
        })))
  }))
}
