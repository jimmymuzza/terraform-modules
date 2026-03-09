resource "aws_glue_catalog_table" "glue_catalog_tables" {
  for_each = var.glue_catalog_tables

  database_name      = each.value.database_name
  name               = each.value.name
  catalog_id         = each.value.catalog_id
  description        = each.value.description
  owner              = each.value.owner
  parameters         = each.value.parameters
  region             = each.value.region
  retention          = each.value.retention
  table_type         = each.value.table_type
  view_expanded_text = each.value.view_expanded_text
  view_original_text = each.value.view_original_text

  dynamic "open_table_format_input" {
    for_each = each.value.open_table_format_input != null ? each.value.open_table_format_input : []
    content {

      dynamic "iceberg_input" {
        for_each = open_table_format_input.value.iceberg_input != null ? open_table_format_input.value.iceberg_input : []
        content {
          metadata_operation = iceberg_input.value.metadata_operation
          version            = iceberg_input.value.version
        }
      }
    }
  }

  dynamic "partition_index" {
    for_each = each.value.partition_index != null ? each.value.partition_index : []
    content {
      index_name = partition_index.value.index_name
      keys       = partition_index.value.keys
    }
  }

  dynamic "partition_keys" {
    for_each = each.value.partition_keys != null ? each.value.partition_keys : []
    content {
      name       = partition_keys.value.name
      comment    = partition_keys.value.comment
      parameters = partition_keys.value.parameters
      type       = partition_keys.value.type
    }
  }

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
          name       = columns.value.name
          comment    = columns.value.comment
          parameters = columns.value.parameters
          type       = columns.value.type
        }
      }

      dynamic "schema_reference" {
        for_each = storage_descriptor.value.schema_reference != null ? storage_descriptor.value.schema_reference : []
        content {
          schema_version_number = schema_reference.value.schema_version_number
          schema_version_id     = schema_reference.value.schema_version_id

          dynamic "schema_id" {
            for_each = schema_reference.value.schema_id != null ? schema_reference.value.schema_id : []
            content {
              registry_name = schema_id.value.registry_name
              schema_arn    = schema_id.value.schema_arn
              schema_name   = schema_id.value.schema_name
            }
          }
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

  dynamic "target_table" {
    for_each = each.value.target_table != null ? each.value.target_table : []
    content {
      catalog_id    = target_table.value.catalog_id
      database_name = target_table.value.database_name
      name          = target_table.value.name
      region        = target_table.value.region
    }
  }
}
