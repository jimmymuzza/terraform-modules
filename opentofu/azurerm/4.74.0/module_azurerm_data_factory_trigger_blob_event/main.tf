resource "azurerm_data_factory_trigger_blob_event" "data_factory_trigger_blob_events" {
  for_each = var.data_factory_trigger_blob_events

  data_factory_id       = each.value.data_factory_id
  events                = each.value.events
  name                  = each.value.name
  storage_account_id    = each.value.storage_account_id
  activated             = each.value.activated
  additional_properties = each.value.additional_properties
  annotations           = each.value.annotations
  blob_path_begins_with = each.value.blob_path_begins_with
  blob_path_ends_with   = each.value.blob_path_ends_with
  description           = each.value.description
  ignore_empty_blobs    = each.value.ignore_empty_blobs

  dynamic "pipeline" {
    for_each = each.value.pipeline != null ? each.value.pipeline : []
    content {
      name       = pipeline.value.name
      parameters = pipeline.value.parameters
    }
  }
}
