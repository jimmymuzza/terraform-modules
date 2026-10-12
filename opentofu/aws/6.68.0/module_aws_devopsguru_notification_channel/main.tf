resource "aws_devopsguru_notification_channel" "devopsguru_notification_channels" {
  for_each = var.devopsguru_notification_channels

  region = each.value.region

  dynamic "filters" {
    for_each = each.value.filters != null ? each.value.filters : []
    content {
      message_types = filters.value.message_types
      severities    = filters.value.severities
    }
  }

  dynamic "sns" {
    for_each = each.value.sns != null ? each.value.sns : []
    content {
      topic_arn = sns.value.topic_arn
    }
  }
}
