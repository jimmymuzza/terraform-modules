resource "azurerm_maintenance_assignment_dedicated_host" "maintenance_assignment_dedicated_hosts" {
  for_each = var.maintenance_assignment_dedicated_hosts

  dedicated_host_id            = each.value.dedicated_host_id
  location                     = each.value.location
  maintenance_configuration_id = each.value.maintenance_configuration_id
}
