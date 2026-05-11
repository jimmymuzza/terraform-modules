resource "aws_sns_topic_subscription" "sns_topic_subscriptions" {
  for_each = var.sns_topic_subscriptions

  endpoint                        = each.value.endpoint
  protocol                        = each.value.protocol
  topic_arn                       = each.value.topic_arn
  confirmation_timeout_in_minutes = each.value.confirmation_timeout_in_minutes
  delivery_policy                 = each.value.delivery_policy
  endpoint_auto_confirms          = each.value.endpoint_auto_confirms
  filter_policy                   = each.value.filter_policy
  filter_policy_scope             = each.value.filter_policy_scope
  raw_message_delivery            = each.value.raw_message_delivery
  redrive_policy                  = each.value.redrive_policy
  region                          = each.value.region
  replay_policy                   = each.value.replay_policy
  subscription_role_arn           = each.value.subscription_role_arn
}
