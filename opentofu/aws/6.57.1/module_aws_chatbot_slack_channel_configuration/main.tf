resource "aws_chatbot_slack_channel_configuration" "chatbot_slack_channel_configurations" {
  for_each = var.chatbot_slack_channel_configurations

  configuration_name          = each.value.configuration_name
  iam_role_arn                = each.value.iam_role_arn
  slack_channel_id            = each.value.slack_channel_id
  slack_team_id               = each.value.slack_team_id
  guardrail_policy_arns       = each.value.guardrail_policy_arns
  logging_level               = each.value.logging_level
  region                      = each.value.region
  sns_topic_arns              = each.value.sns_topic_arns
  tags                        = each.value.tags
  user_authorization_required = each.value.user_authorization_required
}
