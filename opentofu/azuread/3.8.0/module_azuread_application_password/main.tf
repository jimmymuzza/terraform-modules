resource "azuread_application_password" "application_passwords" {
  for_each = var.application_passwords

  application_id      = each.value.application_id
  display_name        = each.value.display_name
  end_date            = each.value.end_date
  end_date_relative   = each.value.end_date_relative
  rotate_when_changed = each.value.rotate_when_changed
  start_date          = each.value.start_date
}
