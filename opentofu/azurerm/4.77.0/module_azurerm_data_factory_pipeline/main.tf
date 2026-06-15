resource "azurerm_data_factory_pipeline" "data_factory_pipelines" {
  for_each = var.data_factory_pipelines

  data_factory_id                = each.value.data_factory_id
  name                           = each.value.name
  activities_json                = each.value.activities_json
  annotations                    = each.value.annotations
  concurrency                    = each.value.concurrency
  description                    = each.value.description
  folder                         = each.value.folder
  moniter_metrics_after_duration = each.value.moniter_metrics_after_duration
  parameters                     = each.value.parameters
  variables                      = each.value.variables
}
