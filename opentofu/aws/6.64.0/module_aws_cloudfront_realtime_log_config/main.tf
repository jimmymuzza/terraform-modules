resource "aws_cloudfront_realtime_log_config" "cloudfront_realtime_log_configs" {
  for_each = var.cloudfront_realtime_log_configs

  fields        = each.value.fields
  name          = each.value.name
  sampling_rate = each.value.sampling_rate

  dynamic "endpoint" {
    for_each = each.value.endpoint != null ? each.value.endpoint : []
    content {
      stream_type = endpoint.value.stream_type

      dynamic "kinesis_stream_config" {
        for_each = endpoint.value.kinesis_stream_config != null ? endpoint.value.kinesis_stream_config : []
        content {
          role_arn   = kinesis_stream_config.value.role_arn
          stream_arn = kinesis_stream_config.value.stream_arn
        }
      }
    }
  }
}
