resource "aws_dynamodb_table_export" "dynamodb_table_exports" {
  for_each = var.dynamodb_table_exports

  s3_bucket         = each.value.s3_bucket
  table_arn         = each.value.table_arn
  export_format     = each.value.export_format
  export_time       = each.value.export_time
  export_type       = each.value.export_type
  region            = each.value.region
  s3_bucket_owner   = each.value.s3_bucket_owner
  s3_prefix         = each.value.s3_prefix
  s3_sse_algorithm  = each.value.s3_sse_algorithm
  s3_sse_kms_key_id = each.value.s3_sse_kms_key_id

  dynamic "incremental_export_specification" {
    for_each = each.value.incremental_export_specification != null ? each.value.incremental_export_specification : []
    content {
      export_from_time = incremental_export_specification.value.export_from_time
      export_to_time   = incremental_export_specification.value.export_to_time
      export_view_type = incremental_export_specification.value.export_view_type
    }
  }
}
