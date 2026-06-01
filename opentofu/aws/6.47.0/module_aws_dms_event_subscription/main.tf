resource "aws_dms_event_subscription" "dms_event_subscriptions" {
  for_each = var.dms_event_subscriptions

  event_categories = each.value.event_categories
  name             = each.value.name
  sns_topic_arn    = each.value.sns_topic_arn
  source_type      = each.value.source_type
  enabled          = each.value.enabled
  region           = each.value.region
  source_ids       = each.value.source_ids
  tags             = each.value.tags
  tags_all         = each.value.tags_all
}
