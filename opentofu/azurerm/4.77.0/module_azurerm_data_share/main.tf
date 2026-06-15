resource "azurerm_data_share" "data_shares" {
  for_each = var.data_shares

  account_id  = each.value.account_id
  kind        = each.value.kind
  name        = each.value.name
  description = each.value.description
  terms       = each.value.terms

  dynamic "snapshot_schedule" {
    for_each = each.value.snapshot_schedule != null ? each.value.snapshot_schedule : []
    content {
      name       = snapshot_schedule.value.name
      recurrence = snapshot_schedule.value.recurrence
      start_time = snapshot_schedule.value.start_time
    }
  }
}
