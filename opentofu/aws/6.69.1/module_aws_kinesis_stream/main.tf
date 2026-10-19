resource "aws_kinesis_stream" "kinesis_streams" {
  for_each = var.kinesis_streams

  name                      = each.value.name
  arn                       = each.value.arn
  encryption_type           = each.value.encryption_type
  enforce_consumer_deletion = each.value.enforce_consumer_deletion
  kms_key_id                = each.value.kms_key_id
  max_record_size_in_kib    = each.value.max_record_size_in_kib
  region                    = each.value.region
  retention_period          = each.value.retention_period
  shard_count               = each.value.shard_count
  shard_level_metrics       = each.value.shard_level_metrics
  tags                      = each.value.tags
  tags_all                  = each.value.tags_all
  warm_throughput_mib_ps    = each.value.warm_throughput_mib_ps

  dynamic "stream_mode_details" {
    for_each = each.value.stream_mode_details != null ? each.value.stream_mode_details : []
    content {
      stream_mode = stream_mode_details.value.stream_mode
    }
  }
}
