resource "azurerm_pim_active_role_assignment" "pim_active_role_assignments" {
  for_each = var.pim_active_role_assignments

  principal_id       = each.value.principal_id
  role_definition_id = each.value.role_definition_id
  scope              = each.value.scope
  justification      = each.value.justification

  dynamic "schedule" {
    for_each = each.value.schedule != null ? each.value.schedule : []
    content {
      start_date_time = schedule.value.start_date_time

      dynamic "expiration" {
        for_each = schedule.value.expiration != null ? schedule.value.expiration : []
        content {
          duration_days  = expiration.value.duration_days
          duration_hours = expiration.value.duration_hours
          end_date_time  = expiration.value.end_date_time
        }
      }
    }
  }

  dynamic "ticket" {
    for_each = each.value.ticket != null ? each.value.ticket : []
    content {
      number = ticket.value.number
      system = ticket.value.system
    }
  }
}
