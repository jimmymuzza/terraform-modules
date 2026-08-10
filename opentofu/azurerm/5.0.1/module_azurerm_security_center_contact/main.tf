resource "azurerm_security_center_contact" "security_center_contacts" {
  for_each = var.security_center_contacts

  alert_notifications = each.value.alert_notifications
  alerts_to_admins    = each.value.alerts_to_admins
  email               = each.value.email
  name                = each.value.name
  phone               = each.value.phone
}
