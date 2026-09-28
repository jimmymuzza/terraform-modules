resource "aws_networkmonitor_probe" "networkmonitor_probes" {
  for_each = var.networkmonitor_probes

  destination      = each.value.destination
  monitor_name     = each.value.monitor_name
  protocol         = each.value.protocol
  source_arn       = each.value.source_arn
  destination_port = each.value.destination_port
  packet_size      = each.value.packet_size
  region           = each.value.region
  tags             = each.value.tags
}
