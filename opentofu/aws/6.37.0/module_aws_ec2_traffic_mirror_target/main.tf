resource "aws_ec2_traffic_mirror_target" "ec2_traffic_mirror_targets" {
  for_each = var.ec2_traffic_mirror_targets

  description                       = each.value.description
  gateway_load_balancer_endpoint_id = each.value.gateway_load_balancer_endpoint_id
  network_interface_id              = each.value.network_interface_id
  network_load_balancer_arn         = each.value.network_load_balancer_arn
  region                            = each.value.region
  tags                              = each.value.tags
  tags_all                          = each.value.tags_all
}
