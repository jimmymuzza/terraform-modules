resource "aws_glue_crawler" "glue_crawlers" {
  for_each = var.glue_crawlers

  database_name          = each.value.database_name
  name                   = each.value.name
  role                   = each.value.role
  classifiers            = each.value.classifiers
  configuration          = each.value.configuration
  description            = each.value.description
  region                 = each.value.region
  schedule               = each.value.schedule
  security_configuration = each.value.security_configuration
  table_prefix           = each.value.table_prefix
  tags                   = each.value.tags
  tags_all               = each.value.tags_all

  dynamic "catalog_target" {
    for_each = each.value.catalog_target != null ? each.value.catalog_target : []
    content {
      database_name       = catalog_target.value.database_name
      tables              = catalog_target.value.tables
      connection_name     = catalog_target.value.connection_name
      dlq_event_queue_arn = catalog_target.value.dlq_event_queue_arn
      event_queue_arn     = catalog_target.value.event_queue_arn
    }
  }

  dynamic "delta_target" {
    for_each = each.value.delta_target != null ? each.value.delta_target : []
    content {
      delta_tables              = delta_target.value.delta_tables
      write_manifest            = delta_target.value.write_manifest
      connection_name           = delta_target.value.connection_name
      create_native_delta_table = delta_target.value.create_native_delta_table
    }
  }

  dynamic "dynamodb_target" {
    for_each = each.value.dynamodb_target != null ? each.value.dynamodb_target : []
    content {
      path      = dynamodb_target.value.path
      scan_all  = dynamodb_target.value.scan_all
      scan_rate = dynamodb_target.value.scan_rate
    }
  }

  dynamic "hudi_target" {
    for_each = each.value.hudi_target != null ? each.value.hudi_target : []
    content {
      maximum_traversal_depth = hudi_target.value.maximum_traversal_depth
      paths                   = hudi_target.value.paths
      connection_name         = hudi_target.value.connection_name
      exclusions              = hudi_target.value.exclusions
    }
  }

  dynamic "iceberg_target" {
    for_each = each.value.iceberg_target != null ? each.value.iceberg_target : []
    content {
      maximum_traversal_depth = iceberg_target.value.maximum_traversal_depth
      paths                   = iceberg_target.value.paths
      connection_name         = iceberg_target.value.connection_name
      exclusions              = iceberg_target.value.exclusions
    }
  }

  dynamic "jdbc_target" {
    for_each = each.value.jdbc_target != null ? each.value.jdbc_target : []
    content {
      connection_name            = jdbc_target.value.connection_name
      path                       = jdbc_target.value.path
      enable_additional_metadata = jdbc_target.value.enable_additional_metadata
      exclusions                 = jdbc_target.value.exclusions
    }
  }

  dynamic "lake_formation_configuration" {
    for_each = each.value.lake_formation_configuration != null ? each.value.lake_formation_configuration : []
    content {
      account_id                     = lake_formation_configuration.value.account_id
      use_lake_formation_credentials = lake_formation_configuration.value.use_lake_formation_credentials
    }
  }

  dynamic "lineage_configuration" {
    for_each = each.value.lineage_configuration != null ? each.value.lineage_configuration : []
    content {
      crawler_lineage_settings = lineage_configuration.value.crawler_lineage_settings
    }
  }

  dynamic "mongodb_target" {
    for_each = each.value.mongodb_target != null ? each.value.mongodb_target : []
    content {
      connection_name = mongodb_target.value.connection_name
      path            = mongodb_target.value.path
      scan_all        = mongodb_target.value.scan_all
    }
  }

  dynamic "recrawl_policy" {
    for_each = each.value.recrawl_policy != null ? each.value.recrawl_policy : []
    content {
      recrawl_behavior = recrawl_policy.value.recrawl_behavior
    }
  }

  dynamic "s3_target" {
    for_each = each.value.s3_target != null ? each.value.s3_target : []
    content {
      path                = s3_target.value.path
      connection_name     = s3_target.value.connection_name
      dlq_event_queue_arn = s3_target.value.dlq_event_queue_arn
      event_queue_arn     = s3_target.value.event_queue_arn
      exclusions          = s3_target.value.exclusions
      sample_size         = s3_target.value.sample_size
    }
  }

  dynamic "schema_change_policy" {
    for_each = each.value.schema_change_policy != null ? each.value.schema_change_policy : []
    content {
      delete_behavior = schema_change_policy.value.delete_behavior
      update_behavior = schema_change_policy.value.update_behavior
    }
  }
}
