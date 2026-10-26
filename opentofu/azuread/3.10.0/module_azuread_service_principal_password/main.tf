resource "azuread_service_principal_password" "service_principal_passwords" {
  for_each = var.service_principal_passwords

  service_principal_id = each.value.service_principal_id
  display_name         = each.value.display_name
  end_date             = each.value.end_date
  end_date_relative    = each.value.end_date_relative
  rotate_when_changed  = each.value.rotate_when_changed
  start_date           = each.value.start_date
}
