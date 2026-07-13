resource "aws_redshift_event_subscription" "redshift_event_subscriptions" {
  for_each = var.redshift_event_subscriptions

  name             = each.value.name
  sns_topic_arn    = each.value.sns_topic_arn
  enabled          = each.value.enabled
  event_categories = each.value.event_categories
  region           = each.value.region
  severity         = each.value.severity
  source_ids       = each.value.source_ids
  source_type      = each.value.source_type
  tags             = each.value.tags
  tags_all         = each.value.tags_all
}
