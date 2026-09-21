resource "azurerm_api_management_gateway" "api_management_gateways" {
  for_each = var.api_management_gateways

  api_management_id = each.value.api_management_id
  name              = each.value.name
  description       = each.value.description

  dynamic "location_data" {
    for_each = each.value.location_data != null ? each.value.location_data : []
    content {
      name     = location_data.value.name
      city     = location_data.value.city
      district = location_data.value.district
      region   = location_data.value.region
    }
  }
}
