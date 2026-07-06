resource "aws_vpclattice_service_network" "vpclattice_service_networks" {
  for_each = var.vpclattice_service_networks

  name      = each.value.name
  auth_type = each.value.auth_type
  region    = each.value.region
  tags      = each.value.tags
  tags_all  = each.value.tags_all
}
