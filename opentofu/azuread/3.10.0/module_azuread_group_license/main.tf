resource "azuread_group_license" "group_licenses" {
  for_each = var.group_licenses

  group_object_id = each.value.group_object_id
  sku_id          = each.value.sku_id
  disabled_plans  = each.value.disabled_plans
}
