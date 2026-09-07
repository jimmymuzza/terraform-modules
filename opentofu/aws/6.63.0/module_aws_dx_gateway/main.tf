resource "aws_dx_gateway" "dx_gateways" {
  for_each = var.dx_gateways

  amazon_side_asn = each.value.amazon_side_asn
  name            = each.value.name
  tags            = each.value.tags
  tags_all        = each.value.tags_all
}
