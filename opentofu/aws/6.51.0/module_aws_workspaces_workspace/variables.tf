variable "workspaces_workspaces" {
  description = <<EOT
Map of workspaces_workspaces, attributes below
Required:
    - bundle_id
    - directory_id
    - user_name
Optional:
    - region
    - root_volume_encryption_enabled
    - tags
    - tags_all
    - user_volume_encryption_enabled
    - volume_encryption_key
    - workspace_properties
EOT

  type = map(object({
    bundle_id                      = string
    directory_id                   = string
    user_name                      = string
    region                         = optional(string)
    root_volume_encryption_enabled = optional(bool)
    tags                           = optional(map(string))
    tags_all                       = optional(map(string))
    user_volume_encryption_enabled = optional(bool)
    volume_encryption_key          = optional(string)
    workspace_properties           = optional(list(object({
            compute_type_name                         = optional(string)
            root_volume_size_gib                      = optional(number)
            running_mode                              = optional(string)
            running_mode_auto_stop_timeout_in_minutes = optional(number)
            user_volume_size_gib                      = optional(number)
        })))
  }))
}
