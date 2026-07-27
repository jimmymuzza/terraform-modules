resource "azurerm_palo_alto_local_rulestack_prefix_list" "palo_alto_local_rulestack_prefix_lists" {
  for_each = var.palo_alto_local_rulestack_prefix_lists

  name          = each.value.name
  prefix_list   = each.value.prefix_list
  rulestack_id  = each.value.rulestack_id
  audit_comment = each.value.audit_comment
  description   = each.value.description
}
