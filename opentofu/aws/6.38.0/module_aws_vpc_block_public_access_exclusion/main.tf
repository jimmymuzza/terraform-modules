resource "aws_vpc_block_public_access_exclusion" "vpc_block_public_access_exclusions" {
  for_each = var.vpc_block_public_access_exclusions

  internet_gateway_exclusion_mode = each.value.internet_gateway_exclusion_mode
  region                          = each.value.region
  subnet_id                       = each.value.subnet_id
  tags                            = each.value.tags
  vpc_id                          = each.value.vpc_id
}
