resource "aws_pinpoint_event_stream" "pinpoint_event_streams" {
  for_each = var.pinpoint_event_streams

  application_id         = each.value.application_id
  destination_stream_arn = each.value.destination_stream_arn
  role_arn               = each.value.role_arn
  region                 = each.value.region
}
