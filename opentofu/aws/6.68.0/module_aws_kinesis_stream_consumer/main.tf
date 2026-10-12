resource "aws_kinesis_stream_consumer" "kinesis_stream_consumers" {
  for_each = var.kinesis_stream_consumers

  name       = each.value.name
  stream_arn = each.value.stream_arn
  region     = each.value.region
  tags       = each.value.tags
  tags_all   = each.value.tags_all
}
