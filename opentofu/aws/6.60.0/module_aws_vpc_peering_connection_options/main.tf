resource "aws_vpc_peering_connection_options" "vpc_peering_connection_options" {
  for_each = var.vpc_peering_connection_options

  vpc_peering_connection_id = each.value.vpc_peering_connection_id
  region                    = each.value.region

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
