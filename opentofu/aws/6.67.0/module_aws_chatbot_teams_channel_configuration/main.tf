resource "aws_chatbot_teams_channel_configuration" "chatbot_teams_channel_configurations" {
  for_each = var.chatbot_teams_channel_configurations

  channel_id                  = each.value.channel_id
  configuration_name          = each.value.configuration_name
  iam_role_arn                = each.value.iam_role_arn
  team_id                     = each.value.team_id
  tenant_id                   = each.value.tenant_id
  channel_name                = each.value.channel_name
  guardrail_policy_arns       = each.value.guardrail_policy_arns
  logging_level               = each.value.logging_level
  region                      = each.value.region
  sns_topic_arns              = each.value.sns_topic_arns
  tags                        = each.value.tags
  team_name                   = each.value.team_name
  user_authorization_required = each.value.user_authorization_required
}
