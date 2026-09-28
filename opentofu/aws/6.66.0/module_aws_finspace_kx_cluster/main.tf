resource "aws_finspace_kx_cluster" "finspace_kx_clusters" {
  for_each = var.finspace_kx_clusters

  az_mode                = each.value.az_mode
  environment_id         = each.value.environment_id
  name                   = each.value.name
  release_label          = each.value.release_label
  type                   = each.value.type
  availability_zone_id   = each.value.availability_zone_id
  command_line_arguments = each.value.command_line_arguments
  description            = each.value.description
  execution_role         = each.value.execution_role
  initialization_script  = each.value.initialization_script
  region                 = each.value.region
  tags                   = each.value.tags
  tags_all               = each.value.tags_all

  dynamic "auto_scaling_configuration" {
    for_each = each.value.auto_scaling_configuration != null ? each.value.auto_scaling_configuration : []
    content {
      auto_scaling_metric        = auto_scaling_configuration.value.auto_scaling_metric
      max_node_count             = auto_scaling_configuration.value.max_node_count
      metric_target              = auto_scaling_configuration.value.metric_target
      min_node_count             = auto_scaling_configuration.value.min_node_count
      scale_in_cooldown_seconds  = auto_scaling_configuration.value.scale_in_cooldown_seconds
      scale_out_cooldown_seconds = auto_scaling_configuration.value.scale_out_cooldown_seconds
    }
  }

  dynamic "cache_storage_configurations" {
    for_each = each.value.cache_storage_configurations != null ? each.value.cache_storage_configurations : []
    content {
      size = cache_storage_configurations.value.size
      type = cache_storage_configurations.value.type
    }
  }

  dynamic "capacity_configuration" {
    for_each = each.value.capacity_configuration != null ? each.value.capacity_configuration : []
    content {
      node_count = capacity_configuration.value.node_count
      node_type  = capacity_configuration.value.node_type
    }
  }

  dynamic "code" {
    for_each = each.value.code != null ? each.value.code : []
    content {
      s3_bucket         = code.value.s3_bucket
      s3_key            = code.value.s3_key
      s3_object_version = code.value.s3_object_version
    }
  }

  dynamic "database" {
    for_each = each.value.database != null ? each.value.database : []
    content {
      database_name = database.value.database_name
      changeset_id  = database.value.changeset_id
      dataview_name = database.value.dataview_name

      dynamic "cache_configurations" {
        for_each = database.value.cache_configurations != null ? database.value.cache_configurations : []
        content {
          cache_type = cache_configurations.value.cache_type
          db_paths   = cache_configurations.value.db_paths
        }
      }
    }
  }

  dynamic "savedown_storage_configuration" {
    for_each = each.value.savedown_storage_configuration != null ? each.value.savedown_storage_configuration : []
    content {
      size        = savedown_storage_configuration.value.size
      type        = savedown_storage_configuration.value.type
      volume_name = savedown_storage_configuration.value.volume_name
    }
  }

  dynamic "scaling_group_configuration" {
    for_each = each.value.scaling_group_configuration != null ? each.value.scaling_group_configuration : []
    content {
      memory_reservation = scaling_group_configuration.value.memory_reservation
      node_count         = scaling_group_configuration.value.node_count
      scaling_group_name = scaling_group_configuration.value.scaling_group_name
      cpu                = scaling_group_configuration.value.cpu
      memory_limit       = scaling_group_configuration.value.memory_limit
    }
  }

  dynamic "tickerplant_log_configuration" {
    for_each = each.value.tickerplant_log_configuration != null ? each.value.tickerplant_log_configuration : []
    content {
      tickerplant_log_volumes = tickerplant_log_configuration.value.tickerplant_log_volumes
    }
  }

  dynamic "vpc_configuration" {
    for_each = each.value.vpc_configuration != null ? each.value.vpc_configuration : []
    content {
      ip_address_type    = vpc_configuration.value.ip_address_type
      security_group_ids = vpc_configuration.value.security_group_ids
      subnet_ids         = vpc_configuration.value.subnet_ids
      vpc_id             = vpc_configuration.value.vpc_id
    }
  }
}
