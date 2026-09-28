resource "azurerm_palo_alto_local_rulestack_rule" "palo_alto_local_rulestack_rules" {
  for_each = var.palo_alto_local_rulestack_rules

  action                    = each.value.action
  applications              = each.value.applications
  name                      = each.value.name
  priority                  = each.value.priority
  rulestack_id              = each.value.rulestack_id
  audit_comment             = each.value.audit_comment
  decryption_rule_type      = each.value.decryption_rule_type
  description               = each.value.description
  enabled                   = each.value.enabled
  inspection_certificate_id = each.value.inspection_certificate_id
  logging_enabled           = each.value.logging_enabled
  negate_destination        = each.value.negate_destination
  negate_source             = each.value.negate_source
  protocol                  = each.value.protocol
  protocol_ports            = each.value.protocol_ports
  tags                      = each.value.tags

  dynamic "category" {
    for_each = each.value.category != null ? each.value.category : []
    content {
      custom_urls = category.value.custom_urls
      feeds       = category.value.feeds
    }
  }

  dynamic "destination" {
    for_each = each.value.destination != null ? each.value.destination : []
    content {
      cidrs                           = destination.value.cidrs
      countries                       = destination.value.countries
      feeds                           = destination.value.feeds
      local_rulestack_fqdn_list_ids   = destination.value.local_rulestack_fqdn_list_ids
      local_rulestack_prefix_list_ids = destination.value.local_rulestack_prefix_list_ids
    }
  }

  dynamic "source" {
    for_each = each.value.source != null ? each.value.source : []
    content {
      cidrs                           = source.value.cidrs
      countries                       = source.value.countries
      feeds                           = source.value.feeds
      local_rulestack_prefix_list_ids = source.value.local_rulestack_prefix_list_ids
    }
  }
}
