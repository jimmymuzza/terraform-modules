resource "aws_ec2_secondary_network" "ec2_secondary_networks" {
  for_each = var.ec2_secondary_networks

  ipv4_cidr_block = each.value.ipv4_cidr_block
  network_type    = each.value.network_type
  region          = each.value.region
  tags            = each.value.tags
}
