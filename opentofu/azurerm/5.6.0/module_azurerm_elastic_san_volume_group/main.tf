resource "azurerm_elastic_san_volume_group" "elastic_san_volume_groups" {
  for_each = var.elastic_san_volume_groups

  elastic_san_id  = each.value.elastic_san_id
  name            = each.value.name
  encryption_type = each.value.encryption_type
  protocol_type   = each.value.protocol_type

  dynamic "encryption" {
    for_each = each.value.encryption != null ? each.value.encryption : []
    content {
      key_vault_key_id          = encryption.value.key_vault_key_id
      user_assigned_identity_id = encryption.value.user_assigned_identity_id
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "network_rule" {
    for_each = each.value.network_rule != null ? each.value.network_rule : []
    content {
      subnet_id = network_rule.value.subnet_id
      action    = network_rule.value.action
    }
  }
}
