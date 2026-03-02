variable "app_service_source_control_slots" {
  description = <<EOT
Map of app_service_source_control_slots, attributes below
Required:
    - slot_id
Optional:
    - branch
    - repo_url
    - rollback_enabled
    - use_local_git
    - use_manual_integration
    - use_mercurial
    - github_action_configuration
EOT

  type = map(object({
    slot_id                     = string
    branch                      = optional(string)
    repo_url                    = optional(string)
    rollback_enabled            = optional(bool)
    use_local_git               = optional(bool)
    use_manual_integration      = optional(bool)
    use_mercurial               = optional(bool)
    github_action_configuration = optional(list(object({
            generate_workflow_file  = optional(bool)
            code_configuration      = optional(list(object({
                runtime_stack   = string
                runtime_version = string
            })))
            container_configuration = optional(list(object({
                image_name        = string
                registry_url      = string
                registry_password = optional(string)
                registry_username = optional(string)
            })))
        })))
  }))
}
