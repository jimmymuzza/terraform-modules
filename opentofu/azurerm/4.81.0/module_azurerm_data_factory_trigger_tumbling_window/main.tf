resource "azurerm_data_factory_trigger_tumbling_window" "data_factory_trigger_tumbling_windows" {
  for_each = var.data_factory_trigger_tumbling_windows

  data_factory_id       = each.value.data_factory_id
  frequency             = each.value.frequency
  interval              = each.value.interval
  name                  = each.value.name
  start_time            = each.value.start_time
  activated             = each.value.activated
  additional_properties = each.value.additional_properties
  annotations           = each.value.annotations
  delay                 = each.value.delay
  description           = each.value.description
  end_time              = each.value.end_time
  max_concurrency       = each.value.max_concurrency

  dynamic "pipeline" {
    for_each = each.value.pipeline != null ? each.value.pipeline : []
    content {
      name       = pipeline.value.name
      parameters = pipeline.value.parameters
    }
  }

  dynamic "retry" {
    for_each = each.value.retry != null ? each.value.retry : []
    content {
      count    = retry.value.count
      interval = retry.value.interval
    }
  }

  dynamic "trigger_dependency" {
    for_each = each.value.trigger_dependency != null ? each.value.trigger_dependency : []
    content {
      offset       = trigger_dependency.value.offset
      size         = trigger_dependency.value.size
      trigger_name = trigger_dependency.value.trigger_name
    }
  }
}
