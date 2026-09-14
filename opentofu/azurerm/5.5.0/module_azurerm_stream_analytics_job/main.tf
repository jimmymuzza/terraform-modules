resource "azurerm_stream_analytics_job" "stream_analytics_jobs" {
  for_each = var.stream_analytics_jobs

  location                                 = each.value.location
  name                                     = each.value.name
  resource_group_name                      = each.value.resource_group_name
  transformation_query                     = each.value.transformation_query
  compatibility_level                      = each.value.compatibility_level
  content_storage_policy                   = each.value.content_storage_policy
  data_locale                              = each.value.data_locale
  events_late_arrival_max_delay_in_seconds = each.value.events_late_arrival_max_delay_in_seconds
  events_out_of_order_max_delay_in_seconds = each.value.events_out_of_order_max_delay_in_seconds
  events_out_of_order_policy               = each.value.events_out_of_order_policy
  output_error_policy                      = each.value.output_error_policy
  sku_name                                 = each.value.sku_name
  stream_analytics_cluster_id              = each.value.stream_analytics_cluster_id
  streaming_units                          = each.value.streaming_units
  tags                                     = each.value.tags
  type                                     = each.value.type

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "job_storage_account" {
    for_each = each.value.job_storage_account != null ? each.value.job_storage_account : []
    content {
      account_name        = job_storage_account.value.account_name
      account_key         = job_storage_account.value.account_key
      authentication_mode = job_storage_account.value.authentication_mode
    }
  }
}
