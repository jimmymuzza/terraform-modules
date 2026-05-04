resource "aws_glue_catalog_table_optimizer" "glue_catalog_table_optimizers" {
  for_each = var.glue_catalog_table_optimizers

  catalog_id    = each.value.catalog_id
  database_name = each.value.database_name
  table_name    = each.value.table_name
  type          = each.value.type
  region        = each.value.region

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {
      enabled  = configuration.value.enabled
      role_arn = configuration.value.role_arn

      dynamic "orphan_file_deletion_configuration" {
        for_each = configuration.value.orphan_file_deletion_configuration != null ? configuration.value.orphan_file_deletion_configuration : []
        content {

          dynamic "iceberg_configuration" {
            for_each = orphan_file_deletion_configuration.value.iceberg_configuration != null ? orphan_file_deletion_configuration.value.iceberg_configuration : []
            content {
              location                             = iceberg_configuration.value.location
              orphan_file_retention_period_in_days = iceberg_configuration.value.orphan_file_retention_period_in_days
              run_rate_in_hours                    = iceberg_configuration.value.run_rate_in_hours
            }
          }
        }
      }

      dynamic "retention_configuration" {
        for_each = configuration.value.retention_configuration != null ? configuration.value.retention_configuration : []
        content {

          dynamic "iceberg_configuration" {
            for_each = retention_configuration.value.iceberg_configuration != null ? retention_configuration.value.iceberg_configuration : []
            content {
              clean_expired_files               = iceberg_configuration.value.clean_expired_files
              number_of_snapshots_to_retain     = iceberg_configuration.value.number_of_snapshots_to_retain
              run_rate_in_hours                 = iceberg_configuration.value.run_rate_in_hours
              snapshot_retention_period_in_days = iceberg_configuration.value.snapshot_retention_period_in_days
            }
          }
        }
      }
    }
  }
}
