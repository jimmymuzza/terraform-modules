resource "aws_vpc_block_public_access_options" "vpc_block_public_access_options" {
  for_each = var.vpc_block_public_access_options

  internet_gateway_block_mode = each.value.internet_gateway_block_mode
  region                      = each.value.region
}
