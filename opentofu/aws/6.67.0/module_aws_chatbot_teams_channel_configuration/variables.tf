variable "chatbot_teams_channel_configurations" {
  description = <<EOT
Map of chatbot_teams_channel_configurations, attributes below
Required:
    - channel_id
    - configuration_name
    - iam_role_arn
    - team_id
    - tenant_id
Optional:
    - channel_name
    - guardrail_policy_arns
    - logging_level
    - region
    - sns_topic_arns
    - tags
    - team_name
    - user_authorization_required
EOT

  type = map(object({
    channel_id                  = string
    configuration_name          = string
    iam_role_arn                = string
    team_id                     = string
    tenant_id                   = string
    channel_name                = optional(string)
    guardrail_policy_arns       = optional(list(string))
    logging_level               = optional(string)
    region                      = optional(string)
    sns_topic_arns              = optional(set(string))
    tags                        = optional(map(string))
    team_name                   = optional(string)
    user_authorization_required = optional(bool)
  }))
}
