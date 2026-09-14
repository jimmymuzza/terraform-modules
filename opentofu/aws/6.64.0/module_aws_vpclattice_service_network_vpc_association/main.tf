resource "aws_vpclattice_service_network_vpc_association" "vpclattice_service_network_vpc_associations" {
  for_each = var.vpclattice_service_network_vpc_associations

  service_network_identifier = each.value.service_network_identifier
  vpc_identifier             = each.value.vpc_identifier
  private_dns_enabled        = each.value.private_dns_enabled
  region                     = each.value.region
  security_group_ids         = each.value.security_group_ids
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all

  dynamic "dns_options" {
    for_each = each.value.dns_options != null ? each.value.dns_options : []
    content {
      private_dns_preference        = dns_options.value.private_dns_preference
      private_dns_specified_domains = dns_options.value.private_dns_specified_domains
    }
  }
}
