resource "azurerm_extended_custom_location" "extended_custom_locations" {
  for_each = var.extended_custom_locations

  cluster_extension_ids = each.value.cluster_extension_ids
  host_resource_id      = each.value.host_resource_id
  location              = each.value.location
  name                  = each.value.name
  namespace             = each.value.namespace
  resource_group_name   = each.value.resource_group_name
  display_name          = each.value.display_name
  host_type             = each.value.host_type

  dynamic "authentication" {
    for_each = each.value.authentication != null ? each.value.authentication : []
    content {
      value = authentication.value.value
      type  = authentication.value.type
    }
  }
}
