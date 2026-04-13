resource "aws_ec2_traffic_mirror_session" "ec2_traffic_mirror_sessions" {
  for_each = var.ec2_traffic_mirror_sessions

  network_interface_id     = each.value.network_interface_id
  session_number           = each.value.session_number
  traffic_mirror_filter_id = each.value.traffic_mirror_filter_id
  traffic_mirror_target_id = each.value.traffic_mirror_target_id
  description              = each.value.description
  packet_length            = each.value.packet_length
  region                   = each.value.region
  tags                     = each.value.tags
  tags_all                 = each.value.tags_all
  virtual_network_id       = each.value.virtual_network_id
}
