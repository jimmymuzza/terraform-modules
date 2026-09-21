resource "aws_networkfirewall_firewall_transit_gateway_attachment_accepter" "networkfirewall_firewall_transit_gateway_attachment_accepters" {
  for_each = var.networkfirewall_firewall_transit_gateway_attachment_accepters

  transit_gateway_attachment_id = each.value.transit_gateway_attachment_id
  region                        = each.value.region
}
