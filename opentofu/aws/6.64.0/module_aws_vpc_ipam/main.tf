resource "aws_vpc_ipam" "vpc_ipams" {
  for_each = var.vpc_ipams

  cascade            = each.value.cascade
  description        = each.value.description
  enable_private_gua = each.value.enable_private_gua
  metered_account    = each.value.metered_account
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all
  tier               = each.value.tier

  dynamic "operating_regions" {
    for_each = each.value.operating_regions != null ? each.value.operating_regions : []
    content {
      region_name = operating_regions.value.region_name
    }
  }
}
