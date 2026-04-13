resource "aws_vpc_peering_connection_accepter" "vpc_peering_connection_accepters" {
  for_each = var.vpc_peering_connection_accepters

  vpc_peering_connection_id = each.value.vpc_peering_connection_id
  auto_accept               = each.value.auto_accept
  region                    = each.value.region
  tags                      = each.value.tags
  tags_all                  = each.value.tags_all

  dynamic "accepter" {
    for_each = each.value.accepter != null ? each.value.accepter : []
    content {
      allow_remote_vpc_dns_resolution = accepter.value.allow_remote_vpc_dns_resolution
    }
  }

  dynamic "requester" {
    for_each = each.value.requester != null ? each.value.requester : []
    content {
      allow_remote_vpc_dns_resolution = requester.value.allow_remote_vpc_dns_resolution
    }
  }
}
