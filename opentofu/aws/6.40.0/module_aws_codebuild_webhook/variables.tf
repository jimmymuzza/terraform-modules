variable "codebuild_webhooks" {
  description = <<EOT
Map of codebuild_webhooks, attributes below
Required:
    - project_name
Optional:
    - branch_filter
    - build_type
    - manual_creation
    - region
    - filter_group
    - pull_request_build_policy
    - scope_configuration
EOT

  type = map(object({
    project_name              = string
    branch_filter             = optional(string)
    build_type                = optional(string)
    manual_creation           = optional(bool)
    region                    = optional(string)
    filter_group              = optional(set(object({
            filter = optional(list(object({
                pattern                 = string
                type                    = string
                exclude_matched_pattern = optional(bool)
            })))
        })))
    pull_request_build_policy = optional(list(object({
            requires_comment_approval = string
            approver_roles            = optional(set(string))
        })))
    scope_configuration       = optional(list(object({
            name   = string
            scope  = string
            domain = optional(string)
        })))
  }))
}
