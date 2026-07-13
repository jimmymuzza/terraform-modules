resource "azurerm_billing_account_cost_management_export" "billing_account_cost_management_exports" {
  for_each = var.billing_account_cost_management_exports

  billing_account_id           = each.value.billing_account_id
  name                         = each.value.name
  recurrence_period_end_date   = each.value.recurrence_period_end_date
  recurrence_period_start_date = each.value.recurrence_period_start_date
  recurrence_type              = each.value.recurrence_type
  active                       = each.value.active
  file_format                  = each.value.file_format

  dynamic "export_data_options" {
    for_each = each.value.export_data_options != null ? each.value.export_data_options : []
    content {
      time_frame = export_data_options.value.time_frame
      type       = export_data_options.value.type
    }
  }

  dynamic "export_data_storage_location" {
    for_each = each.value.export_data_storage_location != null ? each.value.export_data_storage_location : []
    content {
      container_id     = export_data_storage_location.value.container_id
      root_folder_path = export_data_storage_location.value.root_folder_path
    }
  }
}
