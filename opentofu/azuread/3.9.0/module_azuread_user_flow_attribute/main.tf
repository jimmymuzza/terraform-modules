resource "azuread_user_flow_attribute" "user_flow_attributes" {
  for_each = var.user_flow_attributes

  data_type    = each.value.data_type
  description  = each.value.description
  display_name = each.value.display_name
}
