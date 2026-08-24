resource "azurerm_palo_alto_local_rulestack_fqdn_list" "palo_alto_local_rulestack_fqdn_lists" {
  for_each = var.palo_alto_local_rulestack_fqdn_lists

  fully_qualified_domain_names = each.value.fully_qualified_domain_names
  name                         = each.value.name
  rulestack_id                 = each.value.rulestack_id
  audit_comment                = each.value.audit_comment
  description                  = each.value.description
}
