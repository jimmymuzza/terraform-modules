resource "aws_vpc_route_server" "vpc_route_servers" {
  for_each = var.vpc_route_servers

  amazon_side_asn           = each.value.amazon_side_asn
  persist_routes            = each.value.persist_routes
  persist_routes_duration   = each.value.persist_routes_duration
  region                    = each.value.region
  sns_notifications_enabled = each.value.sns_notifications_enabled
  tags                      = each.value.tags
}
