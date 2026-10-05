resource "azurerm_synapse_spark_pool" "synapse_spark_pools" {
  for_each = var.synapse_spark_pools

  name                                = each.value.name
  node_size                           = each.value.node_size
  node_size_family                    = each.value.node_size_family
  spark_version                       = each.value.spark_version
  synapse_workspace_id                = each.value.synapse_workspace_id
  cache_size                          = each.value.cache_size
  compute_isolation_enabled           = each.value.compute_isolation_enabled
  dynamic_executor_allocation_enabled = each.value.dynamic_executor_allocation_enabled
  max_executors                       = each.value.max_executors
  min_executors                       = each.value.min_executors
  node_count                          = each.value.node_count
  session_level_packages_enabled      = each.value.session_level_packages_enabled
  spark_events_folder                 = each.value.spark_events_folder
  spark_log_folder                    = each.value.spark_log_folder
  tags                                = each.value.tags

  dynamic "auto_pause" {
    for_each = each.value.auto_pause != null ? each.value.auto_pause : []
    content {
      delay_in_minutes = auto_pause.value.delay_in_minutes
    }
  }

  dynamic "auto_scale" {
    for_each = each.value.auto_scale != null ? each.value.auto_scale : []
    content {
      max_node_count = auto_scale.value.max_node_count
      min_node_count = auto_scale.value.min_node_count
    }
  }

  dynamic "library_requirement" {
    for_each = each.value.library_requirement != null ? each.value.library_requirement : []
    content {
      content  = library_requirement.value.content
      filename = library_requirement.value.filename
    }
  }

  dynamic "spark_config" {
    for_each = each.value.spark_config != null ? each.value.spark_config : []
    content {
      content  = spark_config.value.content
      filename = spark_config.value.filename
    }
  }
}
