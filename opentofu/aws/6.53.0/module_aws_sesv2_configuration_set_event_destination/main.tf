resource "aws_sesv2_configuration_set_event_destination" "sesv2_configuration_set_event_destinations" {
  for_each = var.sesv2_configuration_set_event_destinations

  configuration_set_name = each.value.configuration_set_name
  event_destination_name = each.value.event_destination_name
  region                 = each.value.region

  dynamic "event_destination" {
    for_each = each.value.event_destination != null ? each.value.event_destination : []
    content {
      matching_event_types = event_destination.value.matching_event_types
      enabled              = event_destination.value.enabled

      dynamic "cloud_watch_destination" {
        for_each = event_destination.value.cloud_watch_destination != null ? event_destination.value.cloud_watch_destination : []
        content {

          dynamic "dimension_configuration" {
            for_each = cloud_watch_destination.value.dimension_configuration != null ? cloud_watch_destination.value.dimension_configuration : []
            content {
              default_dimension_value = dimension_configuration.value.default_dimension_value
              dimension_name          = dimension_configuration.value.dimension_name
              dimension_value_source  = dimension_configuration.value.dimension_value_source
            }
          }
        }
      }

      dynamic "event_bridge_destination" {
        for_each = event_destination.value.event_bridge_destination != null ? event_destination.value.event_bridge_destination : []
        content {
          event_bus_arn = event_bridge_destination.value.event_bus_arn
        }
      }

      dynamic "kinesis_firehose_destination" {
        for_each = event_destination.value.kinesis_firehose_destination != null ? event_destination.value.kinesis_firehose_destination : []
        content {
          delivery_stream_arn = kinesis_firehose_destination.value.delivery_stream_arn
          iam_role_arn        = kinesis_firehose_destination.value.iam_role_arn
        }
      }

      dynamic "pinpoint_destination" {
        for_each = event_destination.value.pinpoint_destination != null ? event_destination.value.pinpoint_destination : []
        content {
          application_arn = pinpoint_destination.value.application_arn
        }
      }

      dynamic "sns_destination" {
        for_each = event_destination.value.sns_destination != null ? event_destination.value.sns_destination : []
        content {
          topic_arn = sns_destination.value.topic_arn
        }
      }
    }
  }
}
