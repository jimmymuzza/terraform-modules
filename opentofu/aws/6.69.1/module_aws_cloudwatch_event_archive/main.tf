resource "aws_cloudwatch_event_archive" "cloudwatch_event_archives" {
  for_each = var.cloudwatch_event_archives

  event_source_arn   = each.value.event_source_arn
  name               = each.value.name
  description        = each.value.description
  event_pattern      = each.value.event_pattern
  kms_key_identifier = each.value.kms_key_identifier
  region             = each.value.region
  retention_days     = each.value.retention_days
}
