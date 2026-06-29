resource "azurerm_palo_alto_local_rulestack_certificate" "palo_alto_local_rulestack_certificates" {
  for_each = var.palo_alto_local_rulestack_certificates

  name                     = each.value.name
  rulestack_id             = each.value.rulestack_id
  audit_comment            = each.value.audit_comment
  description              = each.value.description
  key_vault_certificate_id = each.value.key_vault_certificate_id
  self_signed              = each.value.self_signed
}
