resource "aws_glue_partition" "glue_partitions" {
  for_each = var.glue_partitions

  database_name    = each.value.database_name
  partition_values = each.value.partition_values
  table_name       = each.value.table_name
  catalog_id       = each.value.catalog_id
  parameters       = each.value.parameters
  region           = each.value.region

  dynamic "storage_descriptor" {
    for_each = each.value.storage_descriptor != null ? each.value.storage_descriptor : []
    content {
      additional_locations      = storage_descriptor.value.additional_locations
      bucket_columns            = storage_descriptor.value.bucket_columns
      compressed                = storage_descriptor.value.compressed
      input_format              = storage_descriptor.value.input_format
      location                  = storage_descriptor.value.location
      number_of_buckets         = storage_descriptor.value.number_of_buckets
      output_format             = storage_descriptor.value.output_format
      parameters                = storage_descriptor.value.parameters
      stored_as_sub_directories = storage_descriptor.value.stored_as_sub_directories

      dynamic "columns" {
        for_each = storage_descriptor.value.columns != null ? storage_descriptor.value.columns : []
        content {
          name    = columns.value.name
          comment = columns.value.comment
          type    = columns.value.type
        }
      }

      dynamic "ser_de_info" {
        for_each = storage_descriptor.value.ser_de_info != null ? storage_descriptor.value.ser_de_info : []
        content {
          name                  = ser_de_info.value.name
          parameters            = ser_de_info.value.parameters
          serialization_library = ser_de_info.value.serialization_library
        }
      }

      dynamic "skewed_info" {
        for_each = storage_descriptor.value.skewed_info != null ? storage_descriptor.value.skewed_info : []
        content {
          skewed_column_names               = skewed_info.value.skewed_column_names
          skewed_column_value_location_maps = skewed_info.value.skewed_column_value_location_maps
          skewed_column_values              = skewed_info.value.skewed_column_values
        }
      }

      dynamic "sort_columns" {
        for_each = storage_descriptor.value.sort_columns != null ? storage_descriptor.value.sort_columns : []
        content {
          column     = sort_columns.value.column
          sort_order = sort_columns.value.sort_order
        }
      }
    }
  }
}
