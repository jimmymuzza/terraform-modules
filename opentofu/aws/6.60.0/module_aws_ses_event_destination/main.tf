resource "aws_ses_event_destination" "ses_event_destinations" {
  for_each = var.ses_event_destinations

  configuration_set_name = each.value.configuration_set_name
  matching_types         = each.value.matching_types
  name                   = each.value.name
  enabled                = each.value.enabled
  region                 = each.value.region

  dynamic "cloudwatch_destination" {
    for_each = each.value.cloudwatch_destination != null ? each.value.cloudwatch_destination : []
    content {
      default_value  = cloudwatch_destination.value.default_value
      dimension_name = cloudwatch_destination.value.dimension_name
      value_source   = cloudwatch_destination.value.value_source
    }
  }

  dynamic "kinesis_destination" {
    for_each = each.value.kinesis_destination != null ? each.value.kinesis_destination : []
    content {
      role_arn   = kinesis_destination.value.role_arn
      stream_arn = kinesis_destination.value.stream_arn
    }
  }

  dynamic "sns_destination" {
    for_each = each.value.sns_destination != null ? each.value.sns_destination : []
    content {
      topic_arn = sns_destination.value.topic_arn
    }
  }
}
