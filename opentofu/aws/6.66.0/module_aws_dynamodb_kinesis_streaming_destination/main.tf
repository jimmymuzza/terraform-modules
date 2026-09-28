resource "aws_dynamodb_kinesis_streaming_destination" "dynamodb_kinesis_streaming_destinations" {
  for_each = var.dynamodb_kinesis_streaming_destinations

  stream_arn                               = each.value.stream_arn
  table_name                               = each.value.table_name
  approximate_creation_date_time_precision = each.value.approximate_creation_date_time_precision
  region                                   = each.value.region
}
