resource "azurerm_api_management_api_release" "api_management_api_releases" {
  for_each = var.api_management_api_releases

  api_id = each.value.api_id
  name   = each.value.name
  notes  = each.value.notes
}
