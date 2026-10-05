resource "aws_ses_identity_notification_topic" "ses_identity_notification_topics" {
  for_each = var.ses_identity_notification_topics

  identity                 = each.value.identity
  notification_type        = each.value.notification_type
  include_original_headers = each.value.include_original_headers
  region                   = each.value.region
  topic_arn                = each.value.topic_arn
}
