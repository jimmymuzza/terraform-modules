resource "aws_vpclattice_service_network_service_association" "vpclattice_service_network_service_associations" {
  for_each = var.vpclattice_service_network_service_associations

  service_identifier         = each.value.service_identifier
  service_network_identifier = each.value.service_network_identifier
  region                     = each.value.region
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all
}
