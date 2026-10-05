resource "aws_internet_gateway" "internet_gateways" {
  for_each = var.internet_gateways

  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all
  vpc_id   = each.value.vpc_id
}
