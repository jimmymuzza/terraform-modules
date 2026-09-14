resource "aws_docdb_event_subscription" "docdb_event_subscriptions" {
  for_each = var.docdb_event_subscriptions

  sns_topic_arn    = each.value.sns_topic_arn
  enabled          = each.value.enabled
  event_categories = each.value.event_categories
  name             = each.value.name
  name_prefix      = each.value.name_prefix
  region           = each.value.region
  source_ids       = each.value.source_ids
  source_type      = each.value.source_type
  tags             = each.value.tags
  tags_all         = each.value.tags_all
}
