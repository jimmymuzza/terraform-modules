variable "workspaces_directories" {
  description = <<EOT
Map of workspaces_directories, attributes below
Optional:
    - directory_id
    - ip_group_ids
    - region
    - subnet_ids
    - tags
    - tags_all
    - tenancy
    - user_identity_type
    - workspace_directory_description
    - workspace_directory_name
    - workspace_type
    - active_directory_config
    - certificate_based_auth_properties
    - saml_properties
    - self_service_permissions
    - workspace_access_properties
    - workspace_creation_properties
EOT

  type = map(object({
    directory_id                      = optional(string)
    ip_group_ids                      = optional(set(string))
    region                            = optional(string)
    subnet_ids                        = optional(set(string))
    tags                              = optional(map(string))
    tags_all                          = optional(map(string))
    tenancy                           = optional(string)
    user_identity_type                = optional(string)
    workspace_directory_description   = optional(string)
    workspace_directory_name          = optional(string)
    workspace_type                    = optional(string)
    active_directory_config           = optional(list(object({
            domain_name                = string
            service_account_secret_arn = string
        })))
    certificate_based_auth_properties = optional(list(object({
            certificate_authority_arn = optional(string)
            status                    = optional(string)
        })))
    saml_properties                   = optional(list(object({
            relay_state_parameter_name = optional(string)
            status                     = optional(string)
            user_access_url            = optional(string)
        })))
    self_service_permissions          = optional(list(object({
            change_compute_type  = optional(bool)
            increase_volume_size = optional(bool)
            rebuild_workspace    = optional(bool)
            restart_workspace    = optional(bool)
            switch_running_mode  = optional(bool)
        })))
    workspace_access_properties       = optional(list(object({
            device_type_android    = optional(string)
            device_type_chromeos   = optional(string)
            device_type_ios        = optional(string)
            device_type_linux      = optional(string)
            device_type_osx        = optional(string)
            device_type_web        = optional(string)
            device_type_windows    = optional(string)
            device_type_zeroclient = optional(string)
        })))
    workspace_creation_properties     = optional(list(object({
            custom_security_group_id            = optional(string)
            default_ou                          = optional(string)
            enable_internet_access              = optional(bool)
            enable_maintenance_mode             = optional(bool)
            user_enabled_as_local_administrator = optional(bool)
        })))
  }))
}
