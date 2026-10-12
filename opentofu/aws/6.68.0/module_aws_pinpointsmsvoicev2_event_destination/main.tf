resource "aws_pinpointsmsvoicev2_event_destination" "pinpointsmsvoicev2_event_destinations" {
  for_each = var.pinpointsmsvoicev2_event_destinations

  configuration_set_name = each.value.configuration_set_name
  event_destination_name = each.value.event_destination_name
  matching_event_types   = each.value.matching_event_types
  enabled                = each.value.enabled
  region                 = each.value.region

  dynamic "cloudwatch_logs_destination" {
    for_each = each.value.cloudwatch_logs_destination != null ? each.value.cloudwatch_logs_destination : []
    content {
      iam_role_arn  = cloudwatch_logs_destination.value.iam_role_arn
      log_group_arn = cloudwatch_logs_destination.value.log_group_arn
    }
  }

  dynamic "kinesis_firehose_destination" {
    for_each = each.value.kinesis_firehose_destination != null ? each.value.kinesis_firehose_destination : []
    content {
      delivery_stream_arn = kinesis_firehose_destination.value.delivery_stream_arn
      iam_role_arn        = kinesis_firehose_destination.value.iam_role_arn
    }
  }

  dynamic "sns_destination" {
    for_each = each.value.sns_destination != null ? each.value.sns_destination : []
    content {
      topic_arn = sns_destination.value.topic_arn
    }
  }
}
