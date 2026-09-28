resource "azurerm_cosmosdb_account" "cosmosdb_accounts" {
  for_each = var.cosmosdb_accounts

  location                              = each.value.location
  name                                  = each.value.name
  offer_type                            = each.value.offer_type
  resource_group_name                   = each.value.resource_group_name
  access_key_metadata_writes_enabled    = each.value.access_key_metadata_writes_enabled
  analytical_storage_enabled            = each.value.analytical_storage_enabled
  automatic_failover_enabled            = each.value.automatic_failover_enabled
  burst_capacity_enabled                = each.value.burst_capacity_enabled
  create_mode                           = each.value.create_mode
  default_identity_type                 = each.value.default_identity_type
  free_tier_enabled                     = each.value.free_tier_enabled
  ip_range_filter                       = each.value.ip_range_filter
  is_virtual_network_filter_enabled     = each.value.is_virtual_network_filter_enabled
  key_vault_key_id                      = each.value.key_vault_key_id
  kind                                  = each.value.kind
  local_authentication_enabled          = each.value.local_authentication_enabled
  minimal_tls_version                   = each.value.minimal_tls_version
  mongo_server_version                  = each.value.mongo_server_version
  multiple_write_locations_enabled      = each.value.multiple_write_locations_enabled
  network_acl_bypass_for_azure_services = each.value.network_acl_bypass_for_azure_services
  network_acl_bypass_ids                = each.value.network_acl_bypass_ids
  partition_merge_enabled               = each.value.partition_merge_enabled
  public_network_access_enabled         = each.value.public_network_access_enabled
  tags                                  = each.value.tags

  dynamic "analytical_storage" {
    for_each = each.value.analytical_storage != null ? each.value.analytical_storage : []
    content {
      schema_type = analytical_storage.value.schema_type
    }
  }

  dynamic "backup" {
    for_each = each.value.backup != null ? each.value.backup : []
    content {
      type                = backup.value.type
      interval_in_minutes = backup.value.interval_in_minutes
      retention_in_hours  = backup.value.retention_in_hours
      storage_redundancy  = backup.value.storage_redundancy
      tier                = backup.value.tier
    }
  }

  dynamic "capabilities" {
    for_each = each.value.capabilities != null ? each.value.capabilities : []
    content {
      name = capabilities.value.name
    }
  }

  dynamic "capacity" {
    for_each = each.value.capacity != null ? each.value.capacity : []
    content {
      total_throughput_limit = capacity.value.total_throughput_limit
    }
  }

  dynamic "consistency_policy" {
    for_each = each.value.consistency_policy != null ? each.value.consistency_policy : []
    content {
      consistency_level       = consistency_policy.value.consistency_level
      max_interval_in_seconds = consistency_policy.value.max_interval_in_seconds
      max_staleness_prefix    = consistency_policy.value.max_staleness_prefix
    }
  }

  dynamic "cors_rule" {
    for_each = each.value.cors_rule != null ? each.value.cors_rule : []
    content {
      allowed_headers    = cors_rule.value.allowed_headers
      allowed_methods    = cors_rule.value.allowed_methods
      allowed_origins    = cors_rule.value.allowed_origins
      exposed_headers    = cors_rule.value.exposed_headers
      max_age_in_seconds = cors_rule.value.max_age_in_seconds
    }
  }

  dynamic "geo_location" {
    for_each = each.value.geo_location != null ? each.value.geo_location : []
    content {
      failover_priority = geo_location.value.failover_priority
      location          = geo_location.value.location
      zone_redundant    = geo_location.value.zone_redundant
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "restore" {
    for_each = each.value.restore != null ? each.value.restore : []
    content {
      restore_timestamp_in_utc   = restore.value.restore_timestamp_in_utc
      source_cosmosdb_account_id = restore.value.source_cosmosdb_account_id
      tables_to_restore          = restore.value.tables_to_restore

      dynamic "database" {
        for_each = restore.value.database != null ? restore.value.database : []
        content {
          name             = database.value.name
          collection_names = database.value.collection_names
        }
      }

      dynamic "gremlin_database" {
        for_each = restore.value.gremlin_database != null ? restore.value.gremlin_database : []
        content {
          name        = gremlin_database.value.name
          graph_names = gremlin_database.value.graph_names
        }
      }
    }
  }

  dynamic "virtual_network_rule" {
    for_each = each.value.virtual_network_rule != null ? each.value.virtual_network_rule : []
    content {
      ignore_missing_vnet_service_endpoint = virtual_network_rule.value.ignore_missing_vnet_service_endpoint
    }
  }
}
