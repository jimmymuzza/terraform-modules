resource "azurerm_application_insights" "application_insights" {
  for_each = var.application_insights

  application_type                      = each.value.application_type
  location                              = each.value.location
  name                                  = each.value.name
  resource_group_name                   = each.value.resource_group_name
  daily_data_cap_in_gb                  = each.value.daily_data_cap_in_gb
  daily_data_cap_notifications_disabled = each.value.daily_data_cap_notifications_disabled
  daily_data_cap_notifications_enabled  = each.value.daily_data_cap_notifications_enabled
  disable_ip_masking                    = each.value.disable_ip_masking
  force_customer_storage_for_profiler   = each.value.force_customer_storage_for_profiler
  internet_ingestion_enabled            = each.value.internet_ingestion_enabled
  internet_query_enabled                = each.value.internet_query_enabled
  ip_masking_enabled                    = each.value.ip_masking_enabled
  local_authentication_disabled         = each.value.local_authentication_disabled
  local_authentication_enabled          = each.value.local_authentication_enabled
  retention_in_days                     = each.value.retention_in_days
  sampling_percentage                   = each.value.sampling_percentage
  tags                                  = each.value.tags
  workspace_id                          = each.value.workspace_id
}
