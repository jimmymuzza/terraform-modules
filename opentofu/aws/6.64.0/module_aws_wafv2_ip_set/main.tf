resource "aws_wafv2_ip_set" "wafv2_ip_sets" {
  for_each = var.wafv2_ip_sets

  ip_address_version = each.value.ip_address_version
  scope              = each.value.scope
  addresses          = each.value.addresses
  description        = each.value.description
  name               = each.value.name
  name_prefix        = each.value.name_prefix
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all
}
