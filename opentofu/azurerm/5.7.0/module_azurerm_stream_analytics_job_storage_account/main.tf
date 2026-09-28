resource "azurerm_stream_analytics_job_storage_account" "stream_analytics_job_storage_accounts" {
  for_each = var.stream_analytics_job_storage_accounts

  authentication_mode     = each.value.authentication_mode
  storage_account_name    = each.value.storage_account_name
  stream_analytics_job_id = each.value.stream_analytics_job_id
  storage_account_key     = each.value.storage_account_key
}
