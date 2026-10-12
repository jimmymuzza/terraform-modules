variable "cloudformation_stacks" {
  description = <<EOT
Map of cloudformation_stacks, attributes below
Required:
    - name
Optional:
    - capabilities
    - disable_rollback
    - iam_role_arn
    - notification_arns
    - on_failure
    - parameters
    - policy_body
    - policy_url
    - region
    - tags
    - tags_all
    - template_body
    - template_url
    - timeout_in_minutes
EOT

  type = map(object({
    name               = string
    capabilities       = optional(set(string))
    disable_rollback   = optional(bool)
    iam_role_arn       = optional(string)
    notification_arns  = optional(set(string))
    on_failure         = optional(string)
    parameters         = optional(map(string))
    policy_body        = optional(string)
    policy_url         = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    template_body      = optional(string)
    template_url       = optional(string)
    timeout_in_minutes = optional(number)
  }))
}
