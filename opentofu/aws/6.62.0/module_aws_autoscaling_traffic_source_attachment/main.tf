resource "aws_autoscaling_traffic_source_attachment" "autoscaling_traffic_source_attachments" {
  for_each = var.autoscaling_traffic_source_attachments

  autoscaling_group_name = each.value.autoscaling_group_name
  region                 = each.value.region

  dynamic "traffic_source" {
    for_each = each.value.traffic_source != null ? each.value.traffic_source : []
    content {
      identifier = traffic_source.value.identifier
      type       = traffic_source.value.type
    }
  }
}
