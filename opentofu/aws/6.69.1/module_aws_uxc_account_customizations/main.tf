resource "aws_uxc_account_customizations" "uxc_account_customizations" {
  for_each = var.uxc_account_customizations

  account_color    = each.value.account_color
  visible_regions  = each.value.visible_regions
  visible_services = each.value.visible_services
}
