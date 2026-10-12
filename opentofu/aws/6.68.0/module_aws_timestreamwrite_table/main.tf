resource "aws_timestreamwrite_table" "timestreamwrite_tables" {
  for_each = var.timestreamwrite_tables

  database_name = each.value.database_name
  table_name    = each.value.table_name
  region        = each.value.region
  tags          = each.value.tags
  tags_all      = each.value.tags_all

  dynamic "magnetic_store_write_properties" {
    for_each = each.value.magnetic_store_write_properties != null ? each.value.magnetic_store_write_properties : []
    content {
      enable_magnetic_store_writes = magnetic_store_write_properties.value.enable_magnetic_store_writes

      dynamic "magnetic_store_rejected_data_location" {
        for_each = magnetic_store_write_properties.value.magnetic_store_rejected_data_location != null ? magnetic_store_write_properties.value.magnetic_store_rejected_data_location : []
        content {

          dynamic "s3_configuration" {
            for_each = magnetic_store_rejected_data_location.value.s3_configuration != null ? magnetic_store_rejected_data_location.value.s3_configuration : []
            content {
              bucket_name       = s3_configuration.value.bucket_name
              encryption_option = s3_configuration.value.encryption_option
              kms_key_id        = s3_configuration.value.kms_key_id
              object_key_prefix = s3_configuration.value.object_key_prefix
            }
          }
        }
      }
    }
  }

  dynamic "retention_properties" {
    for_each = each.value.retention_properties != null ? each.value.retention_properties : []
    content {
      magnetic_store_retention_period_in_days = retention_properties.value.magnetic_store_retention_period_in_days
      memory_store_retention_period_in_hours  = retention_properties.value.memory_store_retention_period_in_hours
    }
  }

  dynamic "schema" {
    for_each = each.value.schema != null ? each.value.schema : []
    content {

      dynamic "composite_partition_key" {
        for_each = schema.value.composite_partition_key != null ? schema.value.composite_partition_key : []
        content {
          type                  = composite_partition_key.value.type
          enforcement_in_record = composite_partition_key.value.enforcement_in_record
          name                  = composite_partition_key.value.name
        }
      }
    }
  }
}
