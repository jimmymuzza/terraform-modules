resource "azurerm_ai_foundry" "ai_foundries" {
  for_each = var.ai_foundries

  key_vault_id                   = each.value.key_vault_id
  location                       = each.value.location
  name                           = each.value.name
  resource_group_name            = each.value.resource_group_name
  storage_account_id             = each.value.storage_account_id
  application_insights_id        = each.value.application_insights_id
  container_registry_id          = each.value.container_registry_id
  description                    = each.value.description
  friendly_name                  = each.value.friendly_name
  high_business_impact_enabled   = each.value.high_business_impact_enabled
  primary_user_assigned_identity = each.value.primary_user_assigned_identity
  public_network_access          = each.value.public_network_access
  tags                           = each.value.tags

  dynamic "encryption" {
    for_each = each.value.encryption != null ? each.value.encryption : []
    content {
      key_id                    = encryption.value.key_id
      key_vault_id              = encryption.value.key_vault_id
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

  dynamic "managed_network" {
    for_each = each.value.managed_network != null ? each.value.managed_network : []
    content {
      isolation_mode = managed_network.value.isolation_mode
    }
  }
}
