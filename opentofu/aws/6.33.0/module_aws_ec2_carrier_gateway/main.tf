resource "aws_ec2_carrier_gateway" "ec2_carrier_gateways" {
  for_each = var.ec2_carrier_gateways

  vpc_id   = each.value.vpc_id
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all
}
