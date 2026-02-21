resource "aws_vpclattice_service_network_resource_association" "vpclattice_service_network_resource_associations" {
  for_each = var.vpclattice_service_network_resource_associations

  resource_configuration_identifier = each.value.resource_configuration_identifier
  service_network_identifier        = each.value.service_network_identifier
  private_dns_enabled               = each.value.private_dns_enabled
  region                            = each.value.region
  tags                              = each.value.tags
}
