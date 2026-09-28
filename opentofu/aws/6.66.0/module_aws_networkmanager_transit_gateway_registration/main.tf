resource "aws_networkmanager_transit_gateway_registration" "networkmanager_transit_gateway_registrations" {
  for_each = var.networkmanager_transit_gateway_registrations

  global_network_id   = each.value.global_network_id
  transit_gateway_arn = each.value.transit_gateway_arn
}
