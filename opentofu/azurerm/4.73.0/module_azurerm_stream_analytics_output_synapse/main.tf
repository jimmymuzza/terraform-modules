resource "azurerm_stream_analytics_output_synapse" "stream_analytics_output_synapses" {
  for_each = var.stream_analytics_output_synapses

  database                  = each.value.database
  name                      = each.value.name
  password                  = each.value.password
  resource_group_name       = each.value.resource_group_name
  server                    = each.value.server
  stream_analytics_job_name = each.value.stream_analytics_job_name
  table                     = each.value.table
  user                      = each.value.user
}
