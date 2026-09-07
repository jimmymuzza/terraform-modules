resource "aws_ivschat_logging_configuration" "ivschat_logging_configurations" {
  for_each = var.ivschat_logging_configurations

  name     = each.value.name
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all

  dynamic "destination_configuration" {
    for_each = each.value.destination_configuration != null ? each.value.destination_configuration : []
    content {

      dynamic "cloudwatch_logs" {
        for_each = destination_configuration.value.cloudwatch_logs != null ? destination_configuration.value.cloudwatch_logs : []
        content {
          log_group_name = cloudwatch_logs.value.log_group_name
        }
      }

      dynamic "firehose" {
        for_each = destination_configuration.value.firehose != null ? destination_configuration.value.firehose : []
        content {
          delivery_stream_name = firehose.value.delivery_stream_name
        }
      }

      dynamic "s3" {
        for_each = destination_configuration.value.s3 != null ? destination_configuration.value.s3 : []
        content {
          bucket_name = s3.value.bucket_name
        }
      }
    }
  }
}
