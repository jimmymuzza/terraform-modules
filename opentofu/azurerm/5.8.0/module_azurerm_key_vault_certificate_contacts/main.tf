resource "azurerm_key_vault_certificate_contacts" "key_vault_certificate_contacts" {
  for_each = var.key_vault_certificate_contacts

  key_vault_id = each.value.key_vault_id

  dynamic "contact" {
    for_each = each.value.contact != null ? each.value.contact : []
    content {
      email = contact.value.email
      name  = contact.value.name
      phone = contact.value.phone
    }
  }
}
