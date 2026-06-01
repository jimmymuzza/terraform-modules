variable "budgets_budget_actions" {
  description = <<EOT
Map of budgets_budget_actions, attributes below
Required:
    - action_type
    - approval_model
    - budget_name
    - execution_role_arn
    - notification_type
    - action_threshold
    - definition
    - subscriber
Optional:
    - account_id
    - tags
    - tags_all
EOT

  type = map(object({
    action_type        = string
    approval_model     = string
    budget_name        = string
    execution_role_arn = string
    notification_type  = string
    account_id         = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    action_threshold   = list(object({
            action_threshold_type  = string
            action_threshold_value = number
        }))
    definition         = list(object({
            iam_action_definition = optional(list(object({
                policy_arn = string
                groups     = optional(set(string))
                roles      = optional(set(string))
                users      = optional(set(string))
            })))
            scp_action_definition = optional(list(object({
                policy_id  = string
                target_ids = set(string)
            })))
            ssm_action_definition = optional(list(object({
                action_sub_type = string
                instance_ids    = set(string)
                region          = string
            })))
        }))
    subscriber         = set(object({
            address           = string
            subscription_type = string
        }))
  }))
}
