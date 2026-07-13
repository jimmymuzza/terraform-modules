resource "azurerm_maintenance_assignment_dynamic_scope" "maintenance_assignment_dynamic_scopes" {
  for_each = var.maintenance_assignment_dynamic_scopes

  maintenance_configuration_id = each.value.maintenance_configuration_id
  name                         = each.value.name

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      locations       = filter.value.locations
      os_types        = filter.value.os_types
      resource_groups = filter.value.resource_groups
      resource_types  = filter.value.resource_types
      tag_filter      = filter.value.tag_filter

      dynamic "tags" {
        for_each = filter.value.tags != null ? filter.value.tags : []
        content {
          tag    = tags.value.tag
          values = tags.value.values
        }
      }
    }
  }
}
