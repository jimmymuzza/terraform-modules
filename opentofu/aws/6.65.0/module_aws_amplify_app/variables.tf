variable "amplify_apps" {
  description = <<EOT
Map of amplify_apps, attributes below
Required:
    - name
Optional:
    - access_token
    - auto_branch_creation_patterns
    - basic_auth_credentials
    - build_spec
    - compute_role_arn
    - custom_headers
    - description
    - enable_auto_branch_creation
    - enable_basic_auth
    - enable_branch_auto_build
    - enable_branch_auto_deletion
    - environment_variables
    - iam_service_role_arn
    - oauth_token
    - platform
    - region
    - repository
    - tags
    - tags_all
    - auto_branch_creation_config
    - cache_config
    - custom_rule
    - job_config
EOT

  type = map(object({
    name                          = string
    access_token                  = optional(string)
    auto_branch_creation_patterns = optional(set(string))
    basic_auth_credentials        = optional(string)
    build_spec                    = optional(string)
    compute_role_arn              = optional(string)
    custom_headers                = optional(string)
    description                   = optional(string)
    enable_auto_branch_creation   = optional(bool)
    enable_basic_auth             = optional(bool)
    enable_branch_auto_build      = optional(bool)
    enable_branch_auto_deletion   = optional(bool)
    environment_variables         = optional(map(string))
    iam_service_role_arn          = optional(string)
    oauth_token                   = optional(string)
    platform                      = optional(string)
    region                        = optional(string)
    repository                    = optional(string)
    tags                          = optional(map(string))
    tags_all                      = optional(map(string))
    auto_branch_creation_config   = optional(list(object({
            basic_auth_credentials        = optional(string)
            build_spec                    = optional(string)
            enable_auto_build             = optional(bool)
            enable_basic_auth             = optional(bool)
            enable_performance_mode       = optional(bool)
            enable_pull_request_preview   = optional(bool)
            environment_variables         = optional(map(string))
            framework                     = optional(string)
            pull_request_environment_name = optional(string)
            stage                         = optional(string)
        })))
    cache_config                  = optional(list(object({
            type = string
        })))
    custom_rule                   = optional(list(object({
            source    = string
            target    = string
            condition = optional(string)
            status    = optional(string)
        })))
    job_config                    = optional(list(object({
            build_compute_type = optional(string)
        })))
  }))
}
