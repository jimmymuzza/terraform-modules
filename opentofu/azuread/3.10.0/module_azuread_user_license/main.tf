resource "azuread_user_license" "user_licenses" {
  for_each = var.user_licenses

  sku_id         = each.value.sku_id
  user_object_id = each.value.user_object_id
  disabled_plans = each.value.disabled_plans
}
