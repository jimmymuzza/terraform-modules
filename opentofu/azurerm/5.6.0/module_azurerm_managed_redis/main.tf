resource "azurerm_managed_redis" "managed_redis" {
  for_each = var.managed_redis

  location                  = each.value.location
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  sku_name                  = each.value.sku_name
  high_availability_enabled = each.value.high_availability_enabled
  public_network_access     = each.value.public_network_access
  tags                      = each.value.tags

  dynamic "customer_managed_key" {
    for_each = each.value.customer_managed_key != null ? each.value.customer_managed_key : []
    content {
      key_vault_key_id          = customer_managed_key.value.key_vault_key_id
      user_assigned_identity_id = customer_managed_key.value.user_assigned_identity_id
    }
  }

  dynamic "default_database" {
    for_each = each.value.default_database != null ? each.value.default_database : []
    content {
      access_keys_authentication_enabled            = default_database.value.access_keys_authentication_enabled
      client_protocol                               = default_database.value.client_protocol
      clustering_policy                             = default_database.value.clustering_policy
      eviction_policy                               = default_database.value.eviction_policy
      geo_replication_group_name                    = default_database.value.geo_replication_group_name
      persistence_append_only_file_backup_frequency = default_database.value.persistence_append_only_file_backup_frequency
      persistence_redis_database_backup_frequency   = default_database.value.persistence_redis_database_backup_frequency

      dynamic "module" {
        for_each = default_database.value.module != null ? default_database.value.module : []
        content {
          name = module.value.name
          args = module.value.args
        }
      }
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
