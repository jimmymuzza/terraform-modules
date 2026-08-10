resource "aws_glue_partition_index" "glue_partition_indexes" {
  for_each = var.glue_partition_indexes

  database_name = each.value.database_name
  table_name    = each.value.table_name
  catalog_id    = each.value.catalog_id
  region        = each.value.region

  dynamic "partition_index" {
    for_each = each.value.partition_index != null ? each.value.partition_index : []
    content {
      index_name = partition_index.value.index_name
      keys       = partition_index.value.keys
    }
  }
}
