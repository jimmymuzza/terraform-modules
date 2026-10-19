resource "aws_ec2_secondary_subnet" "ec2_secondary_subnets" {
  for_each = var.ec2_secondary_subnets

  ipv4_cidr_block      = each.value.ipv4_cidr_block
  secondary_network_id = each.value.secondary_network_id
  availability_zone    = each.value.availability_zone
  availability_zone_id = each.value.availability_zone_id
  region               = each.value.region
  tags                 = each.value.tags
}
