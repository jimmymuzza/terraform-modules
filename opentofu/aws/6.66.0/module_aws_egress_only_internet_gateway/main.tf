resource "aws_egress_only_internet_gateway" "egress_only_internet_gateways" {
  for_each = var.egress_only_internet_gateways

  vpc_id   = each.value.vpc_id
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all
}
