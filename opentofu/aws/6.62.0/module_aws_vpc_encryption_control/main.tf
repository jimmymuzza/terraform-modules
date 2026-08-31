resource "aws_vpc_encryption_control" "vpc_encryption_controls" {
  for_each = var.vpc_encryption_controls

  mode                                   = each.value.mode
  vpc_id                                 = each.value.vpc_id
  egress_only_internet_gateway_exclusion = each.value.egress_only_internet_gateway_exclusion
  elastic_file_system_exclusion          = each.value.elastic_file_system_exclusion
  internet_gateway_exclusion             = each.value.internet_gateway_exclusion
  lambda_exclusion                       = each.value.lambda_exclusion
  nat_gateway_exclusion                  = each.value.nat_gateway_exclusion
  region                                 = each.value.region
  tags                                   = each.value.tags
  virtual_private_gateway_exclusion      = each.value.virtual_private_gateway_exclusion
  vpc_lattice_exclusion                  = each.value.vpc_lattice_exclusion
  vpc_peering_exclusion                  = each.value.vpc_peering_exclusion
}
