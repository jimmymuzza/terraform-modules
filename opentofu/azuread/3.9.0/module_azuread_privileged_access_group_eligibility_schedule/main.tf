resource "azuread_privileged_access_group_eligibility_schedule" "privileged_access_group_eligibility_schedules" {
  for_each = var.privileged_access_group_eligibility_schedules

  assignment_type      = each.value.assignment_type
  group_id             = each.value.group_id
  principal_id         = each.value.principal_id
  duration             = each.value.duration
  expiration_date      = each.value.expiration_date
  justification        = each.value.justification
  permanent_assignment = each.value.permanent_assignment
  start_date           = each.value.start_date
  ticket_number        = each.value.ticket_number
  ticket_system        = each.value.ticket_system
}
