resource "aws_odb_cloud_exadata_infrastructure" "odb_cloud_exadata_infrastructures" {
  for_each = var.odb_cloud_exadata_infrastructures

  availability_zone_id             = each.value.availability_zone_id
  display_name                     = each.value.display_name
  shape                            = each.value.shape
  availability_zone                = each.value.availability_zone
  compute_count                    = each.value.compute_count
  customer_contacts_to_send_to_oci = each.value.customer_contacts_to_send_to_oci
  database_server_type             = each.value.database_server_type
  region                           = each.value.region
  storage_count                    = each.value.storage_count
  storage_server_type              = each.value.storage_server_type
  tags                             = each.value.tags

  dynamic "maintenance_window" {
    for_each = each.value.maintenance_window != null ? each.value.maintenance_window : []
    content {
      custom_action_timeout_in_mins    = maintenance_window.value.custom_action_timeout_in_mins
      is_custom_action_timeout_enabled = maintenance_window.value.is_custom_action_timeout_enabled
      patching_mode                    = maintenance_window.value.patching_mode
      preference                       = maintenance_window.value.preference
      days_of_week                     = maintenance_window.value.days_of_week
      hours_of_day                     = maintenance_window.value.hours_of_day
      lead_time_in_weeks               = maintenance_window.value.lead_time_in_weeks
      months                           = maintenance_window.value.months
      weeks_of_month                   = maintenance_window.value.weeks_of_month
    }
  }
}
