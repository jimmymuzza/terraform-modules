resource "azurerm_servicebus_namespace" "servicebus_namespaces" {
  for_each = var.servicebus_namespaces

  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  sku                           = each.value.sku
  capacity                      = each.value.capacity
  local_auth_enabled            = each.value.local_auth_enabled
  minimum_tls_version           = each.value.minimum_tls_version
  premium_messaging_partitions  = each.value.premium_messaging_partitions
  public_network_access_enabled = each.value.public_network_access_enabled
  tags                          = each.value.tags

  dynamic "customer_managed_key" {
    for_each = each.value.customer_managed_key != null ? each.value.customer_managed_key : []
    content {
      identity_id                       = customer_managed_key.value.identity_id
      key_vault_key_id                  = customer_managed_key.value.key_vault_key_id
      infrastructure_encryption_enabled = customer_managed_key.value.infrastructure_encryption_enabled
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "network_rule_set" {
    for_each = each.value.network_rule_set != null ? each.value.network_rule_set : []
    content {
      default_action                = network_rule_set.value.default_action
      ip_rules                      = network_rule_set.value.ip_rules
      public_network_access_enabled = network_rule_set.value.public_network_access_enabled
      trusted_services_allowed      = network_rule_set.value.trusted_services_allowed

      dynamic "network_rules" {
        for_each = network_rule_set.value.network_rules != null ? network_rule_set.value.network_rules : []
        content {
          subnet_id                            = network_rules.value.subnet_id
          ignore_missing_vnet_service_endpoint = network_rules.value.ignore_missing_vnet_service_endpoint
        }
      }
    }
  }
}
