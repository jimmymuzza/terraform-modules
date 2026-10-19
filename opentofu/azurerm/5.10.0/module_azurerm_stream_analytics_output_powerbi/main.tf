resource "azurerm_stream_analytics_output_powerbi" "stream_analytics_output_powerbis" {
  for_each = var.stream_analytics_output_powerbis

  dataset                   = each.value.dataset
  group_id                  = each.value.group_id
  group_name                = each.value.group_name
  name                      = each.value.name
  stream_analytics_job_id   = each.value.stream_analytics_job_id
  table                     = each.value.table
  token_user_display_name   = each.value.token_user_display_name
  token_user_principal_name = each.value.token_user_principal_name
}
