resource "azurerm_cosmosdb_gremlin_graph" "cosmosdb_gremlin_graphs" {
  for_each = var.cosmosdb_gremlin_graphs

  account_name           = each.value.account_name
  database_name          = each.value.database_name
  name                   = each.value.name
  partition_key_path     = each.value.partition_key_path
  resource_group_name    = each.value.resource_group_name
  analytical_storage_ttl = each.value.analytical_storage_ttl
  default_ttl            = each.value.default_ttl
  partition_key_version  = each.value.partition_key_version
  throughput             = each.value.throughput

  dynamic "autoscale_settings" {
    for_each = each.value.autoscale_settings != null ? each.value.autoscale_settings : []
    content {
      max_throughput = autoscale_settings.value.max_throughput
    }
  }

  dynamic "conflict_resolution_policy" {
    for_each = each.value.conflict_resolution_policy != null ? each.value.conflict_resolution_policy : []
    content {
      mode                          = conflict_resolution_policy.value.mode
      conflict_resolution_path      = conflict_resolution_policy.value.conflict_resolution_path
      conflict_resolution_procedure = conflict_resolution_policy.value.conflict_resolution_procedure
    }
  }

  dynamic "index_policy" {
    for_each = each.value.index_policy != null ? each.value.index_policy : []
    content {
      indexing_mode  = index_policy.value.indexing_mode
      automatic      = index_policy.value.automatic
      excluded_paths = index_policy.value.excluded_paths
      included_paths = index_policy.value.included_paths

      dynamic "composite_index" {
        for_each = index_policy.value.composite_index != null ? index_policy.value.composite_index : []
        content {

          dynamic "index" {
            for_each = composite_index.value.index != null ? composite_index.value.index : []
            content {
              order = index.value.order
              path  = index.value.path
            }
          }
        }
      }

      dynamic "spatial_index" {
        for_each = index_policy.value.spatial_index != null ? index_policy.value.spatial_index : []
        content {
          path = spatial_index.value.path
        }
      }
    }
  }

  dynamic "unique_key" {
    for_each = each.value.unique_key != null ? each.value.unique_key : []
    content {
      paths = unique_key.value.paths
    }
  }
}
