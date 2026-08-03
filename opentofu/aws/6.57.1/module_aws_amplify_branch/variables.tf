variable "amplify_branches" {
  description = <<EOT
Map of amplify_branches, attributes below
Required:
    - app_id
    - branch_name
Optional:
    - backend_environment_arn
    - basic_auth_credentials
    - description
    - display_name
    - enable_auto_build
    - enable_basic_auth
    - enable_notification
    - enable_performance_mode
    - enable_pull_request_preview
    - enable_skew_protection
    - environment_variables
    - framework
    - pull_request_environment_name
    - region
    - stage
    - tags
    - tags_all
    - ttl
EOT

  type = map(object({
    app_id                        = string
    branch_name                   = string
    backend_environment_arn       = optional(string)
    basic_auth_credentials        = optional(string)
    description                   = optional(string)
    display_name                  = optional(string)
    enable_auto_build             = optional(bool)
    enable_basic_auth             = optional(bool)
    enable_notification           = optional(bool)
    enable_performance_mode       = optional(bool)
    enable_pull_request_preview   = optional(bool)
    enable_skew_protection        = optional(bool)
    environment_variables         = optional(map(string))
    framework                     = optional(string)
    pull_request_environment_name = optional(string)
    region                        = optional(string)
    stage                         = optional(string)
    tags                          = optional(map(string))
    tags_all                      = optional(map(string))
    ttl                           = optional(string)
  }))
}
