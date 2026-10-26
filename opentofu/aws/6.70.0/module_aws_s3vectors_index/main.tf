resource "aws_s3vectors_index" "s3vectors_indexes" {
  for_each = var.s3vectors_indexes

  data_type                = each.value.data_type
  dimension                = each.value.dimension
  distance_metric          = each.value.distance_metric
  index_name               = each.value.index_name
  vector_bucket_name       = each.value.vector_bucket_name
  encryption_configuration = each.value.encryption_configuration
  region                   = each.value.region
  tags                     = each.value.tags

  dynamic "metadata_configuration" {
    for_each = each.value.metadata_configuration != null ? each.value.metadata_configuration : []
    content {
      non_filterable_metadata_keys = metadata_configuration.value.non_filterable_metadata_keys
    }
  }
}
