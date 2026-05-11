resource "aws_verifiedaccess_instance_logging_configuration" "verifiedaccess_instance_logging_configurations" {
  for_each = var.verifiedaccess_instance_logging_configurations

  verifiedaccess_instance_id = each.value.verifiedaccess_instance_id
  region                     = each.value.region

  dynamic "access_logs" {
    for_each = each.value.access_logs != null ? each.value.access_logs : []
    content {
      include_trust_context = access_logs.value.include_trust_context
      log_version           = access_logs.value.log_version

      dynamic "cloudwatch_logs" {
        for_each = access_logs.value.cloudwatch_logs != null ? access_logs.value.cloudwatch_logs : []
        content {
          enabled   = cloudwatch_logs.value.enabled
          log_group = cloudwatch_logs.value.log_group
        }
      }

      dynamic "kinesis_data_firehose" {
        for_each = access_logs.value.kinesis_data_firehose != null ? access_logs.value.kinesis_data_firehose : []
        content {
          enabled         = kinesis_data_firehose.value.enabled
          delivery_stream = kinesis_data_firehose.value.delivery_stream
        }
      }

      dynamic "s3" {
        for_each = access_logs.value.s3 != null ? access_logs.value.s3 : []
        content {
          enabled      = s3.value.enabled
          bucket_name  = s3.value.bucket_name
          bucket_owner = s3.value.bucket_owner
          prefix       = s3.value.prefix
        }
      }
    }
  }
}
