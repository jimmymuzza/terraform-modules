resource "aws_qldb_stream" "qldb_streams" {
  for_each = var.qldb_streams

  inclusive_start_time = each.value.inclusive_start_time
  ledger_name          = each.value.ledger_name
  role_arn             = each.value.role_arn
  stream_name          = each.value.stream_name
  exclusive_end_time   = each.value.exclusive_end_time
  region               = each.value.region
  tags                 = each.value.tags
  tags_all             = each.value.tags_all

  dynamic "kinesis_configuration" {
    for_each = each.value.kinesis_configuration != null ? each.value.kinesis_configuration : []
    content {
      stream_arn          = kinesis_configuration.value.stream_arn
      aggregation_enabled = kinesis_configuration.value.aggregation_enabled
    }
  }
}
