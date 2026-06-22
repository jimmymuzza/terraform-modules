resource "azurerm_oracle_exadata_infrastructure" "oracle_exadata_infrastructures" {
  for_each = var.oracle_exadata_infrastructures

  compute_count        = each.value.compute_count
  display_name         = each.value.display_name
  location             = each.value.location
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  shape                = each.value.shape
  storage_count        = each.value.storage_count
  zones                = each.value.zones
  customer_contacts    = each.value.customer_contacts
  database_server_type = each.value.database_server_type
  storage_server_type  = each.value.storage_server_type
  tags                 = each.value.tags

  dynamic "maintenance_window" {
    for_each = each.value.maintenance_window != null ? each.value.maintenance_window : []
    content {
      days_of_week       = maintenance_window.value.days_of_week
      hours_of_day       = maintenance_window.value.hours_of_day
      lead_time_in_weeks = maintenance_window.value.lead_time_in_weeks
      months             = maintenance_window.value.months
      patching_mode      = maintenance_window.value.patching_mode
      preference         = maintenance_window.value.preference
      weeks_of_month     = maintenance_window.value.weeks_of_month
    }
  }
}
