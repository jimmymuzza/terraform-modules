resource "azurerm_container_registry" "container_registries" {
  for_each = var.container_registries

  location                                     = each.value.location
  name                                         = each.value.name
  resource_group_name                          = each.value.resource_group_name
  sku                                          = each.value.sku
  admin_enabled                                = each.value.admin_enabled
  anonymous_pull_enabled                       = each.value.anonymous_pull_enabled
  azuread_authentication_as_arm_policy_enabled = each.value.azuread_authentication_as_arm_policy_enabled
  data_endpoint_enabled                        = each.value.data_endpoint_enabled
  encryption                                   = each.value.encryption
  export_policy_enabled                        = each.value.export_policy_enabled
  network_rule_bypass_for_tasks_enabled        = each.value.network_rule_bypass_for_tasks_enabled
  network_rule_bypass_option                   = each.value.network_rule_bypass_option
  network_rule_set                             = each.value.network_rule_set
  public_network_access_enabled                = each.value.public_network_access_enabled
  quarantine_policy_enabled                    = each.value.quarantine_policy_enabled
  retention_policy_in_days                     = each.value.retention_policy_in_days
  role_assignment_mode                         = each.value.role_assignment_mode
  tags                                         = each.value.tags
  zone_redundancy_enabled                      = each.value.zone_redundancy_enabled

  dynamic "georeplications" {
    for_each = each.value.georeplications != null ? each.value.georeplications : []
    content {
      global_endpoint_routing_enabled = georeplications.value.global_endpoint_routing_enabled
      location                        = georeplications.value.location
      tags                            = georeplications.value.tags
      zone_redundancy_enabled         = georeplications.value.zone_redundancy_enabled
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
