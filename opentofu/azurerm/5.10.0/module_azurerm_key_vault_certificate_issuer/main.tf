resource "azurerm_key_vault_certificate_issuer" "key_vault_certificate_issuers" {
  for_each = var.key_vault_certificate_issuers

  key_vault_id  = each.value.key_vault_id
  name          = each.value.name
  provider_name = each.value.provider_name
  account_id    = each.value.account_id
  org_id        = each.value.org_id
  password      = each.value.password

  dynamic "admin" {
    for_each = each.value.admin != null ? each.value.admin : []
    content {
      email_address = admin.value.email_address
      first_name    = admin.value.first_name
      last_name     = admin.value.last_name
      phone         = admin.value.phone
    }
  }
}
