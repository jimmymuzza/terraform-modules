resource "aws_xray_trace_segment_destination" "xray_trace_segment_destinations" {
  for_each = var.xray_trace_segment_destinations

  destination = each.value.destination
  region      = each.value.region
}
