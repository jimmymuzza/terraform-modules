variable "chatbot_slack_channel_configurations" {
  description = <<EOT
Map of chatbot_slack_channel_configurations, attributes below
Required:
    - configuration_name
    - iam_role_arn
    - slack_channel_id
    - slack_team_id
Optional:
    - guardrail_policy_arns
    - logging_level
    - region
    - sns_topic_arns
    - tags
    - user_authorization_required
EOT

  type = map(object({
    configuration_name          = string
    iam_role_arn                = string
    slack_channel_id            = string
    slack_team_id               = string
    guardrail_policy_arns       = optional(list(string))
    logging_level               = optional(string)
    region                      = optional(string)
    sns_topic_arns              = optional(set(string))
    tags                        = optional(map(string))
    user_authorization_required = optional(bool)
  }))
}
