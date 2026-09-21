resource "azurerm_site_recovery_protection_container_mapping" "site_recovery_protection_container_mappings" {
  for_each = var.site_recovery_protection_container_mappings

  name                                      = each.value.name
  recovery_fabric_name                      = each.value.recovery_fabric_name
  recovery_replication_policy_id            = each.value.recovery_replication_policy_id
  recovery_source_protection_container_name = each.value.recovery_source_protection_container_name
  recovery_target_protection_container_id   = each.value.recovery_target_protection_container_id
  recovery_vault_name                       = each.value.recovery_vault_name
  resource_group_name                       = each.value.resource_group_name

  dynamic "automatic_update" {
    for_each = each.value.automatic_update != null ? each.value.automatic_update : []
    content {
      automation_account_id = automatic_update.value.automation_account_id
      authentication_type   = automatic_update.value.authentication_type
    }
  }
}
